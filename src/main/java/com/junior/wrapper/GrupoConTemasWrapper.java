package com.junior.wrapper;

import java.util.List;

public class GrupoConTemasWrapper {

    private String asignatura;

    private Integer grupoId;

    private List<TemaWrapper> temas;

    public String getAsignatura()
    {
        return asignatura;
    }

    public void setAsignatura(String asignatura)
    {
        this.asignatura = asignatura;
    }

    public Integer getGrupoId()
    {
        return grupoId;
    }

    public void setGrupoId(Integer grupoId)
    {
        this.grupoId = grupoId;
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
