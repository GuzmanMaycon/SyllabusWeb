package com.junior.controller;

import java.util.Date;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.parser.JsonParser;
import com.junior.to.Bibliografia;
import com.junior.to.EstadoSyllabus;
import com.junior.to.Syllabus;
import com.junior.to.Tema;

/**
 *  Controlador para el manejo de syllabus
 *  @author Junior Claudio
 *  @version 1.1.3, 05/11/16
 *  @see com.junior.dao.component.AsignaturaAperturadaDao#obtenerNombreDeAsignaturaPorId obtenerNombreDeAsignatura
 *  @see com.junior.parser.TemaJsonParser#parse(JSONObject) temaParser
 *  @see com.junior.parser.BibliografiaJsonParser#parse(JSONObject) biblioParser
 */

@Controller
@RequestMapping("/asignatura/{asignaturaAperturadaId}/syllabus")
public class SyllabusController {

    @Autowired
    private IAsignaturaAperturadaDao asignaturaAperturadaDao; // Dao para asignaturas aperturadas

    private JsonParser<Tema> temaParser;// Parser para leer los temas del cuerpo del POST

    private JsonParser<Bibliografia> biblioParser;// Parser para leer los libros del cuerpo del POST

    /**
     * Asignar el dao para asignatura aperturada
     * @param asignaturaAperturadaDao dao que maneja las asignaturas aperturadas
     */
    public void setAsignaturaAperturadaDao(IAsignaturaAperturadaDao asignaturaAperturadaDao)
    {
        this.asignaturaAperturadaDao = asignaturaAperturadaDao;
    }

    /**
     * Asignar el parser para temas
     * @param temaParser parser que convierte un formato a objetos Tema
     */
    public void setTemaParser(JsonParser<Tema> temaParser)
    {
        this.temaParser = temaParser;
    }

    /**
     * Asignar el parser para libros
     * @param biblioParser parser que convierte un formato a objetos Bibliografia
     */
    public void setBiblioParser(JsonParser<Bibliografia> biblioParser)
    {
        this.biblioParser = biblioParser;
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

    /**
     *
     * @param model
     * @param redirectAttributes
     * @param temas
     * @param bibliografia
     * @return
     */
    @RequestMapping(value = "/registrar", method = RequestMethod.POST)
    public String store(ModelMap model,
            RedirectAttributes redirectAttributes,
            @PathVariable(value="asignaturaAperturadaId") Integer id,
            @RequestParam(value = "temas[]") String[] temas,
            @RequestParam(value = "bibliografia[]") String[] bibliografia)
    {
        Syllabus syllabus = new Syllabus();

        try
        {
            for (String tema: temas) {
                syllabus.addTema(this.temaParser.parse(new JSONObject(tema)));
            }

            for (String libro: bibliografia) {
                syllabus.addLibro(this.biblioParser.parse(new JSONObject(libro)));
            }

            syllabus.setEstado(EstadoSyllabus.EN_ESPERA);
            syllabus.setFechaEntrega(new Date());
        } catch (JSONException e)
        {
            //Enviar mensaje de mal formato de json
            redirectAttributes.addFlashAttribute("mensajeError","Error en el formulario.");
            //Redirigir al crear syllabus
            return "redirect:/asignatura/"+id+"/syllabus/registrar";
        }
        //Enviar al dao de syllabus
        //To-DO
        //Agregar como data de sesion el mensaje de exito
        redirectAttributes.addFlashAttribute("mensajeOk", "El syllabus fue correctamente registrado.");
        //Redirigir al indice
        return "redirect:/asignatura_aperturada/index";
    }
}
