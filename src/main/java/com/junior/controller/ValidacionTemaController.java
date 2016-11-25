package com.junior.controller;

import java.security.Principal;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.junior.dao.design.IGrupoDao;
import com.junior.dao.design.IPeriodoDao;
import com.junior.dao.design.ISesionDao;
import com.junior.dao.design.ITemaDao;
import com.junior.dao.design.IUsuarioDao;
import com.junior.helpers.SemanaHelper;
import com.junior.to.Periodo;
import com.junior.to.Sesion;
import com.junior.to.Tema;
import com.junior.to.Usuario;

@Controller
@RequestMapping("/grupo/{grupoId}")
public class ValidacionTemaController {

    @Autowired
    private ITemaDao temaDao; // Dao para asignaturas aperturadas

    @Autowired
    private IUsuarioDao usuarioDao;

    @Autowired
    private IGrupoDao grupoDao;

    @Autowired
    private ISesionDao sesionDao;

    @Autowired
    private IPeriodoDao periodoDao;

    @Autowired
    private SemanaHelper semanaHelper;

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

    public void setGrupoDao(IGrupoDao grupoDao)
    {
        this.grupoDao = grupoDao;
    }

    public void setSesionDao(ISesionDao sesionDao)
    {
        this.sesionDao = sesionDao;
    }

    public void setPeriodoDao(IPeriodoDao periodoDao)
    {
        this.periodoDao = periodoDao;
    }

    public void setSemanaHelper(SemanaHelper semanaHelper)
    {
        this.semanaHelper = semanaHelper;
    }

    @RequestMapping(value = "/valida", method = RequestMethod.GET)
    public String index(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId,
        Principal principal)
    {
        String nombreAsignatura = this.grupoDao.obtenerNombreAsignatura(grupoId);

        //IDUsuario del alumno que ingresa a la página
        Usuario usuario = this.usuarioDao.obtenerUsuario(principal.getName());

        //Prueba del DAO pasando como parametro el alumnoId para validar su asistencia con los temas a validar
        List<Tema> temas = this.temaDao.obtenerAvancePorValidar(grupoId, usuario.getId());

        List<Sesion> sesiones = this.sesionDao.obtenerPorGrupoPorAlumno(grupoId, usuario.getId());

        Periodo periodo = this.periodoDao.obtenerPeriodoActual();
        Map<Integer, Date> semanasRecientes = this.semanaHelper.retornarUltimasSemanas(periodo.getFechaInicio());
        Date fechaInicio = this.semanaHelper.obtenerFechaInicio(semanasRecientes);
        Date fechaFin = this.semanaHelper.obtenerFechaFin(semanasRecientes);

        Map<Sesion, Boolean> registros = new LinkedHashMap<Sesion, Boolean>();
        for (Sesion sesion: sesiones) {
            Date fecha = sesion.getFecha();
            // Si la fecha inicio es antes que la fecha de la sesion
            // Y si la fecha fin es despues que la fecha de la sesion
            if (fechaInicio.compareTo(fecha) <= 0  && fechaFin.compareTo(fecha) >= 0) {
                Boolean resultado = this.temaDao.obtenerSiValidoTemas(sesion.getId(), usuario.getId());
                registros.put(sesion, resultado);
            }
        }

        map.addAttribute("nombreAsignatura", nombreAsignatura);
        map.addAttribute("temas", temas);
        map.addAttribute("registros", registros);

        return "validar-avance/index";
    }

    @RequestMapping(value = "/sesion/{sesionId}/valida", method = RequestMethod.GET)
    public String create(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId,
        @PathVariable(value="sesionId") Integer sesionId,
        RedirectAttributes redirectAttrs)
    {
        return "";
    }

    @RequestMapping(value = "/sesion/{sesionId}/valida", method = RequestMethod.POST)
    public String store(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId,
        @PathVariable(value="sesionId") Integer sesionId,
        RedirectAttributes redirectAttrs)
    {
        return "";
    }
}
