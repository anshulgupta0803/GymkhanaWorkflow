/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import control.DbConnect;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author rusty
 */
public class Club {
    private String Club_Name;
    private String Club_Council;
    private String Club_Coordinator;
    private String Club_Faculty_Mentor;
    private Double Club_Budget_Allocated;
    private Double Club_Budget_Utilized;
    private Integer Club_Events;
    private Boolean Club_Status;
    private String Club_Description;
    private String Club_Created_By;
    private Integer Club_ID;
    private Timestamp Club_Date_Creation;
    private Timestamp Club_Date_Activation;
    private Timestamp Club_Date_Valid_Upto;
    private static final String Club_Approval_Sequence[] = {"Finance Committee","President","Dean SA","Finance Department"};
    private Boolean Club_Current_Approval_Status[] = {false,false,false,false};
    private int Club_Last_Approved_By = -1;
    
    public Club()
    {
    }
    
    public Club(String club_id)
    {   
    }
    
    public Boolean create_club(String club_name, String club_coordinator,String club_council,String club_faculty_mentor,Double budget_allocated,String club_description,String club_created_by, Timestamp club_date_activation, Timestamp club_valid_upto)
    {
        java.util.Date date= new java.util.Date();
        
        DbConnect db = new DbConnect();
        
        String Values = "\"" + club_name + "\"" + "," + "\"" + club_coordinator + "\"" + "," + "\"" + club_council + "\"" + "," + "\"" + club_faculty_mentor + "\"" + "," + budget_allocated + "," + new Double(0.0) + "," + "\"" + club_description + "\"" + "," + "0" + "," + "0" + "," + "\"" + club_created_by + "\"" + "," + "\"" + club_date_activation +  "\"" + "," +  "\"" + club_valid_upto +  "\"" + "," +  "\"" + new Timestamp(date.getTime()) +  "\"" + "," + "0" + "," + "1";
        String SQL = "INSERT INTO `gymkhanaWorkflow`.`club` (`club_name`, `club_coordinator`, `club_council`, `club_faculty_mentor`, `club_budget_allocated`, `club_budget_utilized`, `club_details`, `club_events`, `club_status`, `club_created_by`, `club_date_activation`,`club_valid_upto`,`club_creation`, club_last_approved_by, club_current_approval_status) VALUES ("+Values+")";
        try
        {
                   
            db.pstmt = db.conn.prepareStatement(SQL);
                    
            try
            {
                db.pstmt.executeUpdate();
                //System.out.println("... and we're back agian");
                Club_Last_Approved_By = 0;
                Club_Current_Approval_Status[0] = true;
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
    
    public Boolean modify_club (Integer club_id, String club_name, String club_coordinator,String club_council,String club_faculty_mentor,String club_description, Timestamp club_date_activation, Timestamp club_valid_upto, Double budget_allocated)
    {
        DbConnect db = new DbConnect();
        
        
        String SQL = "UPDATE `gymkhanaWorkflow`.`club` SET `club_name` = '"+club_name+"', `club_coordinator` = '" + club_coordinator + "', `club_council` = '" + club_council + "', `club_faculty_mentor` = '"+club_faculty_mentor+"', `club_details` = '"+club_description+"', `club_date_activation` = '"+club_date_activation+"',`club_valid_upto` = '"+club_valid_upto+ "', `club_budget_allocated` = " + budget_allocated + " WHERE `club`.`club_id` = "+club_id+" AND `club_last_approved_by` = 0";
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
    
    public Boolean delete_club (Integer club_id)
    {
        DbConnect db = new DbConnect();
        
        
        String SQL = "DELETE FROM `club` WHERE club_id = "+ club_id;
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
            //db.pstmt.setInt(1, club_id);
            
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
    
    public Boolean approve_club (Integer club_id,Integer status, Integer last_approved_by)
    {    
        DbConnect db = new DbConnect();
        
        last_approved_by++;
        
        String SQL = "UPDATE `gymkhanaWorkflow`.`club` SET `club_last_approved_by` = " + last_approved_by+", club_current_approval_status = "+status +" WHERE `club`.`club_id` = "+club_id+";";
        
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
    
    public void increment_no_of_events (Integer club_id)
    {
        DbConnect db = new DbConnect();
        
        
        String SQL = "SELECT club_events FROM `club` WHERE club_id = ? ";
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
            db.pstmt.setInt(1, club_id);
            
            try
            {
                db.rs = db.pstmt.executeQuery();
             
                while(db.rs.next())
                {
                    Club_Events = db.rs.getInt(1) + 1;
                    
                    SQL = "UPDATE `gymkhanaWorkflow`.`club` SET `club_events` = ? WHERE `club`.`club_id` = ? ";
                    
                    try
                    {
                         db.pstmt = db.conn.prepareStatement(SQL);
                         db.pstmt.setInt(1, Club_Events);
                         db.pstmt.setInt(2, club_id);

                         try
                         {
                             db.pstmt.executeUpdate();
                         }
                         catch (SQLException e)
                         {
                             System.out.println(e);
                         }
                    }
                    catch(SQLException e)
                    {

                    }
                }
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
    }
    
    public void decrement_no_of_events (Integer club_id)
    {
        DbConnect db = new DbConnect();
        
        
        String SQL = "SELECT club_events FROM `club` WHERE club_id = ? ";
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
            db.pstmt.setInt(1, club_id);
            
            try
            {
                db.rs = db.pstmt.executeQuery();
             
                while(db.rs.next())
                {
                    Club_Events = db.rs.getInt(1) - 1;
                    
                    SQL = "UPDATE `gymkhanaWorkflow`.`club` SET `club_events` = ? WHERE `club`.`club_id` = ? ";
                    
                    try
                    {
                         db.pstmt = db.conn.prepareStatement(SQL);
                         db.pstmt.setInt(1, Club_Events);
                         db.pstmt.setInt(2, club_id);

                         try
                         {
                             db.pstmt.executeUpdate();
                         }
                         catch (SQLException e)
                         {
                             System.out.println(e);
                         }
                    }
                    catch(SQLException e)
                    {

                    }
                }
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
    }
    
    public void modify_budget_utilized (Integer club_id,Double amount)
    {
        DbConnect db = new DbConnect();
        
        
        String SQL = "SELECT club_budget_allocated, club_budget_utilized FROM `club` WHERE club_id = " + club_id;
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
            
            try
            {
                db.rs = db.pstmt.executeQuery();
             
                while(db.rs.next())
                {
                    Club_Budget_Allocated = (double)db.rs.getDouble(1);
                    Club_Budget_Utilized = (double)db.rs.getDouble(2);
              
               
                    if(((Club_Budget_Utilized + amount) <= Club_Budget_Allocated) && ((Club_Budget_Utilized + amount) >= 0))
                    {
                       Club_Budget_Utilized += amount;
                       SQL = "UPDATE `gymkhanaWorkflow`.`club` SET `club_budget_utilized` = " + Club_Budget_Utilized +" WHERE `club`.`club_id` =" + club_id;

                       try
                       {
                            db.pstmt = db.conn.prepareStatement(SQL);

                            try
                            {
                                db.pstmt.executeUpdate();
                            }
                            catch (SQLException e)
                            {
                                System.out.println(e);
                            }
                       }
                       catch(SQLException e)
                       {

                       }
                    }
                }
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
    }
    
    public Double budget_available (Integer club_id)
    {
        DbConnect db = new DbConnect();
        
        
        String SQL = "SELECT club_budget_allocated, club_budget_utilized FROM `club` WHERE club_id =  " + club_id;
        
        try
        {
            db.pstmt = db.conn.prepareStatement(SQL);
            try
            {
                db.rs = db.pstmt.executeQuery();
             
                while(db.rs.next())
                {
                    Club_Budget_Allocated = (double)db.rs.getFloat(1);
                    Club_Budget_Utilized = (double)db.rs.getFloat(2);
                }
            }
            catch(SQLException e)
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
                return (Club_Budget_Allocated - Club_Budget_Utilized);
            }
            catch (SQLException e)
            {
                
            }
        }
        return 0.0;
    }
    
    public int get_club_status(String club_id)
    {
        if(Club_Status == true)
            return 1;                                                           //Approved
        else if(Club_Status == false)
        {
            if(Club_Current_Approval_Status[Club_Last_Approved_By] == false)
                return 0;                                                       //Rejected
            else if(Club_Current_Approval_Status[Club_Last_Approved_By] == true)
                return 2;                                                       //Pending
        }
        return -1;                                                              //Undefined Error
    }
}