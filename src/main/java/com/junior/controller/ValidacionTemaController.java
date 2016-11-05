package com.junior.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junior.to.Tema;

@Controller
@RequestMapping("/curso/{cursoAbiertoId}")
public class ValidacionTemaController {
    @RequestMapping(value = "/valida", method = RequestMethod.GET)
    public String create(ModelMap map,
            @PathVariable(value="cursoAbiertoId") String id
            )
    {
        map.addAttribute("course_name", "Diseño de Software");
        List<Tema> temas = new ArrayList<Tema>();
        temas.add((new Tema(1, "Intro a la programacion", 1, 1)));
        temas.add((new Tema(2, "Variables", 1, 1)));
        temas.add((new Tema(3, "Arreglos", 1, 1)));
        map.addAttribute("temaList", temas);

        return "temas/registrar_avance";
    }
}
