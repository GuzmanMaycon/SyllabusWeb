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
import com.junior.to.Bibliografia;
import com.junior.to.Periodo;
import com.junior.to.PlanDeEstudio;
import com.junior.to.Syllabus;
import com.junior.to.Tema;

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
                    syllabus.setId(rs.getInt("ID_SYLLABUS"));

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

    /**
     * Obtener el nombre de las asignaturas que coincidan con una cadena pasada por parametro
     * @param coordinadorId Id del coordinador
     * @return List<AsignaturaAperturadaTO> asignaturas del profesor donde es coordinador
     */
    @Override
    public List<AsignaturaAperturadaTO> buscarCoincidencias(String cadena) {
        List<AsignaturaAperturadaTO> coincidencias = new ArrayList<AsignaturaAperturadaTO>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.BUSCAR_ASIGNATURA_X_CADENA(?,?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("o_cursor", OracleTypes.CURSOR);
                proc.setString("p_cadena", cadena);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("o_cursor");

                while (rs.next()) {
                    AsignaturaAperturadaTO aperturada = new AsignaturaAperturadaTO();
                    Asignatura asignatura = new Asignatura();
                    asignatura.setId(rs.getInt("ID_ASIGNATURA"));
                    asignatura.setCodigo(rs.getString("CODIGO_ASIG"));
                    asignatura.setNombre(rs.getString("NOMBRE_ASIG"));
                    asignatura.setCreditaje(rs.getInt("CREDIT_ASIG"));
                    asignatura.setCiclo(rs.getInt("CICLO_ASIG"));

                    PlanDeEstudio plan = new PlanDeEstudio();
                    plan.setId(rs.getInt("ID_PLAN_ESTUDIO"));

                    asignatura.setPlan(plan);
                    asignatura.setRegimen(rs.getString("REGIMEN"));

                    aperturada.setAsignatura(asignatura);

                    Periodo periodo = new Periodo(rs.getInt("ID_PERIODO"),null, null, null, null);

                    aperturada.setPeriodo(periodo);
                    aperturada.setId(rs.getInt("ID_ASIG_APERT"));

                    coincidencias.add(aperturada);
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
        return coincidencias;
    }

    @Override
    public List<AsignaturaAperturadaTO> obtenerPorDirector(Integer escuelaId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public AsignaturaAperturadaTO obtenerPorId(Integer id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<AsignaturaAperturadaTO> obtenerPorCicloEapNombre(Integer IDEap, Integer ciclo, String nombre) {
        List<AsignaturaAperturadaTO> aperturadas = new ArrayList<AsignaturaAperturadaTO>();
        String procedimientoAlmacenado = "{ call PAC_CURSOR.LISTAR_ASIG_X_CICLO_EAP_NOMBRE(?,?,?,?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("o_cursor", OracleTypes.CURSOR);
                proc.setInt("p_eap", IDEap);
                proc.setInt("p_ciclo", ciclo);
                proc.setString("p_nombre", nombre);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("o_cursor");

                while (rs.next()) {
                    AsignaturaAperturadaTO aperturada = new AsignaturaAperturadaTO();
                    Asignatura asignatura = new Asignatura();
                    asignatura.setId(rs.getInt("ID_ASIGNATURA"));
                    asignatura.setCodigo(rs.getString("CODIGO"));
                    asignatura.setNombre(rs.getString("NOMBRE"));
                    asignatura.setCreditaje(rs.getInt("CREDITAJE"));
                    asignatura.setCiclo(rs.getInt("CICLO"));

                    PlanDeEstudio plan = new PlanDeEstudio();
                    plan.setId(rs.getInt("ID_PLAN_ESTUDIO"));

                    asignatura.setPlan(plan);
                    asignatura.setRegimen(rs.getString("REGIMEN"));

                    aperturada.setAsignatura(asignatura);

                    Periodo periodo = new Periodo(rs.getInt("ID_PERIODO"),null, null, null, null);

                    aperturada.setPeriodo(periodo);
                    aperturada.setId(rs.getInt("ID_ASIG_APERTURADA"));

                    aperturadas.add(aperturada);
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
        return aperturadas;
    }

	@Override
	public String asignarCoordinador(Integer asigAperturadaId, Integer docenteId) {
		String procRegCoordinador = "{ call REG_COORDINADOR_X_ASIG_APER(?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                /**
                 * Agregar id del coordinador a la tabla Asignatura aperturada 
                 */
                CallableStatement cs = cn.prepareCall(procRegCoordinador);
                cs.setInt("p_IDDocente", docenteId);
                cs.setInt("p_IDAsigAperturada", asigAperturadaId);
                cs.execute();

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

	@Override
	public List<AsignaturaAperturadaTO> obtenerPorPeriodo(Integer IDPeriodo) {
		// TODO Auto-generated method stub
		return null;
	}
}
