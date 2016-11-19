package com.junior.dao.component;

import java.util.ArrayList;
import java.util.List;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IBibliografiaDao;
import com.junior.dao.design.ISyllabusDao;
import com.junior.dao.design.ITemaDao;
import com.junior.to.Bibliografia;
import com.junior.to.EstadoSyllabus;
import com.junior.to.Syllabus;
import com.junior.to.Tema;

import oracle.jdbc.OracleTypes;

/**
 * @author JUNIOR CLAUDIO ZAVALETA
 */

public class SyllabusDao implements ISyllabusDao {

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    /**
     * Registra un nuevo Syllabus
     * @param syllabus objeto de tipo Syllabus que no posee ID
     * @return OK si es que se ha completado la operacion con exito
     */
    public String insertarSyllabus(Syllabus syllabus)
    {
        String procInsertarSyllabus = "{ call REG_SYLLABUS(?, ?)}";
        String procInsertarTema = "{ call REG_TEMA(?, ?, ?, ?)}";
        String procInsertarBibliografia = "{ call REG_REF_BIBLIO(?, ?, ?, ?, ?, ?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                /**
                 * Agregar el syllabus a la BD
                 */
                CallableStatement cs = cn.prepareCall(procInsertarSyllabus);
                cs.setInt("p_IDAsigAperturada", syllabus.getIdAsigAperturada());
                cs.registerOutParameter("p_ID", OracleTypes.NUMBER);
                cs.execute();
                syllabus.setId(cs.getInt("p_ID"));

                /**
                 * Agregar los temas del syllabus
                 */
                cs = cn.prepareCall(procInsertarTema) ;
                try {
                    for (Tema tema : syllabus.getTemas()) {
                        cs.setString("DESCRIPCION", tema.getDescripcion());
                        cs.setInt("UNIDAD", tema.getSemana());
                        cs.setInt("SEMANA", tema.getUnidad());
                        cs.setInt("ID_SYLLABUS", syllabus.getId());

                        int inserto = cs.executeUpdate();
                        if (inserto == 0) {
                            return "Error al ingresar un tema";
                        }
                    }
                } catch(SQLException ex) {
                    ex.printStackTrace();
                    return ex.getMessage();
                }
                /**
                 * Agregar la referencia bibliografia del syllabus
                 */
                cs = cn.prepareCall(procInsertarBibliografia);
                try {
                    for (Bibliografia libro : syllabus.getBibliografia()) {
                        cs.setString("AUTOR", libro.getAutor());
                        cs.setInt("ANIO_PUBLICACION", libro.getAnioPublicacion());
                        cs.setString("EDITORIAL", libro.getEditorial());
                        cs.setString("ISBN", libro.getIsbn());
                        cs.setString("TITULO", libro.getTitulo());
                        cs.setString("LUGAR_PUBLICACION", libro.getLugarPublicacion());
                        cs.setInt("ID_SYLLABUS", syllabus.getId());

                        int inserto = cs.executeUpdate();
                        if (inserto == 0) {
                            return "Error al ingresar un libro";
                        }
                    }
                } catch(SQLException ex) {
                    ex.printStackTrace();
                    return ex.getMessage();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
                return ex.getMessage();
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    return ex.getMessage();
                }
            }
        }

        return "OK";
    }


	@Override
	public String editarSyllabus(Syllabus syllabus) {

		//Parseo de java.util.date a java.sql.date
		java.sql.Date auxFechaEntrega = new java.sql.Date(syllabus.getFechaEntrega().getTime());
		java.sql.Date auxFechaAprobacion = new java.sql.Date(syllabus.getFechaEntrega().getTime());
		
		String rpta = null;
		String procEditarSyllabus = "{CALL EDITAR_SYLLABUS(?,?,?,?,?)}";
		Connection cn = db.getConnection();
		
		if(cn != null){
			try{
				CallableStatement cs = cn.prepareCall(procEditarSyllabus);
				cs.setInt(1, syllabus.getId());
				cs.setString(2, syllabus.getEstado() );
				cs.setDate(3, auxFechaEntrega);
				cs.setDate(4, auxFechaAprobacion);
				cs.setInt(5, syllabus.getIdAsigAperturada());
				
				
				//Editar Bibliografia
				IBibliografiaDao bibliografiaDAO = new BibliografiaDao();
				for(Bibliografia libro : syllabus.getBibliografia()){
					bibliografiaDAO.editarBibliografia(libro, syllabus.getId());
				}	
				/*
				//Editar Temas
				ITemaDao temaDAO = new TemaDao();
				for(Tema tema : syllabus.getTemas()){
					temaDAO.editarTema(tema, syllabus.getId());
				}	
				*/
				int actualizo = cs.executeUpdate();
				
				if(actualizo == 0){
						rpta = "ERROR";
				}
			}catch(SQLException ex){
				rpta = ex.getMessage();
			}finally{
				try{
					cn.close();
				}catch(SQLException e){
					rpta = e.getMessage();
				}
			}	
		}
		return rpta;
	}    
    
    @Override
    /**
     * Obtiene el estado del Syllabus de la asignatura aperturada
     * @param syllabus objeto de tipo Syllabus que no posee ID
     * @return OK si es que se ha completado la operacion con exito
     */
    public EstadoSyllabus obtenerEstadoPorAsigAperturadaId(Integer asigAperturadaId)
    {
        EstadoSyllabus estado = EstadoSyllabus.N;
        String procedimientoAlmacenado = "{ ? = call RET_ESTADO_SYLLABUS_X_APER(?)}";
        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter(1, Types.VARCHAR);

                proc.setString(2, asigAperturadaId.toString());
                proc.executeQuery();

                String resultado = proc.getString(1);
                if (resultado != null) {
                    estado = EstadoSyllabus.valueOf(resultado);
                }
            } catch(SQLException ex) {
                System.err.println(ex.getMessage());
            } finally {
                try {
                    cn.close();
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                }
            }
        }

        return estado;
    }

    @Override
	public Syllabus obtenerSyllabus(Integer syllabusId) {
		Syllabus syllabus = new Syllabus();
		List<Tema> temas = new ArrayList<Tema>();
		List<Bibliografia> bibliografia = new ArrayList<Bibliografia>();
		
		String procedimientoAlmacenado1 = "{ call PAC_CURSOR.RET_SYLLABUS(?, ?)}";
		String procedimientoAlmacenado2 = "{ call PAC_CURSOR.RET_TEMAS_X_SYLLABUS(?, ?)}";
		String procedimientoAlmacenado3 = "{ call PAC_CURSOR.RET_BIBLIOGRAFIA_X_SYLLABUS(?, ?)}";
		
		Connection cn = this.db.getConnection();
		
		if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado1);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);

                proc.setInt("p_id_syllabus", syllabusId);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");
                
                if (rs.next()) {
                	syllabus = new Syllabus();
                	syllabus.setId(syllabusId);
                    syllabus.setEstado(rs.getString("ESTADO_SYLLABUS"));
                    syllabus.setFechaEntrega(rs.getDate("FECHA_ENTREGA"));
                    syllabus.setFechaAprobacion(rs.getDate("FECHA_APROBACION"));
                    syllabus.setIdAsigAperturada(rs.getInt("ID_ASIG_APERTURADA"));
                    
                    proc = cn.prepareCall(procedimientoAlmacenado2);
                    proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);

                    proc.setInt("p_id_syllabus", syllabusId);
                    proc.execute();
                }
                
            } catch(SQLException ex) {
                System.err.println(ex.getMessage());
            } finally {
                try {
                    cn.close();
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                }
            }
        }
        
        return syllabus;
	}
    
}
