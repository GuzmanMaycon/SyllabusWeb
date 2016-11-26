package com.junior.dao.design;

import java.util.List;

import com.junior.to.Docente;

public interface IDocenteDao {
    public List<Docente> obtenerPorAsignaturaAperturada(Integer asignaturaId);
}
