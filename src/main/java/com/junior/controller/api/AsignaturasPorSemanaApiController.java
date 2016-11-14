package com.junior.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.junior.dao.design.IAsignaturaAperturadaDao;
import com.junior.to.AsignaturaAperturadaTO;
import com.junior.wrapper.AsignaturaValidada;
import com.junior.wrapper.AsignaturasPorSemanaWrapper;
import com.junior.wrapper.SemanaWrapper;

@RequestMapping("/api/alumno/{codigo}")
@Controller
public class AsignaturasPorSemanaApiController {

    // private AlumnoDao alumnoDao;

    private IAsignaturaAperturadaDao asignaturaAperturadaDao;

    public void setAsignaturaAperturadaDao(IAsignaturaAperturadaDao asignaturaAperturadaDao)
    {
        this.asignaturaAperturadaDao = asignaturaAperturadaDao;
    }

    @RequestMapping("/asignaturas")
    public @ResponseBody AsignaturasPorSemanaWrapper obtenerPorAsignaturaAperturada(
        @PathVariable(value = "codigo")Integer codigo)
    {
        AsignaturasPorSemanaWrapper response = new AsignaturasPorSemanaWrapper();

        List<SemanaWrapper> semanas = new ArrayList<SemanaWrapper>();
        SemanaWrapper semanaWrapper = new SemanaWrapper();
        List<AsignaturaValidada> asignaturasValidadas = new ArrayList<AsignaturaValidada>();

        List<AsignaturaAperturadaTO> asignaturasAperturadas = this.asignaturaAperturadaDao.obtenerPorAlumno(codigo);
        for (AsignaturaAperturadaTO asigAper : asignaturasAperturadas) {
            AsignaturaValidada asignatura = new AsignaturaValidada();
            asignatura.setAsignaturaAperturadaId(asigAper.getId());
            asignatura.setAsignaturaNombre(asigAper.getAsignatura().getNombre());


            // Obtener semana actual y si se puede ver registros de hace 2 semanas
            int semanasPosibles = 2;
            for (int i = semanasPosibles; i >= 0; i--) {
                // Dentro de cada semana verificar si el alumno validado las clases de sus asignaturas
                semanaWrapper.setFechaInicio("14-11-2016");
                semanaWrapper.setFechaFin("21-11-2016");
                semanaWrapper.setNumero(1);

                Boolean validado = false;
                asignatura.setValidado(validado);

                asignaturasValidadas.add(asignatura);
                semanaWrapper.setAsignaturas(asignaturasValidadas);
            }
        }



        semanas.add(semanaWrapper);
        response.setSemanas(semanas);

        return response;
    }

}
