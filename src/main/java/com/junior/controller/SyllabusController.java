package com.junior.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.dao.design.ISyllabusDao;
import com.junior.parser.JsonParser;
import com.junior.to.Bibliografia;
import com.junior.to.EstadoSyllabus;
import com.junior.to.Syllabus;
import com.junior.to.Tema;

/**
 *  Controlador para el manejo de syllabus
 *  @author Junior Claudio
 *  @version 1.2.0, 11/11/16
 *  @see com.junior.dao.component.AsignaturaAperturadaDao#obtenerNombreDeAsignaturaPorId obtenerNombreDeAsignatura
 *  @see com.junior.parser.TemaJsonParser#parse(JSONObject) temaParser
 *  @see com.junior.parser.BibliografiaJsonParser#parse(JSONObject) biblioParser
 */

@Controller
@RequestMapping("/asignatura/{asignaturaAperturadaId}/syllabus")
public class SyllabusController {

    @Autowired
    private IAsignaturaAperturadaDao asignaturaAperturadaDao; // Dao para asignaturas aperturadas

    private ISyllabusDao syllabusDao; // Dao para syllabus

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
     * Asignar el dao para syllabus
     * @param syllabusDao dao que maneja el syllabus
     */
    public void setSyllabusDao(ISyllabusDao syllabusDao)
    {
        this.syllabusDao = syllabusDao;
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
     * Servidor de correos
     * @param mailer servidor utilizado para notificar los syllabus que adjunten los profesores
     */

    /**
     * Controlar si se muestra la vista para registrar syllabus o se redirige a
     * la ventana anterior con un mensaje de error
     * @param model Modelo para usar data del controlador en la vista
     * @param id Id de la Asignatura Aperturada
     * @param redirectAttrs Objeto utilizado para almacenar data de sesion para manejar los mensajes en la vista
     * @return la vista de registrar si el id es valido sino redireccionar
     */
    @RequestMapping(value = "/registrar", method = RequestMethod.GET)
    public String create(ModelMap model,
        @PathVariable(value = "asignaturaAperturadaId") Integer asignaturaAperturadaid,
        RedirectAttributes redirectAttrs)
    {
        EstadoSyllabus estadoSyllabus = this.syllabusDao.obtenerEstadoPorAsigAperturadaId(asignaturaAperturadaid);

        if (estadoSyllabus.equals(EstadoSyllabus.N)) {
            // Obtener el nombre de la asignatura a partir del id de la asignatura aperturada
            String nombreAsignatura = this.asignaturaAperturadaDao.obtenerNombreDeAsignaturaPorId(asignaturaAperturadaid);
            // Verificar si la asignatura es valida
            if (nombreAsignatura == null) {
                // Agregar como data de sesion el mensaje de error
                redirectAttrs.addFlashAttribute("mensajeError","Asignatura no encontrada en la Base de Datos");
                // Redirigir indicando que el id de la asignatura aperturada no es correcta
                return "redirect:/asignaturas_del_ciclo/index";
            }
            // Agregar al modelo el nombre de la asignatura
            model.addAttribute("nombreAsignatura", nombreAsignatura);

            return "syllabus/registrar";
        } else if (estadoSyllabus.equals(EstadoSyllabus.A)) {
            redirectAttrs.addFlashAttribute("mensajeOk","Tu syllabus fue aprobado anteriormente");
            return "redirect:/asignaturas_del_ciclo/index";
        } else {
            redirectAttrs.addFlashAttribute("mensajeError","La vista correcta es la de edicion");
            /** TO - DO
             * Hacer edicion de syllabus
             */

            return "redirect:/asignaturas_del_ciclo/index";
        }
    }

    /**
     * Agregar al objeto Syllabus los temas y libros ingresados por el usuario
     * Enviar el syllabus a su DAO correspondiente para almacenarlo
     * Enviar un correo al decano para notificar que el coordinador del curso ha subido el syllabus
     * @param model Modelo para usar data del controlador en la vista
     * @param redirectAttrs Objeto utilizado para almacenar data de sesion para manejar los mensajes en la vista
     * @param temas Temas del syllabus ingresado por el usuario
     * @param bibliografia Libros del syllabus ingresados por el usuario
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/registrar", method = RequestMethod.POST)
    public String store(ModelMap model,
        RedirectAttributes redirectAttributes,
        @PathVariable(value = "asignaturaAperturadaId") Integer id,
        @RequestParam(value = "temas[]") String[] temas,
        @RequestParam(value = "bibliografia[]") String[] bibliografia) throws Exception
    {
        Syllabus syllabus = new Syllabus();

        try
        {
            // Recorrer el arreglo de temas y agregarlos al syllabus
            try {
                for (String tema : temas) {
                    Tema nuevoTema = this.temaParser.parse( new JSONObject(tema) );
                    syllabus.addTema(nuevoTema);
                }
            } catch(JSONException e) {
                /**
                 * Cuando llega solo 1 tema, ocurre un problema y divide al tema en varias partes
                 * Se toma toda el arreglo como un tema, porque asi lo maneja Java
                 */
                Tema nuevoTema = this.temaParser.parse( new JSONObject(StringUtils.arrayToCommaDelimitedString(temas)) );
                syllabus.addTema(nuevoTema);
            }

            // Recorrer el arreglo de libros y agregarlos al syllabus
            try {
                for (String libro : bibliografia) {
                    Bibliografia nuevoLibro = this.biblioParser.parse( new JSONObject(libro) );
                    syllabus.addLibro(nuevoLibro);
                }
            } catch(JSONException e) {
                /**
                 * Cuando llega solo 1 libro, ocurre un problema y divide al tema en varias partes
                 * Se toma toda el arreglo como un libro, porque asi lo maneja Java
                 */
                Bibliografia nuevoLibro = this.biblioParser.parse(new JSONObject(StringUtils.arrayToCommaDelimitedString(bibliografia)));
                syllabus.addLibro(nuevoLibro);
            }

            syllabus.setIdAsigAperturada(id);

            String respuesta = this.syllabusDao.insertarSyllabus(syllabus);
            if (!respuesta.equals("OK")) {
                throw new Exception(respuesta);
            }
        } catch (JSONException e) {
            // Agregar como data de sesion el mensaje de error
            redirectAttributes.addFlashAttribute("mensajeError","Error en el formulario.");
            // Redirigir al crear syllabus
            return "redirect:/asignatura/"+id+"/syllabus/registrar";
        }
        // Agregar como data de sesion el mensaje de exito
        redirectAttributes.addFlashAttribute("mensajeOk", "El syllabus fue correctamente registrado.");
        /**
         *  Enviar correo del director de escuela avisando
         *  que el profesor del curso ha registrado su syllabus
         */

        // Redirigir al indice
        return "redirect:/asignaturas_del_ciclo/index";
    }

    @RequestMapping(value = "/editar/{syllabusId}", method = RequestMethod.GET)
    public String edit(ModelMap model,
        @PathVariable(value = "asignaturaAperturadaId") Integer asignaturaAperturadaid,
        @PathVariable(value = "syllabusId") Integer syllabusId,
        RedirectAttributes redirectAttrs)
    {
    	//Obtener los atributos del Syllabus a partir del id del Syllabus
        Syllabus syllabus = this.syllabusDao.obtenerSyllabus(syllabusId);

        // Obtener el nombre de la asignatura a partir del id de la asignatura aperturada
        String nombreAsignatura = this.asignaturaAperturadaDao.obtenerNombreDeAsignaturaPorId(asignaturaAperturadaid);
        // Verificar si la asignatura es valida
        if (nombreAsignatura == null) {
            // Agregar como data de sesion el mensaje de error
            redirectAttrs.addFlashAttribute("mensajeError","Asignatura no encontrada en la Base de Datos");
            // Redirigir indicando que el id de la asignatura aperturada no es correcta
            return "redirect:/asignaturas_del_ciclo/index";
        }
        // Agregar al modelo el nombre de la asignatura
        model.addAttribute("nombreAsignatura", nombreAsignatura);

        ArrayList<Tema> temas = new ArrayList<Tema>();
        temas.add(new Tema(1, "Tema", 1, 1));
        temas.add(new Tema(2, "Tema 2", 1, 1));
        temas.add(new Tema(3, "Tema 3", 2, 1));
        temas.add(new Tema(4, "Tema 4", 1, 2));

        syllabus.setTemas(temas);

        /**
         * El Key es la unidad y el Value son las semanas de dicha unidad
         */
        Map<Integer, List<Integer>> unidades = new HashMap<Integer, List<Integer>>();

        for (Tema tema : syllabus.getTemas()) {
            Integer semana = tema.getSemana();
            Integer unidad = tema.getUnidad();
            if (!unidades.containsKey(unidad)) {
                unidades.put(unidad, new ArrayList<Integer>());
                unidades.get(unidad).add(semana);
            } else {
                if (!unidades.get(unidad).contains(semana)) {
                    unidades.get(unidad).add(semana);
                }
            }
        }

        model.addAttribute("syllabus", syllabus);
        model.addAttribute("unidades", unidades);

        return "syllabus/editar";
    }
}
