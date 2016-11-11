package com.junior.dao.design;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.junior.to.Usuario;

public interface IUsuarioDao extends UserDetailsService {
    public Usuario obtenerUsuario(String correo);
}
