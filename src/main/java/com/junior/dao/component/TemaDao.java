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

public class TemaDao implements ITemaDao {

	@Autowired
	protected IAccesoDB db;

	public void setDb(IAccesoDB db) {
		this.db = db;
	}

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
}
