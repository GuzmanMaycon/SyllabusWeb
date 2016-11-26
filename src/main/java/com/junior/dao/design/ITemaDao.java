package com.junior.dao.design;

import java.util.List;

import com.junior.to.Syllabus;
import com.junior.to.Tema;

public interface ITemaDao {
    public List<Tema> obtenerPorSyllabus(Syllabus syllabus);
    public String editarTema(Tema tema, Integer idSyllabus);
    public String eliminarTema(Tema tema);
    public List<Tema> obtenerTemasPorGrupo(Integer idGrupo, Integer semanaInicio, Integer semanaFin);
    public List<Tema> obtenerAvancePorValidar(Integer idGrupo, Integer idAlumno);

    public Boolean obtenerSiIngresoTemas(Integer idSesion);
    public Boolean obtenerSiValidoTemas(Integer idSesion, Integer idAlumno);

    public String insertarAvanceDeTemas(List<Integer> temasId, Integer idSesion);
    public String insertarTemasExtras(List<String> temasExtras, Integer sesionId);
    public String insertarValidacionDeTemas(List<Integer> temasId, Integer idSesion, Integer idAlumno);
}
