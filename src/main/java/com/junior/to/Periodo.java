package com.junior.to;

import java.util.Date;

public class Periodo {
	
	private Integer id;
	
    private Integer anio;

    private Date fechaInicio;

    private Date fechaFin;

    private Integer semestre;

    public Periodo(
    		Integer id, 
    		Integer anio, 
    		Date fechaInicio, 
    		Date fechaFin, 
    		Integer semestre
    		) 
    {
		this.id = id;
		this.anio = anio;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.semestre = semestre;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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
