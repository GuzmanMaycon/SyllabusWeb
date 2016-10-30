package com.junior.to;

public class Tema {

    private Integer id;

    private String name;

    private Integer semanaId;

    public Tema() {}

    public Tema(Integer id, String name, Integer semanaId)
    {
        this.id = id;
        this.name = name;
        this.semanaId = semanaId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSemanaId() {
        return semanaId;
    }

    public void setSemanaId(Integer semanaId) {
        this.semanaId = semanaId;
    }
}
