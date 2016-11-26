package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IAsignaturaDao;
import com.junior.to.Asignatura;

import oracle.jdbc.internal.OracleTypes;

public class AsignaturaDao implements IAsignaturaDao {

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    public Asignatura obtenerAsignaturaPorAsigAperturada(Integer asigAperturadaId) {
        Asignatura asignatura = null;

        String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_ASIG_X_ASIG_APER(?, ?) }";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
                proc.setInt("ASIG_APER_ID", asigAperturadaId);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

                while (rs.next()) {
                    asignatura = new Asignatura();
                    asignatura.setId(rs.getInt("ID_ASIGNATURA"));
                    asignatura.setNombre(rs.getString("NOMBRE"));
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

        return asignatura;
    }

}
