package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IAlumnoDao;

/**
 * @author Lucero Liza Puican
 */
public class AlumnoDao implements IAlumnoDao{

	@Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

	@Override
	public boolean perteneceAlGrupo(Integer idAlumno, Integer idGrupo) {
		System.out.println("Ejecutoando procedure");
		boolean pertenece = false;
		String procedimientoAlmacenado = "{ ? = call VALIDA_ALUMNO_X_GRUPO(?,?)}";
		
		Connection cn = this.db.getConnection();
		System.out.println("holi");
        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                System.out.println("fase 1");
                proc.registerOutParameter(1, Types.NUMERIC);
                
                System.out.println("fase 2");
                proc.setInt(2, idAlumno);
                System.out.println("fase 3");
                proc.setInt(3, idGrupo);
                proc.executeQuery();
                System.out.println("fase 4");
                int resultado = proc.getInt(1);
                System.out.println("holi" + resultado);
                if (resultado == 1) {
                    pertenece = true;
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
		return pertenece;
	}

}
