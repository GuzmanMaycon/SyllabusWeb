package com.junior.dao.design;

import java.util.List;

import com.junior.to.AsignaturaAperturadaTO;

public interface IAsignaturaAperturadaDao {
    public String obtenerNombreDeAsignaturaPorId(Integer id);
    public List<AsignaturaAperturadaTO> obtenerPorCoordinador(Integer coordinadorId);
    public List<AsignaturaAperturadaTO> obtenerPorDirector(Integer escuelaId);
}
