package com.junior.to;

public class PlanDeEstudio {
    private String nombre;

    private Boolean estaVigente;

    private Integer anioDePublicacion;

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
}
