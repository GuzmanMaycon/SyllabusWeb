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

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    public List<Tema> obtenerTemasPorAsigAperturadaPorSemana(Integer asigAperturadaId, Integer semana) {
        ArrayList<Tema> temas = new ArrayList<Tema>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.LISTAR_TEMAS_X_ASIG_APER(?, ?, ?) }";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
                proc.setInt("ASIG_APER_ID", asigAperturadaId);
                proc.setInt("SEM", semana);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

                while (rs.next()) {
                    Tema tema = new Tema();
                    tema.setId(rs.getInt("ID_TEMA"));
                    tema.setDescripcion(rs.getString("DESCRIPCION"));

                    temas.add(tema);
                }
            } catch(SQLException ex) {
                ex.printStackTrace();
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

}
