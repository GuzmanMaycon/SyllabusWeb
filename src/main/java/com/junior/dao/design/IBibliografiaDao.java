package com.junior.dao.design;

import java.util.List;

import com.junior.to.Bibliografia;
import com.junior.to.Syllabus;

public interface IBibliografiaDao {
	public String editarBibliografia(Bibliografia bibliografia, Integer idSyllabus);
	public List<Bibliografia> obtenerPorSyllabus(Syllabus syllabus);
	public String eliminarBibliografia(Bibliografia bibliografia);
}
