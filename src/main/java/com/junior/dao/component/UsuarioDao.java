package com.junior.dao.component;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.junior.dao.design.IUsuarioDao;
import com.junior.to.Rol;
import com.junior.to.Usuario;

public class UsuarioDao implements IUsuarioDao {

    @Override
    public Usuario obtenerUsuario(String correo)
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        Usuario usuario = this.obtenerUsuario(username);
        // Obtener roles del usuario
        ArrayList<Rol> roles = new ArrayList<Rol>();
        Collection<GrantedAuthority> accesos = new ArrayList<>();
        // Convertirlos en una coleccion de GrantedAuthority
        for (Rol rol : roles) {
            accesos.add(new SimpleGrantedAuthority(rol.getNombre()));
        }

        return new User(
                usuario.getCodigo(),
                usuario.getContrasenia(),
                true,
                true,
                true,
                true,
                accesos
                );
    }


}
