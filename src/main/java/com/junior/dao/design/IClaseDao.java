package com.junior.dao.design;

import java.util.List;

import com.junior.to.Clase;

public interface IClaseDao {
    public List<Clase> obtenerPorGrupoPorDocente(Integer grupoId, Integer docenteId);
}
