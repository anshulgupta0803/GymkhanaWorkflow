/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author UTKARSH
 */
public class FetchClubs {
    
    public ResultSet FetchClubs_Presi()
    {
        DbConnect db = new DbConnect();
                    
        String SQL = "SELECT * FROM `club` WHERE club_last_approved_by = \"0\" AND club_current_approval_status = \"1\"";
        try
        {
            db.pstmt = db.conn.prepareStatement (SQL);
            
            try
            {
                db.rs = db.pstmt.executeQuery();
                return db.rs;
            }catch(SQLException Ex)
            {
            }
        }catch(SQLException Ex)
        {
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException e){}
        }
        return null;
    }
    
}
