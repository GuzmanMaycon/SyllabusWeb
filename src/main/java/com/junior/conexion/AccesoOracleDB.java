package com.junior.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccesoOracleDB extends AccesoDB implements IAccesoDB {

    public Connection getConnection()
    {
        Connection cn = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            cn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@"+ this.host + ":" + this.puerto + ":xe",
                    this.usuario,
                    this.password);
        } catch (SQLException e) {
            System.err.println("SQL:" + e.getMessage());
        } catch ( Exception e) {
            System.err.println("aaa" + e.getMessage());
        }

        return cn;
    }

}
