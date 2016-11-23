package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.ISesionDao;
import com.junior.to.Clase;
import com.junior.to.Sesion;
import com.junior.to.TipoClase;

import oracle.jdbc.internal.OracleTypes;

public class SesionDao implements ISesionDao {

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db) {
        this.db = db;
    }

    @Override
    public List<Sesion> obtenerPorGrupoPorDocente(Integer grupoId, Integer docenteId) {
        List<Sesion> sesiones = new ArrayList<Sesion>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_CLASES_X_GRUPO(?, ?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
                proc.setInt("p_id_grupo", grupoId);
                proc.setInt("p_id_docente", docenteId);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

                while (rs.next()) {
                    TipoClase nuevoTipoClase = new TipoClase();
                    nuevoTipoClase.setDescripcion(rs.getString("DESCRIPCION"));
                    nuevoTipoClase.setId(rs.getInt("ID_TIPO"));

                    Clase nuevaClase = new Clase();
                    nuevaClase.setTipo(nuevoTipoClase);
                    nuevaClase.setId(rs.getInt("ID_CLASE"));

                    Sesion nuevaSesion = new Sesion();
                    nuevaSesion.setId(rs.getInt("ID_SESION"));
                    nuevaSesion.setEstado(rs.getString("ESTADO").charAt(0));
                    nuevaSesion.setFecha(rs.getDate("FECHA"));
                    nuevaSesion.setClase(nuevaClase);

                    sesiones.add(nuevaSesion);
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

        return sesiones;
    }

}
