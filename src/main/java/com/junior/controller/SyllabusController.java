package com.junior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/curso/{cursoAbiertoId}/syllabus")
public class SyllabusController {

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap map, @PathVariable(value="cursoAbiertoId") String id)
    {
        //Obtener curso de la bd y poner el nombre
        if (Integer.parseInt(id) == 1)
            map.addAttribute("course_name", "Programacion I");
        else if (Integer.parseInt(id) == 2)
            map.addAttribute("course_name", "Programacion II");
        else
            map.addAttribute("course_name", "Otro curso");

        return "syllabus/create";
    }
}
