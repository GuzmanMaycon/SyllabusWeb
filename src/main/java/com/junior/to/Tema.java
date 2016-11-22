package com.junior.to;

public class Tema {

    private Integer id;

    private String descripcion;

    private Integer semana;

    private Integer unidad;
    
    private Integer id_tipo;
    
    private Integer id_syllabus;

    public Tema() {}

    // Anteriormente a este constructor se le pasaba por parametro el dato Id_Tema. Pero esto no seria necesario ya que al llamar al procedure
    // REG_TEMA genera un ID incremental.
    public Tema(String descripcion, Integer semana, Integer unidad, Integer tipo, Integer syllabus)
    {
        //this.id = id;
        this.descripcion = descripcion;
        this.unidad = unidad;
        this.semana = semana;
        this.id_tipo = tipo;
        this.id_syllabus = syllabus;
    }
    
    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public Integer getSemana()
    {
        return semana;
    }

    public void setSemana(Integer semana)
    {
        this.semana = semana;
    }

    public Integer getUnidad()
    {
        return unidad;
    }

    public void setUnidad(Integer unidad)
    {
        this.unidad = unidad;
    }
    
    public Integer getTipo()
    {
        return id_tipo;
    }

    public void setTipo(Integer tipo)
    {
        this.id_tipo = tipo;
    }   
    
    public Integer getSyllabus()
    {
        return id_syllabus;
    }

    public void setSyllabus(Integer syllabus)
    {
        this.id_syllabus = syllabus;
    }   
}
