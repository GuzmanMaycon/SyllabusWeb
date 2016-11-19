package com.junior.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.to.Tema;

@Controller
@RequestMapping("/asignatura/{asignaturaAperturadaId}")
public class AvanceTemaController {

    @Autowired
    private IAsignaturaAperturadaDao asignaturaAperturadaDao; // Dao para asignaturas aperturadas

    public void setAsignaturaAperturadaDao(IAsignaturaAperturadaDao asignaturaAperturadaDao)
    {
        this.asignaturaAperturadaDao = asignaturaAperturadaDao;
    }

    @RequestMapping(value = "/avance", method = RequestMethod.GET)
    public String create(ModelMap map, @PathVariable(value="asignaturaAperturadaId") Integer asignaturaAperturadaid)
    {
        String nombreAsignatura = this.asignaturaAperturadaDao.obtenerNombreDeAsignaturaPorId(asignaturaAperturadaid);
        map.addAttribute("nombreAsignatura", nombreAsignatura);

        List<Tema> temas = new ArrayList<Tema>();
        temas.add((new Tema(1, "Intro a la programacion", 1, 1)));
        temas.add((new Tema(2, "Variables", 1,1)));
        temas.add((new Tema(3, "Arreglos", 1,1)));
        map.addAttribute("temaList", temas);

        return "temas/registrar_avance";
    }

    @RequestMapping(value = "/avance", method = RequestMethod.POST)
    public String store(ModelMap map,
        @RequestParam(value = "temas[]", required = false) List<Integer> temas,
        RedirectAttributes redirectAttrs)
    {
        if(temas != null) {
            for(Object t: temas)
                System.out.println(t);

            redirectAttrs.addFlashAttribute("mensajeOk", "Avance de temas registrados");
            return "redirect:/grupos/index";
        }

        map.addAttribute("mensajeError", "No ingreso ningun tema.");
        return "temas/registrar_avance";
    }

}
