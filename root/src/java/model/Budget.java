/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import control.DbConnect;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;




/**
 *
 * @author XPS
 */
public class Budget 
{
    private Integer budget_id;
    private Double budget_demanded;
    private Integer budget_event_id;
    private Integer budget_club_id;
    private String budget_created_by;
    private Timestamp budget_creation;
    private String budget_details;
    private Date budget_date_of_creation;
    private Boolean budget_status;
   
    private static final String budget_Approval_Sequence[] = {"budget_created_by","Gsec","Finance Committee","Dean SA","Finance Department"};
    private Boolean budget_Current_Approval_Status[] = {false,false,false,false,false};
    private int budget_Last_Approved_By = -1;
    
  
    
    public Boolean create_budget(Double budget_demanded,Integer budget_event_id,String budget_details, String budget_created_by)
    {
        java.util.Date date= new java.util.Date();
        DbConnect db = new DbConnect();
        Event Obj_Event = new Event();
        Club Obj_Club = new Club();
        Integer club_id = (Obj_Event.get_event_club_id (budget_event_id));
        Double budget_available = Obj_Club.budget_available(club_id);
		
        if(budget_available < budget_demanded)
            return false;

	Obj_Club.modify_budget_utilized (club_id,budget_demanded);	
        String Values = budget_demanded + "," + budget_event_id + "," + "\"" + budget_details + "\"" + ","+ "\"" + budget_created_by + "\", 0, 1";
        
        /*String SQL = "INSERT INTO `gymkhanaWorkflow`.`budget` (`budget_demanded`, `budget_event_id`, `budget_details`, `budget_status`, `budget_last_approved_by`, `budget_current_approval_status`, `budget_created_by`, `budget_creation`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";*/
        String SQL = "INSERT INTO `budget` (`budget_demanded`, `budget_event_id`, `budget_details`,`budget_created_by`, `budget_last_approved_by`, `budget_current_approval_status`) VALUES ("+Values+")";
        
        
        try
        {
        db.pstmt = db.conn.prepareStatement(SQL);
        try
        {
            if(db.pstmt.executeUpdate() != 0)
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
    public Boolean delete_budget (Integer budget_id)
    {
        DbConnect db = new DbConnect();
        PreparedStatement query,query1;
        ResultSet rs,rs1;
		
        String event_id = "SELECT `budget_event_id`, `budget_demanded` FROM `budget` WHERE `budget_id` = "+budget_id;
        //String budget_demanded1 = "SELECT `budget_demanded` FROM `budget` WHERE `budget_id` = "+budget_id;
        String SQL = "DELETE FROM `budget` WHERE budget_id = "+budget_id;
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
            query=db.conn.prepareStatement(event_id);
            //query1=db.conn.prepareStatement(budget_demanded1);
            
            try
            {
                rs= query.executeQuery();
                Integer event_id1 = null;
                Double amount_demanded = null;
                Integer C_id = null;
                if (rs.next ())
                {
                    event_id1 = rs.getInt("budget_event_id");
                    amount_demanded = rs.getDouble("budget_demanded");
                }
                Event Obj_E = new Event();
                Club Obj_C = new Club();
                if (event_id1 != null)
                    C_id = Obj_E.get_event_club_id (event_id1);
                if (amount_demanded != null)
                    Obj_C.modify_budget_utilized (C_id,-amount_demanded);
                db.pstmt.executeUpdate();
                return true;
            }
            catch (SQLException e)
            {
            return false;
            }
        }
        catch(Exception e)
        {
            return false;
        }
        finally
        {
            try
            {
                db.conn.close();
            }
            catch (Exception e)
            {
              return false;  
            }
        }
    }
    
  
    public Boolean approve_budget (Integer budget_id,Integer status, Integer last_approved_by)
    {
       DbConnect db = new DbConnect();
        
        last_approved_by++;
        
        String SQL = "UPDATE `budget` SET `budget_last_approved_by` = " + last_approved_by+", budget_current_approval_status = "+status +" WHERE `budget_id` = "+budget_id+";";
        
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
    
    
    public int get_budget_status(Integer budget_id)
    {
        if(budget_status == true)
            return 1;                                                           //Approved
        else if(budget_status == false)
        {
            if(budget_Current_Approval_Status[budget_Last_Approved_By] == false)
                return 0;                                                       //Rejected
            else if(budget_Current_Approval_Status[budget_Last_Approved_By] == true)
                return 2;                                                       //Pending
        }
        return -1;                                                              //Undefined Error
    }
    
    public Boolean modify_budget(Integer budget_id,Double budget_demanded,Integer budget_event_id,String budget_details, String budget_created_by)
    {
        DbConnect db = new DbConnect();
        Event Obj_Event = new Event();
        Club Obj_Club = new Club();
        Integer club_id = (Obj_Event.get_event_club_id (budget_event_id));
        Double old_budget_available = null;
        try
        {
            db.pstmt = db.conn.prepareStatement("SELECT `budget_demanded` FROM `budget` WHERE `budget_id` = " + budget_id + " AND `budget_last_approved_by` = 0");
            db.rs = db.pstmt.executeQuery();
            if (db.rs.next())
            {
                old_budget_available = db.rs.getDouble("budget_demanded");
                Obj_Club.modify_budget_utilized (club_id, -old_budget_available);
            }
            else
                return false;
        } catch (SQLException ex) {}
        
        Double budget_available = Obj_Club.budget_available(club_id);
		
        if(budget_available < budget_demanded)
            return false;

	Obj_Club.modify_budget_utilized (club_id,budget_demanded);
        String SQL = "UPDATE `budget` SET `budget_demanded` = " +budget_demanded+" , `budget_event_id`= " +budget_event_id+", `budget_details`= '" +budget_details+"',`budget_created_by`= '" +budget_created_by+"' WHERE `budget_id` = "+budget_id+" AND `budget_last_approved_by` = 0";
 
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
                return false;
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
}