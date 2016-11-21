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

import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.dao.design.IPeriodoDao;
import com.junior.dao.design.ITemaDao;
import com.junior.helpers.SemanaHelper;
import com.junior.to.Periodo;
import com.junior.to.Tema;
import com.junior.to.TipoClase;

@Controller
@RequestMapping("/asignatura/{asignaturaAperturadaId}")
public class AvanceTemaController {

    @Autowired
    private IAsignaturaAperturadaDao asignaturaAperturadaDao; // Dao para asignaturas aperturadas

    @Autowired
    private ITemaDao temaDao;

    @Autowired
    private IPeriodoDao periodoDao;

    public void setAsignaturaAperturadaDao(IAsignaturaAperturadaDao asignaturaAperturadaDao)
    {
        this.asignaturaAperturadaDao = asignaturaAperturadaDao;
    }

    public void setTemaDao(ITemaDao temaDao)
    {
        this.temaDao = temaDao;
    }

    public void setPeriodoDao(IPeriodoDao periodoDao)
    {
        this.periodoDao = periodoDao;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map,
        @PathVariable(value="asignaturaAperturadaId") Integer asignaturaAperturadaid,
        Principal usuario)
    {
        String nombreAsignatura = this.asignaturaAperturadaDao.obtenerNombreDeAsignaturaPorId(asignaturaAperturadaid);

        Map<Integer, Map<TipoClase, Boolean>> semanas = new LinkedHashMap<Integer, Map<TipoClase,Boolean>>();
        // Obtener semanas de acuerdo a las fechas
        Periodo periodo = this.periodoDao.obtenerPeriodoActual();
        Map<Integer, Date> semanasRecientes = SemanaHelper.retornarUltimasSemanas(periodo.getFechaInicio());

        // Obtener las clases del profesor y si registro sus temas en las sesiones de dichas semanas
        TipoClase teoria = new TipoClase();
        TipoClase labo = new TipoClase();
        teoria.setDescripcion("Teoria");
        labo.setDescripcion("Labo");

        for(Map.Entry<Integer, Date> entry : semanasRecientes.entrySet()) {
            Map<TipoClase, Boolean> registro = new LinkedHashMap<>();
            registro.put(teoria, true);
            registro.put(labo, false);
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
