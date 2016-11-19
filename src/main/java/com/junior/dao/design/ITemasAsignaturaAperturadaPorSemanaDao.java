package com.junior.dao.design;

import java.util.List;
import com.junior.to.Tema;

public interface ITemasAsignaturaAperturadaPorSemanaDao {
	public List<Tema> obtenerTemasPorAsignaturaPorSemana(Integer idAsignaturaAperturada,  Integer numeroSemana);
}
