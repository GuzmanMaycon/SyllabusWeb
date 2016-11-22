package com.junior.dao.design;

import java.util.ArrayList;
import java.util.List;
import com.junior.to.Tema;

public interface ITemaDao {
	public String insertarTema(Tema tema);
    public List<Tema> obtenerTodos(Integer idSyllabus);
	public String actualizarTemas(ArrayList<Tema> temas, Integer idSyllabus);
	public String eliminarTema(Tema tema);
	public String eliminarTemasXSyllabus(Integer idSyllabus);
	public String registrarAvance(Tema tema);
}
