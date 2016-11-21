package com.junior.dao.design;

import java.util.List;

import com.junior.to.Bibliografia;
import com.junior.to.Syllabus;

public interface IBibliografiaDao {
	public String editarBibliografia(Bibliografia bibliografia, Integer idSyllabus);
	public List<Bibliografia> obtenerPorSyllabus(Integer idSyllabus);
	public String eliminarBibliografia(Bibliografia bibliografia);
	public String actualizarRefBibliograficasDelSyllabus(Integer idSyllabus, List<Bibliografia> listaBibliografiaNueva);
	public String insertarBibliografia(Bibliografia bibliografia, Integer idSyllabus);
}
