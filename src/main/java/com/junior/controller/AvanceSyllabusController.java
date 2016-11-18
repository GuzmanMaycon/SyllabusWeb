package com.junior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/grupo/{grupoId}/syllabus")
public class AvanceSyllabusController {

    @RequestMapping(value = "/avance")
    public String index(@PathVariable(value="grupoId") Integer grupoId)
    {
        // Obtener temas desarrollados del syllabus por el grupo

        return "syllabus/avance";
    }
}
