package com.junior.wrapper;

import java.util.List;

public class AsignaturaAperturaConTemasWrapper {
    private String asignatura;

    private Integer asignaturaAperturadaId;

    private List<TemaWrapper> temas;

    public String getAsignatura()
    {
        return asignatura;
    }

    public void setAsignatura(String asignatura)
    {
        this.asignatura = asignatura;
    }

    public Integer getAsignaturaAperturadaId()
    {
        return asignaturaAperturadaId;
    }

    public void setAsignaturaAperturadaId(Integer asignaturaAperturadaId)
    {
        this.asignaturaAperturadaId = asignaturaAperturadaId;
    }

    public List<TemaWrapper> getTemas()
    {
        return temas;
    }

    public void setTemas(List<TemaWrapper> temas)
    {
        this.temas = temas;
    }
}
