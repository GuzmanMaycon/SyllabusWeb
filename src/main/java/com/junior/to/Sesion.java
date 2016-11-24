package com.junior.to;

import java.util.Date;

public class Sesion {

    private Integer id;

    private Character estado;

    private Date fecha;

    private Clase clase;

    public Sesion() { }

    public Sesion(
        Integer id,
        Character estado,
        Date fecha
            )
    {
        this.id = id;
        this.estado = estado;
        this.fecha = fecha;
    }

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

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

    public Clase getClase()
    {
        return clase;
    }

    public void setClase(Clase clase)
    {
        this.clase = clase;
    }
}
