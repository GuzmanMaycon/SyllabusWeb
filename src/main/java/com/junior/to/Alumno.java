package com.junior.to;

public class Alumno extends Usuario{
	private String situacion;

	public Alumno(
			Integer id, 
			String codigo, 
			String nombre, 
			String apellido, 
			String correo, 
			String contrasenia,
			String telefono, 
			String direccion, 
			Rol rol, 
			String situacion
			) 
	{
		super(id, codigo, nombre, apellido, correo, contrasenia, telefono, direccion, rol);
		this.situacion = situacion;
	}

	public String getSituacion() {
		return situacion;
	}

	public void setSituacion(String situacion) {
		this.situacion = situacion;
	}
}
