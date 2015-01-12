/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.sql.SQLException;

/**
 *
 * @author UTKARSH
 */
public class GetUserType 
{
    public int get_user_type (String username, String password)
    {
        DbConnect db = new DbConnect ();
        String SQL = "SELECT login_type FROM login WHERE login_username = '" + username + "'AND login_password = PASSWORD('"+password+"')";	
	try
        {
            db.pstmt = db.conn.prepareStatement (SQL);
            //db.pstmt.setString (1, username);
            //db.pstmt.setString (2, password);
            try
            {
                db.rs = db.pstmt.executeQuery();
                
                if(db.rs.next())
                    return db.rs.getInt(1);
            }
            catch (SQLException e){}
        }
        catch (SQLException e){}
        finally
        {
            
            try
            {
                db.conn.close();
            }
            catch (SQLException e){}
        }
        return -1;
    }
}
