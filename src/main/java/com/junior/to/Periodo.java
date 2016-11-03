package com.junior.to;

import java.util.Date;

public class Periodo {
    private Integer anio;

    private Date fechaInicio;

    private Date fechaFin;

    private Integer semestre;

    public Integer getAnio()
    {
        return anio;
    }

    public void setAnio(Integer anio)
    {
        this.anio = anio;
    }

    public Date getFechaInicio()
    {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio)
    {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin()
    {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin)
    {
        this.fechaFin = fechaFin;
    }

    public Integer getSemestre()
    {
        return semestre;
    }

    public void setSemestre(Integer semestre)
    {
        this.semestre = semestre;
    }
}
