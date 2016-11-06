package com.junior.conexion;

public abstract class AccesoDB {
    protected String usuario;

    protected String password;

    protected Integer puerto;

    protected String host;

    public void setUsuario(String usuario)
    {
        this.usuario = usuario;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public void setPuerto(Integer puerto)
    {
        this.puerto = puerto;
    }

    public void setHost(String host)
    {
        this.host = host;
    }
}
