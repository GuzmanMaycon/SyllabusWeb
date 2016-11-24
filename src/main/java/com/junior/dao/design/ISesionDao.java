package com.junior.dao.design;

import java.util.List;

import com.junior.to.Sesion;

public interface ISesionDao {
    public List<Sesion> obtenerPorGrupoPorDocente(Integer grupoId, Integer docenteId);
}
