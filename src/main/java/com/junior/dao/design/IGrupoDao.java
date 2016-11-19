package com.junior.dao.design;

import java.util.List;

import com.junior.to.Grupo;;

public interface IGrupoDao {
    public List<Grupo> obtenerTodos();

    public List<Grupo> obtenerPorAlumno(Integer codigo);
    public List<Grupo> obtenerPorDocente(Integer codigo);
}
