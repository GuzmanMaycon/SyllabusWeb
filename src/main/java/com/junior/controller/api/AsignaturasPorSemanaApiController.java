package com.junior.controller.api;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.junior.dao.design.IGrupoDao;
import com.junior.dao.design.IPeriodoDao;
import com.junior.dao.design.ISesionDao;
import com.junior.dao.design.ITemaDao;
import com.junior.dao.design.IUsuarioDao;
import com.junior.helpers.SemanaHelper;
import com.junior.to.Grupo;
import com.junior.to.Periodo;
import com.junior.to.Sesion;
import com.junior.to.Usuario;
import com.junior.wrapper.AsignaturaValidada;
import com.junior.wrapper.AsignaturasPorSemanaWrapper;
import com.junior.wrapper.SemanaWrapper;

@RequestMapping("/api/alumno/{correo}")
@Controller
public class AsignaturasPorSemanaApiController {

    @Autowired
    private IUsuarioDao usuarioDao;

    @Autowired
    private IGrupoDao grupoDao;

    @Autowired
    private IPeriodoDao periodoDao;

    @Autowired
    private SemanaHelper semanaHelper;

    @Autowired
    private ISesionDao sesionDao;

    @Autowired
    private ITemaDao temaDao;

    public void setUsuarioDao(IUsuarioDao usuarioDao)
    {
        this.usuarioDao = usuarioDao;
    }

    public void setGrupoDao(IGrupoDao grupoDao)
    {
        this.grupoDao = grupoDao;
    }

    public void setSemanaHelper(SemanaHelper semanaHelper)
    {
        this.semanaHelper = semanaHelper;
    }

    @RequestMapping("/grupos")
    public @ResponseBody AsignaturasPorSemanaWrapper obtenerPorAsignaturaAperturada(
        @PathVariable(value = "correo") String correo)
    {
        AsignaturasPorSemanaWrapper response = new AsignaturasPorSemanaWrapper();

        List<SemanaWrapper> semanas = new ArrayList<SemanaWrapper>();

        Usuario usuario = this.usuarioDao.obtenerUsuario(correo);
        List<Grupo> grupos = this.grupoDao.obtenerPorAlumno(usuario.getId());
        Periodo periodo = this.periodoDao.obtenerPeriodoActual();
        Map<Integer, Date> semanasRecientes = this.semanaHelper.retornarUltimasSemanas(periodo.getFechaInicio());
        SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");

        for (Grupo grupo : grupos) {
            List<Sesion> sesiones = this.sesionDao.obtenerPorGrupoPorAlumno(grupo.getId(), usuario.getId());

            SemanaWrapper semanaWrapper = new SemanaWrapper();
            for (Sesion sesion: sesiones) {

                Date fechaSesion = sesion.getFecha();
                // Obtener semana actual y si se puede ver registros de hace 2 semanas

                List<AsignaturaValidada> asignaturasValidadas = new ArrayList<AsignaturaValidada>();

                for (Map.Entry<Integer, Date> entry: semanasRecientes.entrySet()) {
                    Date fechaInicio = entry.getValue();
                    // Hacer el objeto Calendar con la fecha de inicio
                    Calendar fecha = Calendar.getInstance();
                    fecha.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
                    fecha.clear(Calendar.MINUTE);
                    fecha.clear(Calendar.SECOND);
                    fecha.clear(Calendar.MILLISECOND);
                    fecha.setTime(fechaInicio);

                    // Añadir dias hasta antes de una semana
                    fecha.add(Calendar.WEEK_OF_YEAR, 1);
                    fecha.add(Calendar.DAY_OF_WEEK,-1);
                    Date fechaFin = fecha.getTime();

                    String fechaInicioFormateada = sdf.format(fechaInicio);
                    String fechaFinFormateada = sdf.format(fechaFin);

                    semanaWrapper.setFechaInicio(fechaInicioFormateada);
                    semanaWrapper.setFechaFin(fechaFinFormateada);
                    semanaWrapper.setNumero(entry.getKey());

                    AsignaturaValidada asignatura = new AsignaturaValidada();
                    if (fechaInicio.compareTo(fechaSesion) <= 0  && fechaFin.compareTo(fechaSesion) >= 0) {
                        Boolean resultado = this.temaDao.obtenerSiValidoTemas(sesion.getId(), usuario.getId());
                        asignatura.setGrupoId(grupo.getId());
                        asignatura.setAsignaturaNombre(grupo.getAsignaturaAperturada().getAsignatura().getNombre());
                        asignatura.setValidado(resultado);
                        asignatura.setFechaInicio(fechaInicioFormateada);
                        asignatura.setFechaFin(fechaFinFormateada);
                        asignaturasValidadas.add(asignatura);

                        semanaWrapper.setAsignaturas(asignaturasValidadas);
                        semanas.add(semanaWrapper);
                    }
                }
            }
        }

        response.setSemanas(semanas);

        return response;
    }

}
