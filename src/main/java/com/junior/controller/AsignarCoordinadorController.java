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
@RequestMapping("/coordinador-asignar")
public class AsignarCoordinadorController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map, Principal principal)
    {
        

        return "coordinador-asignar/index";
    }


}
