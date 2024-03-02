/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HUY
 */
public class DBContext {
    protected  Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://-YUH-\\SQLEXPRESS:1433;databaseName=Project_Prj;encrypt=true;trustServerCertificate=true";
            String user = "huynm";
            String pass = "15112003";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
                
    }
    
    
}
