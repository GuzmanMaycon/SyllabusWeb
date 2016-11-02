package com.junior.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccesoDB {
    public Connection getConnection() {
        Connection cn = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            cn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } catch ( Exception e) {
            System.err.println(e.getMessage());
        }

        return cn;
    }
    public AccesoDB() {
    }
}
