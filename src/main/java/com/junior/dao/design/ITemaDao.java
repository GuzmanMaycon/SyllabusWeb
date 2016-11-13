package com.junior.dao.design;

import java.util.List;

import com.junior.to.Tema;

public interface ITemaDao {
    public List<Tema> obtenerTemasPorAsigAperturadaPorSemana(Integer asigAperturadaId, Integer semana);
}
