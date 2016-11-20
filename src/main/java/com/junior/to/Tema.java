package com.junior.to;

public class Tema {

    private Integer id;

    private String descripcion;

    private Integer semana;

    private Integer unidad;

    private Integer tipoId;

    private Integer syllabusId;

    public Tema() {}

    public Tema(Integer id, String descripcion, Integer semana, Integer unidad, Integer tipoId, Integer syllabusId)
    {
        this.id = id;
        this.descripcion = descripcion;
        this.unidad = unidad;
        this.semana = semana;
        this.tipoId = tipoId;
        this.syllabusId = syllabusId;
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

    public Integer getTipoId()
    {
        return tipoId;
    }

    public void setTipoId(Integer tipoId)
    {
        this.tipoId = tipoId;
    }

    public Integer getSyllabusId()
    {
        return syllabusId;
    }

    public void setSyllabusId(Integer syllabusId)
    {
        this.syllabusId = syllabusId;
    }
}
