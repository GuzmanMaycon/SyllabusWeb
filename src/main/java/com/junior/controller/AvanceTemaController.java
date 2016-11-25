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
import org.springframework.web.bind.annotation.RequestParam;
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
public class AvanceTemaController {

    @Autowired
    private IGrupoDao grupoDao;

    @Autowired
    private ITemaDao temaDao;

    @Autowired
    private IPeriodoDao periodoDao;

    @Autowired
    private ISesionDao sesionDao;

    @Autowired
    private IUsuarioDao usuarioDao;

    @Autowired
    private SemanaHelper semanaHelper;

    public void setGrupoDao(IGrupoDao grupoDao)
    {
        this.grupoDao = grupoDao;
    }

    public void setTemaDao(ITemaDao temaDao)
    {
        this.temaDao = temaDao;
    }

    public void setPeriodoDao(IPeriodoDao periodoDao)
    {
        this.periodoDao = periodoDao;
    }

    public void setSesionDao(ISesionDao sesionDao)
    {
        this.sesionDao = sesionDao;
    }

    public void setUsuarioDao(IUsuarioDao usuarioDao)
    {
        this.usuarioDao = usuarioDao;
    }

    public void setSemanaHelper(SemanaHelper semanaHelper)
    {
        this.semanaHelper = semanaHelper;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId,
        Principal principal)
    {
        String nombreAsignatura = this.grupoDao.obtenerNombreAsignatura(grupoId);
        Usuario usuario = this.usuarioDao.obtenerUsuario(principal.getName());

        // Obtener las clases del profesor y si registro sus temas en las sesiones de dichas semanas
        List<Sesion> sesiones = this.sesionDao.obtenerPorGrupoPorDocente(grupoId, usuario.getId());

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
                System.out.println(this.temaDao.obtenerSiIngresoTemas(sesion.getId()));
                Boolean resultado = this.temaDao.obtenerSiIngresoTemas(sesion.getId());
                registros.put(sesion, resultado);
            }
        }

        map.addAttribute("nombreAsignatura", nombreAsignatura);
        map.addAttribute("registros", registros);

        return "registrar-avance/index";
    }

    @RequestMapping(value = "/sesion/{sesionId}/avance", method = RequestMethod.GET)
    public String create(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId,
        @PathVariable(value="sesionId") Integer sesionId,
        RedirectAttributes redirectAttrs)
    {
        //List<Tema> temas = this.temaDao.obtenerTemasPorAsignaturaPorSemana(asignaturaAperturadaid, semana);
        // Obtener semanas de acuerdo a las fechas
        Periodo periodo = this.periodoDao.obtenerPeriodoActual();
        Map<Integer, Date> semanasRecientes = this.semanaHelper.retornarUltimasSemanas(periodo.getFechaInicio());
        Integer semanaInicio = this.semanaHelper.obtenerSemanaInicio(semanasRecientes);
        Integer semanaFin = this.semanaHelper.obtenerSemanaFin(semanasRecientes);

        List<Tema> temas = this.temaDao.obtenerTemasPorGrupo(grupoId, semanaInicio, semanaFin);

        map.addAttribute("semanasFecha", semanasRecientes);
        map.addAttribute("temas", temas);

        return "registrar-avance/registrar";
    }

    @RequestMapping(value = "/sesion/{sesionId}/avance", method = RequestMethod.POST)
    public String store(ModelMap map,
        @RequestParam(value = "temas[]", required = false) List<Integer> temas,
        @PathVariable(value="grupoId") Integer grupoId,
        @PathVariable(value="sesionId") Integer sesionId,
        RedirectAttributes redirectAttrs)
    {
        if (temas != null) {
            this.temaDao.insertarAvanceDeTemas(temas, sesionId);

            redirectAttrs.addFlashAttribute("mensajeOk", "Avance de temas registrados");
            return "redirect:/grupos/index";
        }

        map.addAttribute("mensajeError", "No ingreso ningun tema.");
        return "registrar-avance/registrar";
    }

}
