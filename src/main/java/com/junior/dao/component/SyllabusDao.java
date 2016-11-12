package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.ISyllabus;
import com.junior.to.Syllabus;

public class SyllabusDao implements ISyllabus{
	@Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

	@Override
	public String agregarSyllabus(Syllabus syllabus) {
		String rpta = null;
        String procedimiento_almacenado = "{CALL Registrar_Syllabus(?,?,?)}";
        
        Connection cn = this.db.getConnection();
        
        if (cn != null) {
            try {
                CallableStatement cs = cn.prepareCall(procedimiento_almacenado);
                cs.setDate(1, (Date) syllabus.getFechaEntrega());
                cs.setDate(2, (Date)syllabus.getFechaAprobacion());
                cs.setInt(3, syllabus.getIdAsigAperturada());
                int inserto = cs.executeUpdate();

                if (inserto == 0) {
                    rpta = "Error";
                }
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
