package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IPeriodoDao;
import com.junior.to.Periodo;
import com.sun.xml.internal.ws.org.objectweb.asm.Type;

import oracle.jdbc.OracleTypes;

/**
 * DAO para Periodo actual usando Oracle
 * @author Lucero Liza
 * @version 1.0.1, 19-11-2016
 */
public class PeriodoDao implements IPeriodoDao{

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    public Integer obtenerIDPeriodoActual() {
        Integer IDPeriodoActual = 0;
        String procedimientoAlmacenado = "{ ? = call DEVUELVE_IDPERIODO_ACTUAL}";
        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter(1, Type.INT);
                proc.executeQuery();
                IDPeriodoActual = proc.getInt(1);

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
        return IDPeriodoActual;
    }

    @Override
    public Periodo obtenerPeriodoActual() {
        Periodo actualPeriodo = new Periodo();
        String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_PERIODO_ACTUAL(?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

                if (rs.next()) {
                    actualPeriodo.setAnio(rs.getInt("ANIO"));
                    actualPeriodo.setFechaInicio(rs.getDate("FECHA_INICIO"));
                    actualPeriodo.setFechaFin(rs.getDate("FECHA_FIN"));
                    actualPeriodo.setSemestre(rs.getInt("SEMESTRE"));
                    actualPeriodo.setId(rs.getInt("ID_PERIODO"));
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


        return actualPeriodo;
    }


}
