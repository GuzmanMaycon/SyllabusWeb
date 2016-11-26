package com.junior.wrapper;

import java.util.List;

public class SemanaWrapper {

    private Integer numero;

    private String fechaInicio;

    private String fechaFin;

    private List<AsignaturaValidada> asignaturas;

    public Integer getNumero()
    {
        return numero;
    }

    public void setNumero(Integer numero)
    {
        this.numero = numero;
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

    public List<AsignaturaValidada> getAsignaturas()
    {
        return asignaturas;
    }

    public void setAsignaturas(List<AsignaturaValidada> asignaturas)
    {
        this.asignaturas = asignaturas;
    }
}
