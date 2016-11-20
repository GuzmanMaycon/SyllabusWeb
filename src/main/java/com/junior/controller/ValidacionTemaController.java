package com.junior.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junior.dao.design.ITemaDao;
import com.junior.dao.design.IUsuarioDao;
import com.junior.to.Tema;
import com.junior.to.Usuario;

@Controller
@RequestMapping("/grupo/{grupoId}")
public class ValidacionTemaController {

    @Autowired
    private ITemaDao temaDao; // Dao para asignaturas aperturadas

    @Autowired
    public IUsuarioDao usuarioDao;

    /**
     * Asignar el dao para temas del syllabus
     * @param temaDao dao que maneja los temas del syllabus
     */
    public void setTemaDao(ITemaDao temaDao)
    {
        this.temaDao = temaDao;
    }

    public void setUsuarioDao(IUsuarioDao usuarioDao)
    {
        this.usuarioDao = usuarioDao;
    }

    @RequestMapping(value = "/valida", method = RequestMethod.GET)
    public String create(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId,
        Principal principal)
    {
        String nombreAsignatura = "";

        //IDUsuario del alumno que ingresa a la página
        Usuario usuario = this.usuarioDao.obtenerUsuario(principal.getName());

        map.addAttribute("nombreAsignatura", nombreAsignatura);

        //Prueba del DAO pasando como parametro el alumnoId para validar su asistencia con los temas a validar
        List<Tema> temas = this.temaDao.obtenerAvancePorValidar(grupoId, usuario.getId());

        map.addAttribute("temas", temas);

        return "temas/registrar_avance";
    }
}
