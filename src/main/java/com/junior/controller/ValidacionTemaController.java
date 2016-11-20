package com.junior.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.dao.design.ITemaDao;
import com.junior.to.Tema;

@Controller
@RequestMapping("/grupo/{grupoId}")
public class ValidacionTemaController {
	
	@Autowired
    private ITemaDao temaDao; // Dao para asignaturas aperturadas

    /**
     * Asignar el dao para temas del syllabus
     * @param temaDao dao que maneja los temas del syllabus
     */
    public void setTemaDao(ITemaDao temaDao)
    {
        this.temaDao = temaDao;
    }

    @RequestMapping(value = "/valida", method = RequestMethod.GET)
    public String create(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId)
    {
        String nombreAsignatura = "";
        
        //IDUsuario del alumno que ingresa a la página
        Integer alumnoId = 1;
        
        map.addAttribute("nombreAsignatura", nombreAsignatura);

        //Prueba del DAO pasando como parametro el alumnoId para validar su asistencia con los temas a validar
        List<Tema> temas2 = this.temaDao.obtenerAvancePorValidar(grupoId,alumnoId);
        
        List<Tema> temas = new ArrayList<Tema>();
        temas.add((new Tema(1, "Intro a la programacion", 1, 1,2,1)));
        temas.add((new Tema(2, "Variables", 1, 1,2,1)));
        temas.add((new Tema(3, "Arreglos", 1, 1,2,1)));
        
        map.addAttribute("temaList", temas);

        return "temas/registrar_avance";
    }
}
