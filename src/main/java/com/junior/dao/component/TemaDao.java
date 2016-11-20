package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.ITemaDao;
import com.junior.to.Syllabus;
import com.junior.to.Tema;
import com.junior.to.TipoClase;

import oracle.jdbc.internal.OracleTypes;

/**
 * DAO para Temas usando Oracle
 * @author Thalia Quiroz
 * @version 1.0.1, 18-11-2016
 */
public class TemaDao implements ITemaDao {

	@Autowired
	protected IAccesoDB db;

	public void setDb(IAccesoDB db) {
		this.db = db;
	}

    /**
     * Devuelve todos los temas correspondientes a un syllabus
     * @param syllabus Objeto syllabus de referencia
     * @return List<TemaTO> temas registrados en el syllabus
     */
	@Override
	public List<Tema> obtenerTodos(Syllabus syllabus) {

		List<Tema> temas = new ArrayList<Tema>();

		String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_TEMAS_X_SYLLABUS(?, ?)}";

		Connection cn = this.db.getConnection();

		if (cn != null) {
			try {
				CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
				proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
				// -- 1 --
				proc.setInt("p_id_syllabus", syllabus.getId());
				proc.execute();

				ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

				while (rs.next()) {
					Tema tema = new Tema();
					tema.setDescripcion(rs.getString("DESCRIPCION"));
					tema.setUnidad(rs.getInt("UNIDAD"));
					tema.setSemana(rs.getInt("SEMANA"));

					TipoClase tipoClase = new TipoClase();
					tipoClase.setId(rs.getInt("ID_TIPO"));

					Syllabus syll = new Syllabus();
					syll.setId(rs.getInt("ID_SYLLABUS"));

					temas.add(tema);

				}
			} catch (SQLException ex) {
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

    /**
     * Modifica el tema registrado en un syllabus
     * @param tema Objeto tema a modificar
     * @param idSyllabus ID del syllabus al que pertenece el tema
     * @return rpta mensaje de confirmacion del metodo
     */
	@Override
	public String editarTema(Tema tema, Integer idSyllabus) {
		String rpta = null;
		String prc_editarTema = "{CALL EDITAR_TEMA(?,?,?,?,?,?)}";
		Connection cn = db.getConnection();

		if (cn != null) {
			try {
				CallableStatement cs = cn.prepareCall(prc_editarTema);
				cs.setInt(1, tema.getId());
				cs.setString(2, tema.getDescripcion());
				cs.setInt(3, tema.getUnidad());
				cs.setInt(4, tema.getSemana());
				cs.setInt(5, tema.getTipo());
				cs.setInt(6, idSyllabus);

				int actualizo = cs.executeUpdate();

				if (actualizo == 0) {
					rpta = "ERROR";
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

    /**
     * Elimina el tema registrado en un syllabus
     * @param tema Objeto tema a eliminar
     * @return rpta mensaje de confirmacion del metodo
     */
	@Override
	public String eliminarTema(Tema tema) {
		
		String rpta = null;
		String prc_eliminarTema = "{CALL ELIMINAR_TEMA(?)}";
		Connection cn = db.getConnection();

		if (cn != null) {
			try {
				CallableStatement cs = cn.prepareCall(prc_eliminarTema);
				cs.setInt(1, tema.getId());

				int actualizo = cs.executeUpdate();

				if (actualizo == 0) {
					rpta = "ERROR";
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

    /**
     * Lista los temas que el alumno tiene que validar por grupo
     * @param idGrupo ID del grupo correspondiente de los temas a validar
     * @param idAlumno ID del alumno que realizara la validacion
     * @return List<TemaTO> lista de los temas disponibles a validar por el alumno 
     */
	@Override
	public List<Tema> obtenerAvancePorValidar(Integer idGrupo, Integer idAlumno) {
		List<Tema> temasAvanzadosPorValidar = new ArrayList<Tema>();

		String procedimientoAlmacenado = "{ call PAC_CURSOR.LISTAR_TEMAS_A_VALIDAR_X_GRUPO(?,?,?)}";

		Connection cn = this.db.getConnection();

		if (cn != null) {
			try {
				CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
				proc.setInt(1, idGrupo);
				proc.setInt(2, idAlumno);
				proc.registerOutParameter(3, OracleTypes.CURSOR);
				
				proc.execute();
				
				ResultSet rs = (ResultSet) proc.getObject(3);

				while (rs.next()) {
					Tema tema = new Tema();
					tema.setId(rs.getInt("ID_TEMA"));
					tema.setUnidad(rs.getInt("UNIDAD"));
					tema.setSemana(rs.getInt("SEMANA"));
					tema.setDescripcion(rs.getString("DESCRIPCION"));
					tema.setTipo(rs.getInt("ID_TIPO"));
					tema.setSyllabus(rs.getInt("ID_SYLLABUS"));
					
					System.out.println("Tema: "+tema.getId());
					System.out.println("Tema: "+tema.getUnidad());
					System.out.println("Tema: "+tema.getSemana());
					System.out.println("Tema: "+tema.getDescripcion());
					System.out.println("Tema: "+tema.getTipo());
					System.out.println("Tema: "+tema.getSyllabus());
					
					temasAvanzadosPorValidar.add(tema);

				}
			} catch (SQLException ex) {
				System.err.println(ex.getMessage());
			} finally {
				try {
					cn.close();
				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
			}
		}

		return temasAvanzadosPorValidar;
	}
}
