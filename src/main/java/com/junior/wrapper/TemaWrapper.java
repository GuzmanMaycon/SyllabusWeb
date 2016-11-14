package com.junior.wrapper;

/**
 * Clase para englobar las propiedades de un tema necesario para los webservice
 * @author Junior Claudio
 * @version 1.0.0
 */
public class TemaWrapper {

    private Integer id;

    private String nombre;

    private Boolean validado;

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

    public Boolean getValidado()
    {
        return this.validado;
    }

    public void setValidado(Boolean validado)
    {
        this.validado = validado;
    }
}
