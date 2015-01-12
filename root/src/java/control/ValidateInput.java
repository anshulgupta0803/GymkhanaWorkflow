/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.text.*;
import java.util.Date;
/**
 *
 * @author UTKARSH
 */
public class ValidateInput {
    
    public Boolean isalpha(String parameter)
    {
        return parameter.matches("[A-Za-z ]+");
    }
    
    public Boolean isalphanum(String parameter)
    {
        return parameter.matches("[A-Za-z0-9 ]+");
    }
    
    public Boolean isnum(String parameter)
    {
        return parameter.matches("[0-9.]+");
    }
    
    public Boolean istimestamp(String parameter)
    {
        final String DATE_FORMAT = "MM/dd/yyyy HH:mm";

        try 
        {
            DateFormat format = new SimpleDateFormat(DATE_FORMAT);
            format.setLenient(false);
            format.parse(parameter);
            return true;
        } catch (ParseException e)
        {
            return false;
        }
        
    }
    
    public Date convert12to24(String parameter) 
    {
       try
       {
            SimpleDateFormat parseFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss");
            Date date = parseFormat.parse(parameter);
            return date;
       }catch (ParseException e)
       {
            return new Date(parameter);
       }
   }
}
