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
import com.junior.to.Syllabus;
import com.junior.to.Tema;
import com.junior.to.TipoClase;

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
	public List<Bibliografia> obtenerPorSyllabus(Syllabus syllabus) {
		List<Bibliografia> bibliografia = new ArrayList<Bibliografia>();
		
		String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_BIBLIOGRAFIA_X_SYLLABUS(?, ?)}";
		
		Connection cn = this.db.getConnection();
		
        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
                // -- 1 --
                proc.setInt("p_id_syllabus", 1);
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
                    
                    Syllabus syll = new Syllabus();                   
                    syll.setId(rs.getInt("ID_SYLLABUS"));
                                       
                    bibliografia.add(libro);                                                         
                    
                    System.out.println("Libro ID: " + libro.getId());
                    System.out.println("Titulo: " + libro.getTitulo());  
                    System.out.println("Autor: " + libro.getAutor());
                    System.out.println("Año Publicacion:" + libro.getAnioPublicacion());
                    System.out.println("Lugar Publicacion: " + libro.getLugarPublicacion());
                    System.out.println("Editorial: "+ libro.getEditorial());
                    System.out.println("ISBN:" + libro.getIsbn());
                    System.out.println("ID_SYLLABUS: "+ syll.getId());
                                       
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
}
