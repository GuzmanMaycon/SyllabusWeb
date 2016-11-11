package com.junior.to;

import java.util.Date;

public class Clase {
	
	private Integer id;
	
    private Date horaInicio;

    private Date horaFin;

    private TipoClase tipo;

    public Clase(
    		Integer id, 
    		Date horaInicio, 
    		Date horaFin, 
    		TipoClase tipo
    		) 
    {
		this.id = id;
		this.horaInicio = horaInicio;
		this.horaFin = horaFin;
		this.tipo = tipo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getHoraInicio()
    {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio)
    {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin()
    {
        return horaFin;
    }

    public void setHoraFin(Date horaFin)
    {
        this.horaFin = horaFin;
    }

    public TipoClase getTipo()
    {
        return tipo;
    }

    public void setTipo(TipoClase tipo)
    {
        this.tipo = tipo;
    }
}
