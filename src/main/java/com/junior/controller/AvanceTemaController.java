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
import com.junior.to.Clase;
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

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map,
        @PathVariable(value="grupoId") Integer grupoId,
        Principal principal)
    {
        String nombreAsignatura = "";
        Usuario usuario = this.usuarioDao.obtenerUsuario(principal.getName());

        Map<Integer, Map<Sesion, Boolean>> semanas = new LinkedHashMap<Integer, Map<Sesion,Boolean>>();
        // Obtener semanas de acuerdo a las fechas
        Periodo periodo = this.periodoDao.obtenerPeriodoActual();
        Map<Integer, Date> semanasRecientes = SemanaHelper.retornarUltimasSemanas(periodo.getFechaInicio());

        // Obtener las clases del profesor y si registro sus temas en las sesiones de dichas semanas
        List<Sesion> sesiones = this.sesionDao.obtenerPorGrupoPorDocente(grupoId, usuario.getId());

        for(Map.Entry<Integer, Date> entry : semanasRecientes.entrySet()) {
            Map<Sesion, Boolean> registro = new LinkedHashMap<>();
            for(Sesion sesion: sesiones) {
                Boolean resultado = this.temaDao.obtenerSiIngresoTemas(sesion.getId());
                registro.put(sesion, resultado);
            }
            semanas.put(entry.getKey(), registro);
        }
        map.addAttribute("nombreAsignatura", nombreAsignatura);
        map.addAttribute("semanas", semanas);
        map.addAttribute("semanasFecha", semanasRecientes);

        return "registrar-avance/index";
    }

    @RequestMapping(value = "/semana/{semana}/{tipoClase}/avance", method = RequestMethod.GET)
    public String create(ModelMap map,
        @PathVariable(value="asignaturaAperturadaId") Integer asignaturaAperturadaid,
        @PathVariable(value="semana") Integer semana,
        @PathVariable(value="tipoClase") String tipoClase,
        RedirectAttributes redirectAttrs)
    {
        List<Tema> temas = this.temaDao.obtenerTemasPorAsignaturaPorSemana(asignaturaAperturadaid, semana);


        return "registrar-avance/registrar";
    }

    @RequestMapping(value = "/semana/{semana}/clase/{tipoClase}/avance", method = RequestMethod.POST)
    public String store(ModelMap map,
        @RequestParam(value = "temas[]", required = false) List<Integer> temas,
        @PathVariable(value="asignaturaAperturadaId") Integer asignaturaAperturadaid,
        @PathVariable(value="semana") Integer semana,
        @PathVariable(value="tipoClase") String tipoClase,
        RedirectAttributes redirectAttrs)
    {
        if(temas != null) {
            for(Object t: temas)
                System.out.println(t);

            redirectAttrs.addFlashAttribute("mensajeOk", "Avance de temas registrados");
            return "redirect:/grupos/index";
        }

        map.addAttribute("mensajeError", "No ingreso ningun tema.");
        return "registrar-avance/registrar";
    }

}
