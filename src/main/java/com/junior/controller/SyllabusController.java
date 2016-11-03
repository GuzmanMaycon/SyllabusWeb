package com.junior.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junior.dao.design.IAsignaturaAperturadaDao;

/**
 *  Controlador para el manejo de syllabus
 *  @author Junior Claudio
 *  @version 1.1.1, 02/11/16
 *  @see com.junior.dao.component.AsignaturaAperturadaDao#obtenerNombreDeAsignaturaPorId obtenerNombreDeAsignatura
 */

@Controller
@RequestMapping("/asignatura/{asignaturaAperturadaId}/syllabus")
public class SyllabusController {

    @Autowired
    private IAsignaturaAperturadaDao asignaturaAperturadaDao; // Dao para asignaturas aperturadas

    public void setAsignaturaAperturadaDao(IAsignaturaAperturadaDao asignaturaAperturadaDao)
    {
        this.asignaturaAperturadaDao = asignaturaAperturadaDao;
    }

    /**
     * Controlar si se muestra la vista para registrar syllabus o se redirige a
     * la ventana anterior con un mensaje de error
     * @param model Modelo para usar data del controlador en la vista
     * @param id Id de la Asignatura Aperturada
     * @return la vista de registrar si el id es valido sino redireccionar
     */
    @RequestMapping(value = "/registrar", method = RequestMethod.GET)
    public String create(ModelMap model,
            @PathVariable(value="asignaturaAperturadaId") Integer id,
            RedirectAttributes redirectAttrs)
    {
        //Obtener el nombre de la asignatura a partir del id de la asignatura aperturada
        String nombreAsignatura = this.asignaturaAperturadaDao.obtenerNombreDeAsignaturaPorId(id);
        //Verificar si la asignatura es valida
        if (nombreAsignatura == null) {
            //Agregar como data de sesion el mensaje de error
            redirectAttrs.addFlashAttribute("mensajeError","Asignatura no encontrada en la Base de Datos");
            //Redirigir indicando que el id de la asignatura aperturada no es correcta
            return "redirect:/asignatura_aperturada/index";
        }
        //Agregar al modelo el nombre de la asignatura
        model.addAttribute("nombreAsignatura", nombreAsignatura);

        return "syllabus/registrar";
    }
}
