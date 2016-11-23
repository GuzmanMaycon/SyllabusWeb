package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IBibliografiaDao;
import com.junior.to.Bibliografia;
import oracle.jdbc.internal.OracleTypes;

public class BibliografiaDao implements IBibliografiaDao {

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    public String editarBibliografia(Bibliografia bibliografia, Integer idSyllabus) {

        String rpta = null;
        String procedimientoAlmacenado = "{CALL EDITAR_REF_BIBLIO(?,?,?,?,?,?,?,?)}";
        Connection cn = db.getConnection();

        if(cn != null){
            try{
                CallableStatement cs = cn.prepareCall(procedimientoAlmacenado);
                cs.setInt(1, bibliografia.getId());
                cs.setString(2,  bibliografia.getTitulo());
                cs.setString(3, bibliografia.getAutor());
                cs.setInt(4, bibliografia.getAnioPublicacion());
                cs.setString(5, bibliografia.getLugarPublicacion());
                cs.setString(6,  bibliografia.getEditorial());
                cs.setString(7, bibliografia.getIsbn());
                cs.setInt(8, idSyllabus);

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
    /**		Modificacion LPLP 20/11 8:08pm
     * Obtiene todas las referencias bibliograficas del syllabus
     * @param idyllabus ID del syllabus del cual se obtendran las referencias
     * @return List<Bibliografia> lista de todas las referencias bibliograficas del syllabus
     */
	public List<Bibliografia> obtenerPorSyllabus(Integer idSyllabus) {
        List<Bibliografia> bibliografia = new ArrayList<Bibliografia>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_BIBLIOGRAFIA_X_SYLLABUS(?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
                proc.setInt("p_id_syllabus", idSyllabus);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

                while (rs.next()) {
                    Bibliografia libro = new Bibliografia();
                    libro.setTitulo(rs.getString("TITULO"));
                    libro.setAutor(rs.getString("AUTOR"));
                    libro.setAnioPublicacion(rs.getInt("ANIO_PUBLICACION"));
                    libro.setLugarPublicacion(rs.getString("LUGAR_PUBLICACION"));
                    libro.setEditorial(rs.getString("EDITORIAL"));
                    libro.setIsbn(rs.getString("ISBN"));
                    libro.setId(rs.getInt("ID_REFERENCIA"));

                    bibliografia.add(libro);

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

        return bibliografia;

    }

    @Override
    public String eliminarBibliografia(Bibliografia bibliografia) {
        String rpta = null;
        Connection cn = db.getConnection();
        String procedimientoAlmacenado = "{CALL ELIMINAR_BIBLIOGRAFIA(?)}";

        if (cn != null) {
            try {
                CallableStatement cs = cn.prepareCall(procedimientoAlmacenado);
                cs.setInt(1, bibliografia.getId());
                cs.executeUpdate();
            } catch (SQLException ex) {
                rpta = ex.getMessage();
            } finally {
                try {
                    cn.close();
                } catch (SQLException e) {
                    rpta = e.getMessage();
                }
            }
        }
        return rpta;
    }

	@Override
	/**
     * Actualiza todas las referencias bibliograficas del Syllabus (Elimina y Actualiza)
     * @param idyllabus ID del syllabus a modificar
     * @param List<Bibliografia> lista de todas las referencias bibliograficas del syllabus
     * @return rpta null si es que se ha completado la operacion con exito
     */
	public String actualizarRefBibliograficasDelSyllabus(Integer idSyllabus, List<Bibliografia> listaBibliografiaNueva) {
		
		String rpta = null;

		try{
			//Eliminamos todas las referencias del syllabus
			List<Bibliografia> listaBibliografiaActual = obtenerPorSyllabus(idSyllabus);	
			for(Bibliografia libro : listaBibliografiaActual){
				rpta = eliminarBibliografia(libro);
			}
			
			//Insertamos las nuevas referencias
			for(Bibliografia libro : listaBibliografiaNueva){
				rpta = insertarBibliografia(libro, idSyllabus);
			}
		}catch(Exception e){
			rpta += e.getMessage();
		}
		
		return rpta;
	}

	@Override
	/**
     * Registra la bibliografia del syllabus en la base de datos
     * @param idyllabus ID del syllabus del cual se registrara su referencia
     * @param bibliografia Objeto bibliografia a registrar en el syllabus
     * @return rpta null si es que se ha completado la operacion con exito
     */
	public String insertarBibliografia(Bibliografia bibliografia, Integer idSyllabus) {
        String rpta = null;
		Connection cn = db.getConnection();
        String procedimientoAlmacenado = "{ call REG_REF_BIBLIO(?, ?, ?, ?, ?, ?, ?)}";
        
        try {
        	CallableStatement cs = cn.prepareCall(procedimientoAlmacenado);
            
        	cs.setString("AUTOR", bibliografia.getAutor());
            cs.setInt("ANIO_PUBLICACION", bibliografia.getAnioPublicacion());
            cs.setString("EDITORIAL", bibliografia.getEditorial());
            cs.setString("ISBN", bibliografia.getIsbn());
            cs.setString("TITULO", bibliografia.getTitulo());
            cs.setString("LUGAR_PUBLICACION", bibliografia.getLugarPublicacion());
            cs.setInt("ID_SYLLABUS", idSyllabus);

            int inserto = cs.executeUpdate();
            if (inserto == 0) {
            	rpta = "Error al ingresar un libro";
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
            rpta = ex.getMessage();
        }
        return rpta;
	}
}
