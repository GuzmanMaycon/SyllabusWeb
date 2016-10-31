package com.junior.to;

import java.util.Date;
import java.util.List;

public class Syllabus {
    private List<Bibliografia> bibliografia;

    private List<Tema> temas;

    private EstadoSyllabus estado;

    private Date fechaEntrega;

    private Date fechaAprobacion;

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

    public EstadoSyllabus getEstado()
    {
        return estado;
    }

    public void setEstado(EstadoSyllabus estado)
    {
        this.estado = estado;
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
}
