package com.junior.to;

public class Escuela {
	
	private Integer id;
	
    private String nombre;
    
    public Escuela(
    		Integer id, 
    		String nombre
    		) 
    {
		this.id = id;
		this.nombre = nombre;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Escuela(String nombre) {
    	this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}
