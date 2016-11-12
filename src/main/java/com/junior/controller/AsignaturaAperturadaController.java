package com.junior.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.to.AsignaturaAperturadaTO;

/**
 * Listar asignaturas aperturadas a Coordinadores y Directores
 * @author Junior Claudio
 * @version 1.0.1, 11/11/2016
 */

@Controller
@RequestMapping("/asignaturas_del_ciclo")
public class AsignaturaAperturadaController {

    @Autowired
    private IAsignaturaAperturadaDao asignaturaAperturadaDao; // Dao para asignaturas aperturadas

    /**
     * Asignar el dao para asignatura aperturada
     * @param asignaturaAperturadaDao dao que maneja las asignaturas aperturadas
     */
    public void setAsignaturaAperturadaDao(IAsignaturaAperturadaDao asignaturaAperturadaDao)
    {
        this.asignaturaAperturadaDao = asignaturaAperturadaDao;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map)
    {
        List<AsignaturaAperturadaTO> asignaturas = this.asignaturaAperturadaDao.obtenerPorCoordinador(4);
        map.addAttribute("lista", asignaturas);

        return "asignatura_aperturada/index";
    }
}
