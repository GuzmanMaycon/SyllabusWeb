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
    public Boolean obtenerSiIngresoTemas(Integer idClase);
}
