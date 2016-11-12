package com.junior.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junior.dao.design.IGrupoDao;
import com.junior.to.Grupo;

@Controller
@RequestMapping("/grupos")
public class GrupoController {

    @Autowired
    public IGrupoDao grupoDao;

    public void setGrupoDao(IGrupoDao grupoDao)
    {
        this.grupoDao = grupoDao;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map)
    {
        List<Grupo> grupos = this.grupoDao.obtenerTodos();

        map.addAttribute("lista", grupos);

        return "grupos/index";
    }

}
