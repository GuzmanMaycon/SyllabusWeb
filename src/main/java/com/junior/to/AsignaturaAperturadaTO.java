package com.junior.to;

public class AsignaturaAperturadaTO {
    private Integer id;

    private Asignatura asignatura;

    private Periodo periodo;

    public AsignaturaAperturadaTO(
            Integer id,
            Asignatura asignatura,
            Periodo periodo
            )
    {
        this.id = id;
        this.asignatura = asignatura;
        this.periodo = periodo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Asignatura getAsignatura()
    {
        return asignatura;
    }

    public void setAsignatura(Asignatura asignatura)
    {
        this.asignatura = asignatura;
    }

    public Periodo getPeriodo()
    {
        return periodo;
    }

    public void setPeriodo(Periodo periodo)
    {
        this.periodo = periodo;
    }
}
