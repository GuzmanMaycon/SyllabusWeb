package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IGrupoDao;
import com.junior.to.Asignatura;
import com.junior.to.AsignaturaAperturadaTO;
import com.junior.to.Grupo;

import oracle.jdbc.internal.OracleTypes;

public class GrupoDao implements IGrupoDao {

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    public List<Grupo> obtenerTodos() {
        // TODO Auto-generated method stub
        List<Grupo> grupos = new ArrayList<Grupo>();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.LISTAR_GRUPOS(?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("o_cursor", OracleTypes.CURSOR);
                proc.setInt("p_IDPeriodo", 6);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("o_cursor");

                while (rs.next()) {
                    Grupo grupo = new Grupo();
                    AsignaturaAperturadaTO asignaturaAperturada = new AsignaturaAperturadaTO();

                    Asignatura asignatura = new Asignatura();
                    asignatura.setNombre(rs.getString("ASIG_NOMBRE"));
                    asignaturaAperturada.setAsignatura(asignatura);

                    grupo.setId(rs.getInt("ID_GRUPO"));
                    grupo.setNumero(rs.getInt("GRUPO_NUMERO"));
                    grupo.setAsignaturaAperturada(asignaturaAperturada);

                    grupos.add(grupo);
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

        return grupos;
    }

}
