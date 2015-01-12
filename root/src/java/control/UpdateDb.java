/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.sql.Timestamp;
import model.*;
/**
 *
 * @author UTKARSH
 */
public class UpdateDb {
    
    public Boolean status_update_delete(Integer id,Integer type,String name)
    {
        DbConnect db = new DbConnect ();
        if ((type == 1) && (name.equals("club")))
        {
            Club Obj = new Club();
            try
            {
                return(Obj.delete_club(id));
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        else if ((type == 0) && ( name.equals("event")))
        {
            Event Obj = new Event();
            Venue Obj_venue = new Venue ();
            Budget Obj_budget = new Budget ();
            try
            {
                String SQL = "SELECT venue_id FROM venue JOIN event ON event.event_id = venue.venue_event_id WHERE event_id = " + id;
                db.pstmt = db.conn.prepareStatement(SQL);
                db.rs = db.pstmt.executeQuery();
                while (db.rs.next())
                {
                    Integer venue_id = db.rs.getInt("venue_id");
                    Obj_venue.delete_venue (venue_id);
                }
                SQL = "SELECT budget_id FROM budget JOIN event ON event.event_id = budget.budget_event_id WHERE event_id = " + id;
                db.pstmt = db.conn.prepareStatement(SQL);
                db.rs = db.pstmt.executeQuery();
                while (db.rs.next())
                {
                    Integer budget_id = db.rs.getInt("budget_id");
                    Obj_budget.delete_budget(budget_id);
                }
                return(Obj.delete_event(id));
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        else if ((type == 0) && ( name.equals("budget")))
        {
                Budget Obj = new Budget();
                try
                {
                        return(Obj.delete_budget(id));
                }
                catch(Exception ex)
                {
                    return false;
                }
        }
        else if (( type == 0) && (name.equals("venue")))
        {
            Venue Obj = new Venue();
            try
            {
                return(Obj.delete_venue(id));
            }

            catch(Exception ex)
            {
                return false;
            }
        }
        return false;
    }
         
    public Boolean new_update_club(String Club_Name, String Coordinator, String Faculty_Mentor, String Council, Timestamp Club_Date_Activation, Timestamp Club_Valid_Upto, Double Club_Budget_Allocated, String Club_Description, String Club_Created_By)
    {  
        Club Obj = new Club();
        try
        {
            Obj.create_club(Club_Name, Coordinator, Council, Faculty_Mentor, Club_Budget_Allocated, Club_Description, Club_Created_By, Club_Date_Activation, Club_Valid_Upto);
            return true;
          
        }catch(Exception ex)
        {
            return false;
        }
    }
    
    public Boolean new_update_event(String event_name, Integer event_club_id, Timestamp event_start, Timestamp event_end, String event_details, String event_organizer, String event_created_by)
    {  
        Event Obj = new Event();
        try
        {
            return Obj.create_event(event_name, event_club_id, event_start, event_end, event_details, event_organizer, event_created_by);
            
        }catch(Exception ex)
        {
            return false;
        }
    }
    
    
    public Boolean new_update_venue(String venue_name, Integer venue_event_id, Timestamp venue_entry, Timestamp venue_exit, String venue_created_by)
    {  
        /*Venue Obj = new Venue();
        try
        {
        return Obj.create_venue(venue_name, venue_event_id, venue_entry, venue_exit, venue_created_by);
        
        }catch(Exception ex)
        {
        return false;
        }*/
        Venue Obj = new Venue();
	Event Obj1 = new Event(venue_event_id);
        Timestamp event_start = Obj1.event_start_ref();
        Timestamp event_end = Obj1.event_end_ref();        
	
            if((event_start.compareTo(venue_entry))<=0 && (event_end.compareTo(venue_exit)>=0))
            {
		try
               	{
                    return Obj.create_venue(venue_name, venue_event_id, venue_entry, venue_exit, venue_created_by);
				  
		}
                catch(Exception ex)
		{
                    return false;
		}
            }
            return false;
    }
    
    public Boolean new_update_budget(Double budget_demanded,Integer budget_event_id,String budget_details, String budget_created_by)
    {
        Budget obj = new Budget();
        try
        {
            return obj.create_budget(budget_demanded,budget_event_id,budget_details,budget_created_by);
        }
        
        catch(NullPointerException e)
        {
            return false;
        }
    }
    
    public Boolean status_update_club(Integer id, Integer status, Integer last_approved_by)
    {  
        Club Obj = new Club();
        try
        {
            return(Obj.approve_club(id, status, last_approved_by));
                     
        }catch(Exception ex)
        {
            return false;
        }
    }
    
    public Boolean status_update_event(Integer id, Integer status, Integer last_approved_by)
    {  
        Event Obj = new Event();
        try
        {
            return(Obj.approve_event(id, status, last_approved_by));
                     
        }catch(Exception ex)
        {
            return false;
        }
    }
    
    public Boolean status_update_budget(Integer id, Integer status, Integer last_approved_by)
    {  
        Budget Obj = new Budget();
        try
        {
            return(Obj.approve_budget(id, status, last_approved_by));
                     
        }catch(Exception ex)
        {
            return false;
        }
    }
    
    public Boolean status_update_venue(Integer id, Integer status, Integer last_approved_by)
    {
        Venue Obj = new Venue();
        try
        {
            return(Obj.approve_venue(id, status, last_approved_by));
                     
        }catch(Exception ex)
        {
            return false;
        }
    }
    public Boolean new_modify_club(Integer Club_ID, String Club_Name, String Coordinator, String Faculty_Mentor, String Council, Timestamp Club_Date_Activation, Timestamp Club_Valid_Upto, Double Club_Budget_Allocated, String Club_Description, String Club_Created_By)
    {  
        Club Obj = new Club();
        try
        {
            return Obj.modify_club (Club_ID, Club_Name, Coordinator, Council, Faculty_Mentor, Club_Description, Club_Date_Activation, Club_Valid_Upto, Club_Budget_Allocated);
        }
        catch(NullPointerException ex)
        {
            return false;
        }
    }
    
    public Boolean new_modify_event(Integer event_id, String event_name, Integer event_club_id, Timestamp event_start, Timestamp event_end, String event_details, String event_organizer, String event_created_by)
    {  
        Event Obj = new Event();
        try
        {
            return Obj.modify_event(event_id, event_name, event_club_id, event_start, event_end, event_details, event_organizer, event_created_by);
            
        }catch(Exception ex)
        {
            return false;
        }
    }
    
    public Boolean new_modify_venue(Integer venue_id, String venue_name, Integer venue_event_id, Timestamp venue_entry, Timestamp venue_exit, String venue_created_by)
    {  
        Venue Obj = new Venue();
        try
        {
            return Obj.modify_venue(venue_id, venue_name, venue_event_id, venue_entry, venue_exit, venue_created_by);
          
        }catch(Exception ex)
        {
            return false;
        }
    }
    
    public Boolean new_modify_budget(Integer budget_id, Double budget_demanded,Integer budget_event_id,String budget_details, String budget_created_by,Timestamp budget_creation)
    {
        Budget Obj = new Budget();
        try
        {
            return Obj.modify_budget(budget_id, budget_demanded, budget_event_id, budget_details, budget_created_by);
        }
        
        catch(Exception e)
        {
            return false;
        }
    }
}
