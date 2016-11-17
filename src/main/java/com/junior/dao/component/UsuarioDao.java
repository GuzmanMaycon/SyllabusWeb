package com.junior.dao.component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.junior.conexion.IAccesoDB;
import com.junior.dao.design.IUsuarioDao;
import com.junior.to.Rol;
import com.junior.to.Usuario;

import oracle.jdbc.internal.OracleTypes;

public class UsuarioDao implements IUsuarioDao {

    @Autowired
    protected IAccesoDB db;

    public void setDb(IAccesoDB db)
    {
        this.db = db;
    }

    @Override
    public Usuario obtenerUsuario(String correo)
    {
        // TODO Auto-generated method stub
        Usuario usuario = new Usuario();

        String procedimientoAlmacenado = "{ call PAC_CURSOR.RET_USUARIO_X_EMAIL(?, ?)}";

        Connection cn = this.db.getConnection();

        if (cn != null) {
            try {
                CallableStatement proc = cn.prepareCall(procedimientoAlmacenado);
                proc.registerOutParameter("O_CURSOR", OracleTypes.CURSOR);
                proc.setString("EMAIL", correo);
                proc.execute();

                ResultSet rs = (ResultSet) proc.getObject("O_CURSOR");

                if (rs.next()) {
                    usuario.setCorreo(correo);
                    usuario.setContrasenia(rs.getString("PASSWORD"));
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

        // TODO Auto-generated method stub
        return usuario;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        Usuario usuario = this.obtenerUsuario(username);
        // Obtener roles del usuario
        ArrayList<Rol> roles = new ArrayList<Rol>();
        Collection<GrantedAuthority> accesos = new ArrayList<GrantedAuthority>();
        // Convertirlos en una coleccion de GrantedAuthority
        accesos.add(new SimpleGrantedAuthority("ROLE_USER"));
        for (Rol rol : roles) {
            accesos.add(new SimpleGrantedAuthority(rol.getNombre()));
        }

        return new User(
                usuario.getCorreo(),
                usuario.getContrasenia(),
                true,
                true,
                true,
                true,
                accesos
                );
    }


}
