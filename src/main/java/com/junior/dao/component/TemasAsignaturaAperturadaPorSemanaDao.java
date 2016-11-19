package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.ITemasAsignaturaAperturadaPorSemanaDao;
import com.junior.to.Tema;

import oracle.jdbc.internal.OracleTypes;

public class TemasAsignaturaAperturadaPorSemanaDao implements ITemasAsignaturaAperturadaPorSemanaDao{
	
	@Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }
	
	@Override
	public List<Tema> obtenerTemasPorAsignaturaPorSemana(Integer idAsignaturaAperturada, Integer numeroSemana) {
		// TODO Auto-generated method stub
        ArrayList<Tema> temas = new ArrayList<Tema>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.TEMAS_ASIGNA_APER_x_SEMANA(?, ?)}";
        
        Connection cn = this.db.getConnection();
        
        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("o_cursor", OracleTypes.CURSOR);
                proc.setInt("p_id_asignatura_aperturada", idAsignaturaAperturada);
                proc.setInt("p_numero_semana", numeroSemana);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("o_cursor");
                
                while (rs.next()) {
                    Tema tema = new Tema();
                    
                    tema.setDescripcion(rs.getString("DESCRIPCION"));

                    temas.add(tema);
                    System.out.println(tema.getDescripcion());
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

        return temas;
	}
}

