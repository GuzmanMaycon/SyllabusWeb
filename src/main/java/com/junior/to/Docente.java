package com.junior.to;

public class Docente extends Usuario{
	private String grado;

	public Docente(
			Integer id, 
			String codigo, 
			String nombre, 
			String apellido, 
			String correo, 
			String contrasenia,
			String telefono, 
			String direccion, 
			Rol rol, 
			String grado
			) 
	{
		super(id, codigo, nombre, apellido, correo, contrasenia, telefono, direccion, rol);
		this.grado = grado;
	}

	public String getGrado() {
		return grado;
	}

	public void setGrado(String grado) {
		this.grado = grado;
	} 
}
