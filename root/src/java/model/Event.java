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
 * @author Anshul Gupta
 */

public class Event {
    private Integer event_id;
    private String event_name;
    private Integer event_club_id;
    private Timestamp event_start;
    private Timestamp event_end;
    private String event_details;
    private String event_organizer;
    private Boolean event_approval_flag_gsec;
    private Boolean event_approval_flag_deanSA;
    private String event_created_by;
    private Timestamp event_created;

    public Event()
    {
        
    }
    
    public Event(Integer event_id)
    {
        DbConnect db = new DbConnect ();
        try
        {
             String SQL = "SELECT * FROM event WHERE event_id = " + event_id;
             db.pstmt = db.conn.prepareStatement(SQL);
             try
             {
             db.rs = db.pstmt.executeQuery();
             if(db.rs.next())
             {
                 this.event_id = db.rs.getInt(1);
                 this.event_name = db.rs.getString(2);
                 this.event_club_id = db.rs.getInt(3);
                 this.event_start = db.rs.getTimestamp(4);
                 this.event_end = db.rs.getTimestamp(5);
                 this.event_details = db.rs.getString(6);
                 this.event_organizer = db.rs.getString(7);
                 this.event_created_by = db.rs.getString(8);
                 this.event_created = db.rs.getTimestamp(9);
             }
             }
             catch (SQLException e)
             {
            
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
    
    }
    
    public Timestamp event_start_ref()
    {
        return(this.event_start);
    }
    
    public Timestamp event_end_ref()
    {
        return(this.event_end);
    }
    
    public Boolean create_event(String event_name_param, Integer event_club_id_param, Timestamp event_start_param, Timestamp event_end_param, String event_details_param, String event_organizer_param, String event_created_by_param)
    {
        DbConnect db = new DbConnect ();
        try
        {
             String SQL = "INSERT INTO `gymkhanaWorkflow`.`event` (`event_name`, `event_club_id`, `event_start`, `event_end`, `event_details`, `event_organizer`, `event_created_by`) VALUES (\"" + event_name_param + "\", " + event_club_id_param + ", '" + event_start_param + "', '" + event_end_param + "', '" + event_details_param + "', '" + event_organizer_param + "', '" + event_created_by_param + "')";
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
    
    public Boolean modify_event (Integer event_id_param, String event_name_param, Integer event_club_id_param, Timestamp event_start_param, Timestamp event_end_param, String event_details_param, String event_organizer_param, String event_created_by_param)
    {
        DbConnect db = new DbConnect ();
        
        
        try
        {
            String SQL = "UPDATE `gymkhanaWorkflow`.`event` SET `event_name` = '" + event_name_param + "', `event_club_id` = " + event_club_id_param + ", `event_start` = '" + event_start_param + "', `event_end` = '" + event_end_param + "', `event_details` = '" + event_details_param + "', `event_organizer` = '" + event_organizer_param + "', `event_created_by` = '" + event_created_by_param + "' WHERE `event`.`event_id` = " + event_id_param;
            db.pstmt = db.conn.prepareStatement(SQL);
            try
            {
            if (db.pstmt.executeUpdate() != 0)
            return true;
            }
            catch (SQLException e)
            {
            
            }
        }
        catch (SQLException e)
        {
            
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (SQLException ex)
            {

            }
        }
        return false;
    }
    
    public Boolean delete_event (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        try
        {
            String SQL = "DELETE FROM `event` WHERE event_id = " + event_id_param;
            db.pstmt = db.conn.prepareStatement(SQL);


            try
            {
                if (db.pstmt.executeUpdate() != 0)
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
        return false;
    }
    
    public Boolean approve_event (Integer event_id_param, Integer flag_value_param, Integer user_param)
    {
       
        DbConnect db = new DbConnect ();
        PreparedStatement query;
        try
        {
            String SQL = null;
            if (user_param == -1)
                SQL = "UPDATE `event` SET `event_approval_flag_gsec` = "+ flag_value_param +", `event_last_approved_by` = "+ "0" +" WHERE `event_id` = "+ event_id_param + ";";
            else if (user_param == 0)
                SQL = "UPDATE `event` SET `event_approval_flag_deanSA` = "+ flag_value_param +", `event_last_approved_by` = "+ "1" +" WHERE `event_id` = "+ event_id_param + ";";
              
           
            if(SQL != null)
                query = db.conn.prepareStatement(SQL);
            else return false;

            try
            {
                query.executeUpdate();
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
    
    public String get_event_name (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_name` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            //db.pstmt.setInt(1, event_id_param);

            try
            {
                db.rs = db.pstmt.executeQuery();
                event_name = db.rs.getString("event_name");
                return event_name;
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_name;
    }
    
    public Integer get_event_club_id (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_club_id` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            try
            {
                rs = db.pstmt.executeQuery();
                if(rs.next())
                    event_club_id = rs.getInt("event_club_id");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_club_id;
    }
    
    public Timestamp get_event_start (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_start` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            try
            {
                rs = db.pstmt.executeQuery();
                event_start = rs.getTimestamp("event_start");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_start;
    }
    
    public Timestamp get_event_end (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_end` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            try
            {
                rs = db.pstmt.executeQuery();
                event_start = rs.getTimestamp("event_end");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_end;
    }
    
    public String get_event_details (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_details` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            try
            {
                rs = db.pstmt.executeQuery();
                event_details = rs.getString("event_details");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_details;
    }
    
    public String get_event_organizer (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_organizer` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            db.pstmt.setInt(1, event_id_param);

            try
            {
                rs = db.pstmt.executeQuery();
                event_organizer = rs.getString("event_organizer");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_organizer;
    }
    
    public Boolean get_event_approval_flag_deanSA (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_approval_flag_deanSA` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            db.pstmt.setInt(1, event_id_param);

            try
            {
                rs = db.pstmt.executeQuery();
                event_approval_flag_deanSA = rs.getBoolean("event_approval_flag_deanSA");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_approval_flag_deanSA;
    }
    
    public Boolean get_event_approval_flag_gsec (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_approval_flag_gsec` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            db.pstmt.setInt(1, event_id_param);

            try
            {
                rs = db.pstmt.executeQuery();
                event_approval_flag_gsec = rs.getBoolean("event_approval_flag_gsec");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_approval_flag_gsec;
    }
    
    public String get_event_created_by (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_created_by` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            db.pstmt.setInt(1, event_id_param);

            try
            {
                rs = db.pstmt.executeQuery();
                event_created_by = rs.getString("event_created_by");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_created_by;
    }
    
    public Timestamp get_event_created (Integer event_id_param)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_created` FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            db.pstmt.setInt(1, event_id_param);

            try
            {
                rs = db.pstmt.executeQuery();
                event_created = rs.getTimestamp("event_created");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_created;
    }
    
    public ResultSet view_event (Integer event_id_param)
    {
        DbConnect db = new DbConnect ();
        try
        {
            String SQL = "SELECT * FROM `event` WHERE event_id = " + event_id_param;
                
            db.pstmt = db.conn.prepareStatement(SQL);

            try
            {
                db.rs = db.pstmt.executeQuery();
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return db.rs;
    }
    
    public Integer get_event_id (String regex)
    {
        
        DbConnect db = new DbConnect ();
        
        ResultSet rs;
        try
        {
            String SQL = "SELECT `event_id` FROM `event` WHERE event_name LIKE %" + regex + "%";
                
            db.pstmt = db.conn.prepareStatement(SQL);

            db.pstmt.setString(1, regex);

            try
            {
                rs = db.pstmt.executeQuery();
                event_id = rs.getInt("event_id");
            }
            catch (SQLException e)
            {

            }
            finally
            {
                
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
        return event_id;
    }
}