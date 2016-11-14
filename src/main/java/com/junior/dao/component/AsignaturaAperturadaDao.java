package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.to.Asignatura;
import com.junior.to.AsignaturaAperturadaTO;
import com.junior.to.PlanDeEstudio;
import com.junior.to.Syllabus;

import oracle.jdbc.internal.OracleTypes;

/**
 * DAO para Asignaturass aperturadas usando Oracle
 * @author Junior Claudio
 * @version 1.0.1, 11-11-2016
 */
public class AsignaturaAperturadaDao implements IAsignaturaAperturadaDao{

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    /**
     * Devuelve el nombre de la asignatura aperturada
     * @param id Id de la Asignatura Aperturada
     */
    @Override
    public String obtenerNombreDeAsignaturaPorId(Integer id)
    {
        String nombre = null;
        String procedimientoAlmacenado = "{ ? = call DEVUELVE_NOMBRE_ASIG_APER(?)}";
        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter(1, Types.VARCHAR);

                proc.setString(2, id.toString());
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

    /**
     * Obtener las asignaturas en las cuales el profesor esta asignado como coordinador
     * @param coordinadorId Id del coordinador
     * @return List<AsignaturaAperturadaTO> asignaturas del profesor donde es coordinador
     */
    @Override
    public List<AsignaturaAperturadaTO> obtenerPorCoordinador(Integer coordinadorId) {
        // TODO Auto-generated method stub
        ArrayList<AsignaturaAperturadaTO> asignaturas = new ArrayList<AsignaturaAperturadaTO>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.LISTAR_ASIG_X_COORD(?, ?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("o_cursor", OracleTypes.CURSOR);
                proc.setInt("p_IDCoordinador", coordinadorId);
                proc.setInt("p_IDPeriodo", 6);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("o_cursor");

                while (rs.next()) {
                    AsignaturaAperturadaTO asignaturaAperturada = new AsignaturaAperturadaTO();

                    PlanDeEstudio plan = new PlanDeEstudio();
                    plan.setNombre(rs.getString("PLAN_NOMBRE"));

                    Asignatura asignatura = new Asignatura(plan);
                    asignatura.setNombre(rs.getString("ASIG_NOMBRE"));

                    Syllabus syllabus = new Syllabus();
                    syllabus.setEstado(rs.getString("ESTADO_SYLLABUS"));

                    asignaturaAperturada.setId(rs.getInt("ID_ASIG_APERTURADA"));
                    asignaturaAperturada.setAsignatura(asignatura);
                    asignaturaAperturada.setSyllabus(syllabus);

                    asignaturas.add(asignaturaAperturada);
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

        return asignaturas;
    }

    @Override
    public List<AsignaturaAperturadaTO> obtenerPorDirector(Integer escuelaId)
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<AsignaturaAperturadaTO> obtenerPorAlumno(Integer codigo)
    {
        ArrayList<AsignaturaAperturadaTO> asignaturas = new ArrayList<AsignaturaAperturadaTO>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.LISTAR_ASIG_AP_X_ALUMNO(?, ?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("o_cursor", OracleTypes.CURSOR);
                proc.setInt("ID_ALUM", codigo);
                proc.setInt("PERIOD", 6);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("o_cursor");

                while (rs.next()) {
                    AsignaturaAperturadaTO asignaturaAperturada = new AsignaturaAperturadaTO();
                    Asignatura asignatura = new Asignatura();
                    asignatura.setNombre(rs.getString("ASIG_NOMBRE"));
                    asignaturaAperturada.setId(rs.getInt("ID_ASIG_APERTURADA"));
                    asignaturaAperturada.setAsignatura(asignatura);

                    asignaturas.add(asignaturaAperturada);
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

        return asignaturas;
    }
}
