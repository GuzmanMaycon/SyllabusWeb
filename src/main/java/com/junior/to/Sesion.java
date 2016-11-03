package com.junior.to;

import java.util.Date;

public class Sesion {
    private Character estado;

    private Date fecha;

    public Character getEstado()
    {
        return estado;
    }

    public void setEstado(Character estado)
    {
        this.estado = estado;
    }

    public Date getFecha()
    {
        return fecha;
    }

    public void setFecha(Date fecha)
    {
        this.fecha = fecha;
    }
}
