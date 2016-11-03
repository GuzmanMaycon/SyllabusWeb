package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.junior.conexion.AccesoDB;
import com.junior.dao.design.IAsignaturaAperturadaDao;

public class AsignaturaAperturadaDao implements IAsignaturaAperturadaDao{

    protected AccesoDB db;

    public AsignaturaAperturadaDao()
    {
        db = new AccesoDB();
    }

    @Override
    public String obtenerNombreDeAsignaturaPorId(Integer id)
    {
        String nombre = null;
        String procedimiento_almacenado = "{ ? = call DEVUELVE_NOMBRE(?,?)}";
        Connection cn = db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimiento_almacenado);
                proc.registerOutParameter(1, Types.VARCHAR);

                proc.setString(2, "ASIG_APERT");
                proc.setString(3, id.toString());
                proc.executeQuery();

                nombre = proc.getString(1);
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

        return nombre;
    }
}
