package com.junior.to;

public class Asignatura {

    private String codigo;

    private String nombre;

    private Integer creditaje;

    private Integer ciclo;

    private PlanDeEstudio plan;

    public Asignatura(){}

    public Asignatura(PlanDeEstudio plan)
    {
        this.setPlan(plan);
    }

    public void setPlan(PlanDeEstudio plan)
    {
        this.plan = plan;
    }

    public PlanDeEstudio getPlan()
    {
        return this.plan;
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


}
