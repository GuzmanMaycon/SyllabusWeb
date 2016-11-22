package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IClaseDao;
import com.junior.to.Clase;
import com.junior.to.TipoClase;

import oracle.jdbc.internal.OracleTypes;

public class ClaseDao implements IClaseDao {

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db) {
        this.db = db;
    }

    @Override
    public List<Clase> obtenerPorGrupoPorDocente(Integer grupoId, Integer docenteId) {
        List<Clase> clases = new ArrayList<Clase>();

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

                    clases.add(nuevaClase);
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

        return clases;
    }

}
