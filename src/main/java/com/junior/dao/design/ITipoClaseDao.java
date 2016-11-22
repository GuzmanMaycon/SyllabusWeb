package com.junior.dao.design;

import java.util.List;

import com.junior.to.TipoClase;

public interface ITipoClaseDao {
    public List<TipoClase> obtenerTipoClasesPorGrupoPorDocente(Integer grupoId, Integer docenteId);
}
