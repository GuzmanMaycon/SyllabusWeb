package com.junior.to;

public class Rol {

    private Integer id;

    private String nombre;

    private String descripcion;

    public Rol(
            Integer id,
            String nombre,
            String descripcion
            )
    {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }
    
    public Rol(){};

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }
}
