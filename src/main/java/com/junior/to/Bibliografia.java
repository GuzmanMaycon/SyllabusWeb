package com.junior.to;

public class Bibliografia {

    private Integer id;

    private String autor;

    private Integer anioPublicacion;

    private String titulo;

    private String lugarPublicacion;

    private String editorial;

    private String isbn;

    public Bibliografia(){}

    public Bibliografia(
            Integer id,
            String autor,
            Integer anioPublicacion,
            String titulo,
            String lugarPublicacion,
            String editorial
            )
    {
        this.id = id;
        this.autor = autor;
        this.anioPublicacion = anioPublicacion;
        this.titulo = titulo;
        this.lugarPublicacion = lugarPublicacion;
        this.editorial = editorial;
    }

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getAutor()
    {
        return autor;
    }

    public void setAutor(String autor)
    {
        this.autor = autor;
    }

    public Integer getAnioPublicacion()
    {
        return anioPublicacion;
    }

    public void setAnioPublicacion(Integer anioPublicacion)
    {
        this.anioPublicacion = anioPublicacion;
    }

    public String getTitulo()
    {
        return titulo;
    }

    public void setTitulo(String titulo)
    {
        this.titulo = titulo;
    }

    public String getLugarPublicacion()
    {
        return lugarPublicacion;
    }

    public void setLugarPublicacion(String lugarPublicacion)
    {
        this.lugarPublicacion = lugarPublicacion;
    }

    public String getEditorial()
    {
        return editorial;
    }

    public void setEditorial(String editorial)
    {
        this.editorial = editorial;
    }

    public String getIsbn()
    {
        return isbn;
    }

    public void setIsbn(String isbn)
    {
        this.isbn = isbn;
    }
}
