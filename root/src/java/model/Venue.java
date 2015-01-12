/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import control.DbConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;


/**
 *
 * @author Jitesh Goel
 */
public class Venue 
{
  private Integer venue_id;
  private String venue_name;
  private Integer venue_event_id;
  private Timestamp venue_entry;
  private Timestamp venue_exit;
  private String venue_created_by;
  private Timestamp venue_creation;
  private Boolean venue_status;
  private static final String venue_approval_sequence[] = {"Club Coordinator","Dean SA","Chief Warden","Estate Manager"};
  private Boolean venue_last_approval_status[] = {false,false,false,false};
  private int venue_last_approved_by = -1;
  
    public Boolean create_venue(String venue_name_param, Integer venue_event_id_param, Timestamp venue_entry_param, Timestamp venue_exit_param, String venue_created_by_param)
    {
        java.util.Date date= new java.util.Date();
        
        DbConnect db = new DbConnect();
        
        String Values = "\"" + venue_name_param + "\" ," + venue_event_id_param + "," + "\"" + venue_entry_param + "\"" + "," + "\"" + venue_exit_param + "\"" + "," + "\"" + venue_created_by_param + "\", 0, 1";
        String SQL =  "INSERT INTO `gymkhanaWorkflow`.`venue` (`venue_name`, `venue_event_id`, `venue_entry`, `venue_exit`, `venue_created_by`, `venue_last_approved_by`, `venue_last_approved_status`) VALUES ("+Values+")";
        try
        {
                   
            db.pstmt = db.conn.prepareStatement(SQL);
			
			
 
             try
            {
                db.pstmt.executeUpdate();
                return true;
            }
            catch (SQLException e)
            {
               return false;
            }
        }
        catch(SQLException e)
        {
            return false;
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException e)
            {
              return false;  
            }
        }
	}
	
	public Boolean modify_venue(Integer venue_id_param, String venue_name_param, Integer venue_event_id_param, Timestamp venue_entry_param, Timestamp venue_exit_param, String venue_created_by_param)
    {
        DbConnect db = new DbConnect();
        
        String SQL = "UPDATE `gymkhanaWorkflow`.`venue` SET `venue_name` = '" + venue_name_param + "', `venue_event_id` = " + venue_event_id_param + ", `venue_entry` = '" + venue_entry_param + "', `venue_exit` = '" + venue_exit_param + "', `venue_created_by` = '" + venue_created_by_param +"' WHERE `venue`.`venue_id` = " + venue_id_param;
        try
        {
                   
            db.pstmt = db.conn.prepareStatement(SQL);
            
            try
            {
                if (db.pstmt.executeUpdate() != 0)
                    return true;
            }
            catch (SQLException e)
            {
                System.out.println(e);
            }
        }
        catch(SQLException e)
        {
            
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException e)
            {
                
            }
        }
        return false;
    }
        
  public Boolean delete_venue (Integer venue_id_param)
    {
        DbConnect db = new DbConnect();
        
        
        String SQL = "DELETE FROM `venue` WHERE venue_id = " + venue_id_param;
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
            
            try
            {
                db.pstmt.executeUpdate();
                return true;
            }
            catch (SQLException e)
            {
                return false;
            }
        }
        catch(SQLException e)
        {
            return false;
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException e)
            {
                
            }
        }
    }
   
  public Boolean approve_venue (Integer venue_id,Integer status, Integer last_approved_by)
    {    
        DbConnect db = new DbConnect();
        
        last_approved_by++;
        
        String SQL = "UPDATE `gymkhanaWorkflow`.`venue` SET `venue_last_approved_by` = " + last_approved_by+", venue_last_approved_status = "+status +" WHERE `venue`.`venue_id` = "+venue_id+";";
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
                      
            try
            {
                db.pstmt.executeUpdate();
                return true;
            }
            catch (SQLException e)
            {
                System.out.println(e);
            }
        }
        catch(SQLException e)
        {
            return false;
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException e)
            {
                return false;
            }
        }
        return false;
    }
	
	public void fetch_venue (Integer venue_event_id_param)
	{
		int venue_id_fetch;
		DbConnect db = new DbConnect ();
                PreparedStatement query;
        ResultSet rs;
        try
        {
            String SQL = "SELECT `venue_id` FROM `venue` WHERE venue_event_id = " +venue_event_id_param;
                
            query = db.conn.prepareStatement(SQL);

            query.setInt(3, venue_event_id_param);

            try
            {
                rs = query.executeQuery();
                venue_id_fetch = rs.getInt("venue_event_id");
            }
            catch (SQLException e){}
        }
        catch(SQLException e)
        {
            
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException e)
            {
                
            }
        }
        }
}