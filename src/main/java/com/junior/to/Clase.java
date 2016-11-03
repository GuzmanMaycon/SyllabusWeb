package com.junior.to;

import java.util.Date;

public class Clase {
    private Date horaInicio;

    private Date horaFin;

    private TipoClase tipo;

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
