package com.junior.wrapper;

public class AsignaturaValidada {

    private Integer grupoId;

    private String asignaturaNombre;

    private Boolean validado;

    private String fechaInicio;

    private String fechaFin;

    public Integer getGrupoId()
    {
        return grupoId;
    }

    public void setGrupoId(Integer grupoId)
    {
        this.grupoId = grupoId;
    }

    public String getAsignaturaNombre()
    {
        return asignaturaNombre;
    }

    public void setAsignaturaNombre(String asignaturaNombre)
    {
        this.asignaturaNombre = asignaturaNombre;
    }

    public Boolean getValidado()
    {
        return validado;
    }

    public void setValidado(Boolean validado)
    {
        this.validado = validado;
    }

    public String getFechaInicio()
    {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio)
    {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin()
    {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin)
    {
        this.fechaFin = fechaFin;
    }
}
