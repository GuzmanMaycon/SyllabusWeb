package com.junior.wrapper;

import java.util.List;

public class AlumnoTemasWrapper {
    private String codigo;

    private String nombres;

    private String apellidos;

    private List<AsignaturaAperturaConTemasWrapper> cursos;

    public String getNombres()
    {
        return nombres;
    }

    public void setNombres(String nombres)
    {
        this.nombres = nombres;
    }

    public String getApellidos()
    {
        return apellidos;
    }

    public void setApellidos(String apellidos)
    {
        this.apellidos = apellidos;
    }

    public List<AsignaturaAperturaConTemasWrapper> getCursos()
    {
        return cursos;
    }

    public void setCursos(List<AsignaturaAperturaConTemasWrapper> cursos)
    {
        this.cursos = cursos;
    }

    public String getCodigo()
    {
        return codigo;
    }

    public void setCodigo(String codigo)
    {
        this.codigo = codigo;
    }
}
