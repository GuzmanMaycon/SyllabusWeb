package com.junior.to;

public class Tema {

    private Integer id;

    private String descripcion;

    private Integer semana;

    private Integer unidad;

    public Tema() {}

    public Tema(Integer id, String descripcion, Integer semana, Integer unidad)
    {
        this.id = id;
        this.descripcion = descripcion;
        this.semana = semana;
        this.unidad = unidad;
    }

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public Integer getSemana()
    {
        return semana;
    }

    public void setSemana(Integer semana)
    {
        this.semana = semana;
    }

    public Integer getUnidad()
    {
        return unidad;
    }

    public void setUnidad(Integer unidad)
    {
        this.unidad = unidad;
    }
}
