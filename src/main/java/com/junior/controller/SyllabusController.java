package com.junior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junior.dao.component.AsignaturaAperturadaDao;
import com.junior.dao.design.IAsignaturaAperturadaDao;

@Controller
@RequestMapping("/asignatura/{asignaturaAperturadaId}/syllabus")
public class SyllabusController {

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap map, @PathVariable(value="asignaturaAperturadaId") Integer id)
    {
        IAsignaturaAperturadaDao asignaturaAperturadaDao = new AsignaturaAperturadaDao();
        String nombreCurso = asignaturaAperturadaDao.obtenerNombreDeAsignaturaPorId(id);
        if (nombreCurso == null) {
            //Redirigir indicando que el id de la asignatura aperturada no es correcta
            //To-do
        }
        map.addAttribute("course_name", nombreCurso);

        return "syllabus/create";
    }
}
