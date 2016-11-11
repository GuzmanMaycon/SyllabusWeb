package com.junior.to;

public class Asignatura {
    private Integer id;

    private String codigo;

    private String nombre;

    private Integer creditaje;

    private Integer ciclo;

    private String regimen;

    public Asignatura(
            Integer id,
            String codigo,
            String nombre,
            Integer creditaje,
            Integer ciclo,
            String regimen
            )
    {
        this.id = id;
        this.codigo = codigo;
        this.nombre = nombre;
        this.creditaje = creditaje;
        this.ciclo = ciclo;
        this.regimen = regimen;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCodigo()
    {
        return codigo;
    }

    public void setCodigo(String codigo)
    {
        this.codigo = codigo;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public Integer getCreditaje()
    {
        return creditaje;
    }

    public void setCreditaje(Integer creditaje)
    {
        this.creditaje = creditaje;
    }

    public Integer getCiclo()
    {
        return ciclo;
    }

    public void setCiclo(Integer ciclo)
    {
        this.ciclo = ciclo;
    }

    public String getRegimen() {
        return regimen;
    }

    public void setRegimen(String regimen) {
        this.regimen = regimen;
    }
}
