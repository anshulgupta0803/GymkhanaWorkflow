/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.sql.SQLException;

public class LoginValidate
{
    public Boolean validate (String username, String password)
    {
        DbConnect db = new DbConnect ();
        String SQL = "SELECT 1 FROM `login` WHERE `login_username` = '" + username + "' AND `login_password` = PASSWORD('" + password +"')";
        try
        {
            db.pstmt = db.conn.prepareStatement (SQL);
            try
            {
                db.rs = db.pstmt.executeQuery();
                if (db.rs.next())
                    return true;
                else
                    return false;
                
            }
            catch (SQLException e){}
        }
	catch(SQLException e){}
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException e){}
        }
        return false;
    }
    
   /* public static void main(String[] arg)
    {
        System.out.println(validate ("utkarshp","utkarsh"));
    }*/
}