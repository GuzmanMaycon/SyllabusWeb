package com.junior.to;

public class Grupo {
    private AsignaturaAperturadaTO asignaturaAperturada;

    private Integer numero;

    private Integer id;

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return this.id;
    }

    public AsignaturaAperturadaTO getAsignaturaAperturada()
    {
        return asignaturaAperturada;
    }

    public void setAsignaturaAperturada(AsignaturaAperturadaTO asignaturaAperturada)
    {
        this.asignaturaAperturada = asignaturaAperturada;
    }

    public Integer getNumero()
    {
        return numero;
    }

    public void setNumero(Integer numero)
    {
        this.numero = numero;
    }
}
