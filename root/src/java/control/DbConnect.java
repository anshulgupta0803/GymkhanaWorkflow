/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Anshul Gupta
 */
public class DbConnect
{
    static final String URL = "jdbc:mysql://localhost/gymkhanaWorkflow";
    static final String user = "root";
    static final String password = "anshul";

    public Connection conn;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public DbConnect ()
    {
        conn = null;
        pstmt = null;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, user, password);
        }
        catch(SQLException | ClassNotFoundException e){}
    }
}
