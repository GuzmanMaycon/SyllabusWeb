package com.junior.dao.design;

import com.junior.to.EstadoSyllabus;
import com.junior.to.Syllabus;

public interface ISyllabusDao {
    public String insertarSyllabus(Syllabus syllabus);
    public String editarSyllabus(Syllabus syllabus);
    public EstadoSyllabus obtenerEstadoPorAsigAperturadaId(Integer asigAperturadaId);
    public Syllabus obtenerSyllabus(Integer syllabusId);
}
