package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.ISyllabusDao;
import com.junior.to.Bibliografia;
import com.junior.to.Syllabus;
import com.junior.to.Tema;

import oracle.jdbc.OracleTypes;

public class SyllabusDao implements ISyllabusDao{
    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    public String insertarSyllabus(Syllabus syllabus) {
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
                        if (inserto == 0)
                        {
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
                        if (inserto == 0)
                        {
                            return "Error al ingresar un tema";
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

}
