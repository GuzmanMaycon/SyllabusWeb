package com.junior.to;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Syllabus {
    private List<Bibliografia> bibliografia;

    private List<Tema> temas;

    private String estado;

    private Date fechaEntrega;

    private Date fechaAprobacion;

    public Syllabus()
    {
        bibliografia = new ArrayList<Bibliografia>();
        temas        = new ArrayList<Tema>();
    }

    public List<Bibliografia> getBibliografia()
    {
        return bibliografia;
    }

    public void setBibliografia(List<Bibliografia> bibliografia)
    {
        this.bibliografia = bibliografia;
    }

    public List<Tema> getTemas()
    {
        return temas;
    }

    public void setTemas(List<Tema> temas)
    {
        this.temas = temas;
    }

    public String getEstado()
    {
        return estado;
    }

    public void setEstado(String estado)
    {
        this.estado = EstadoSyllabus.valueOf(estado).toString();
    }

    public Date getFechaEntrega()
    {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega)
    {
        this.fechaEntrega = fechaEntrega;
    }

    public Date getFechaAprobacion()
    {
        return fechaAprobacion;
    }

    public void setFechaAprobacion(Date fechaAprobacion)
    {
        this.fechaAprobacion = fechaAprobacion;
    }

    public void addTema(Tema tema)
    {
        this.temas.add(tema);
    }

    public void addLibro(Bibliografia libro)
    {
        this.bibliografia.add(libro);
    }
}
