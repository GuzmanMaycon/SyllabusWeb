package com.junior.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.junior.dao.design.IAsignaturaDao;
import com.junior.dao.design.ITemaDao;

@RequestMapping("/api/temas")
@Controller
public class TemaApiController {

    @Autowired
    private ITemaDao temaDao;

    @Autowired
    private IAsignaturaDao asignaturaDao;

    public void setTemaDao(ITemaDao temaDao)
    {
        this.temaDao = temaDao;
    }

    public void setAsignaturaDao(IAsignaturaDao asignaturaDao)
    {
        this.asignaturaDao = asignaturaDao;
    }

    //    @RequestMapping(value = "/{asignaturaAperturadaId}",
    //            method = RequestMethod.GET)
    //    public @ResponseBody TemasPorValidarWrapper obtenerPorAsignaturaAperturada(
    //        @PathVariable(value = "asignaturaAperturadaId") Integer asignaturaAperturadaid)
    //    {
    //        TemasPorValidarWrapper wrapper = new TemasPorValidarWrapper();
    //        AlumnoTemasWrapper alumno = new AlumnoTemasWrapper();
    //        List<AsignaturaAperturaConTemasWrapper> asignaturas = new ArrayList<AsignaturaAperturaConTemasWrapper>();
    //        AsignaturaAperturaConTemasWrapper asignaturaAperturada = new AsignaturaAperturaConTemasWrapper();
    //        List<Tema> temas = this.temaDao.obtenerTemasPorAsigAperturadaPorSemana(1, 1);
    //        Asignatura asignatura = this.asignaturaDao.obtenerAsignaturaPorAsigAperturada(asignaturaAperturadaid);
    //
    //        ArrayList<TemaWrapper> temasWrapper = new ArrayList<TemaWrapper>();
    //        for (Tema tema: temas) {
    //            TemaWrapper temaWrapper = new TemaWrapper();
    //            temaWrapper.setId(tema.getId());
    //            temaWrapper.setNombre(tema.getDescripcion());
    //            temaWrapper.setValidado(false);
    //
    //            temasWrapper.add(temaWrapper);
    //        }
    //
    //        asignaturaAperturada.setTemas(temasWrapper);
    //        asignaturaAperturada.setAsignatura(asignatura.getNombre());
    //
    //        asignaturas.add(asignaturaAperturada);
    //
    //        alumno.setCursos(asignaturas);
    //        alumno.setCodigo("12200187");
    //        alumno.setApellidos("Claudio Zavaleta");
    //        alumno.setNombres("Giancarlos Junior");
    //
    //        wrapper.setAlumno(alumno);
    //
    //        return wrapper;
    //    }
}
