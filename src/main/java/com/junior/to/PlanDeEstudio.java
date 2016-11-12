package com.junior.to;

import java.util.List;

public class PlanDeEstudio {

    private Integer id;

    private String nombre;

    private Boolean estaVigente;

    private Integer anioDePublicacion;

    private List<Asignatura> asignaturas;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public Boolean getEstaVigente()
    {
        return estaVigente;
    }

    public void setEstaVigente(Boolean estaVigente)
    {
        this.estaVigente = estaVigente;
    }

    public Integer getAnioDePublicacion()
    {
        return anioDePublicacion;
    }

    public void setAnioDePublicacion(Integer anioDePublicacion)
    {
        this.anioDePublicacion = anioDePublicacion;
    }

    public List<Asignatura> getAsignaturas()
    {
        return asignaturas;
    }

    public void setAsignaturas(List<Asignatura> asignaturas)
    {
        this.asignaturas = asignaturas;
    }

    public void addAsignatura(Asignatura asignatura)
    {
        this.asignaturas.add(asignatura);
    }
}
