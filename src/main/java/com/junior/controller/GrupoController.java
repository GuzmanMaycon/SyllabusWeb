package com.junior.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junior.dao.design.IGrupoDao;
import com.junior.dao.design.IUsuarioDao;
import com.junior.to.Grupo;
import com.junior.to.Usuario;

@Controller
@RequestMapping("/grupos")
public class GrupoController {

    @Autowired
    public IGrupoDao grupoDao;

    @Autowired
    public IUsuarioDao usuarioDao;

    public void setGrupoDao(IGrupoDao grupoDao)
    {
        this.grupoDao = grupoDao;
    }

    public void setUsuarioDao(IUsuarioDao usuarioDao)
    {
        this.usuarioDao = usuarioDao;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map, Principal principal)
    {
        Usuario usuario = this.usuarioDao.obtenerUsuario(principal.getName());
        Collection<GrantedAuthority> roles = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        ArrayList<String> rolesArray = new ArrayList<String>();
        List<Grupo> grupos;
        Boolean esDocente = false;

        for (GrantedAuthority rol : roles) {
            rolesArray.add(rol.getAuthority());
        }

        if (rolesArray.contains("ROLE_ADMIN")) {
            grupos = this.grupoDao.obtenerTodos();
        } else if (rolesArray.contains("ROLE_DIRECTOR")) {
            grupos = new ArrayList<Grupo>();
        } else if (rolesArray.contains("ROLE_DOCENTE")) {
            grupos = new ArrayList<Grupo>();
        } else if (rolesArray.contains("ROLE_ALUMNO")) {
            grupos = this.grupoDao.obtenerPorAlumno(usuario.getId());
        } else {
            grupos = new ArrayList<Grupo>();
        }

        if (rolesArray.contains("ROLE_DOCENTE")) {
            esDocente = true;
        }

        map.addAttribute("lista", grupos);
        map.addAttribute("esDocente", esDocente);

        return "grupos/index";
    }

}
