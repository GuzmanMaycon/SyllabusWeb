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
import com.junior.to.Tema;
import oracle.jdbc.internal.OracleTypes;

public class TemaDao implements ITemaDao {

	@Autowired
	protected IAccesoDB db;

	public void setDb(IAccesoDB db) {
		this.db = db;
	}

	@Override
	public List<Tema> obtenerTodos(Integer idSyllabus) {

		List<Tema> temas = new ArrayList<Tema>();

		String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_TEMAS_X_SYLLABUS(?, ?)}";

		Connection cn = this.db.getConnection();

		if (cn != null) {
			try {
				CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
				proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
				proc.setInt("p_id_syllabus", idSyllabus);
				proc.execute();

				ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

				while (rs.next()) {
					Tema tema = new Tema();
					tema.setId(rs.getInt("ID_TEMA"));
					tema.setDescripcion(rs.getString("DESCRIPCION"));
					// Los he comentado porque no son datos tan relevantes.
					//tema.setUnidad(rs.getInt("UNIDAD"));
					//tema.setSemana(rs.getInt("SEMANA"));
					//tema.setTipo(rs.getInt("ID_TIPO"));
					tema.setSyllabus(rs.getInt("ID_SYLLABUS"));
					temas.add(tema);
				}

				System.out.println("\n");
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

	@Override
	public String actualizarTemas(ArrayList<Tema> temas, Integer idSyllabus) {
		String rpta = null;
			try {
				// Eliminamos los temas
				rpta = eliminarTemasXSyllabus(idSyllabus);
				System.out.println("eliminando temas...");
				// Registramos los nuevos temas con ayuda de la lista
				for (Tema temaTemporal:temas) {
					rpta = insertarTema(temaTemporal);
				}				
			}catch (Exception e) {
					rpta += e.getMessage();
			}	
		return rpta;
	}

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

	@Override
	public String registrarAvance(Tema tema) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String eliminarTemasXSyllabus(Integer idSyllabus) { 
		String rpta = null;
		String prc_eliminarTemasXSyllabus = "{CALL ELIMINAR_TEMA_X_SYLLABUS(?)}";
		Connection cn = db.getConnection();

		if (cn != null) {
			try {
				CallableStatement cs = cn.prepareCall(prc_eliminarTemasXSyllabus);
				cs.setInt("ID_SYLLABUS", idSyllabus);

				int elimino = cs.executeUpdate();
				if (elimino == 0) {
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

	@Override
	public String insertarTema(Tema tema) {

		String rpta = null;
		Connection cn = db.getConnection();
		String procedimientoInsertar = "{ CALL REG_TEMA(?,?,?,?,?) }";

		try {
			CallableStatement cs = cn.prepareCall(procedimientoInsertar);

			cs.setString("DESCRIPCION", tema.getDescripcion());
			cs.setInt("UNIDAD", tema.getUnidad());
			cs.setInt("SEMANA", tema.getSemana());
			cs.setInt("ID_TIPO", tema.getTipo());
			cs.setInt("ID_SYLLABUS", tema.getSyllabus());

			int inserto = cs.executeUpdate();
			if (inserto == 0) {
				rpta = "Error al ingresar el tema";
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			rpta = ex.getMessage();
		}
		return rpta;
	}
}
