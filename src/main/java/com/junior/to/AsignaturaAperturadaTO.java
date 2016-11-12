package com.junior.to;

public class AsignaturaAperturadaTO {

    private Asignatura asignatura;

    private Periodo periodo;

    private Integer id;

    private Syllabus syllabus;

    public AsignaturaAperturadaTO(){}

    public AsignaturaAperturadaTO(Integer id, Asignatura asignatura, Periodo periodo)
    {
        this.id = id;
        this.asignatura = asignatura;
        this.periodo = periodo;
    }

    public void setSyllabus(Syllabus syllabus)
    {
        this.syllabus = syllabus;
    }

    public Syllabus getSyllabus()
    {
        return this.syllabus;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return this.id;
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
