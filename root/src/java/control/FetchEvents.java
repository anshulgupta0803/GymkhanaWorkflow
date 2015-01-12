/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.sql.SQLException;

/**
 *
 * @author Anshul Gupta
 */
public class FetchEvents {
    
    //public static void  FetchEvents1 ()
    public FetchEvents ()
    {
        DbConnect db = new DbConnect ();
        String SQL = "SELECT `event_id`, `event_name`, `event_start`, `event_end` FROM `event`";
        String eventsFile = "/home/rusty/Documents/LNMIITGymkhanaWorkflowManagement/build/web/assets/public/events.json";
        Writer pw = null;
        String event;
        try
        {
            db.pstmt = db.conn.prepareStatement (SQL);
            try
            {
                db.rs = db.pstmt.executeQuery();
                
                File strFile = new File(eventsFile);
                if (!strFile.exists())
                    strFile.createNewFile();
                
                pw = new BufferedWriter(new FileWriter(strFile));
                pw.write("[\n");
                pw.flush();
                
                while (db.rs.next())
                {
                    event = "\t{\n\t\t\"id\": " + db.rs.getInt("event_id") + ",\n\t\t\"title\": \"" + db.rs.getString("event_name") + "\",\n\t\t\"start\": \"" + db.rs.getDate("event_start") + "\",\n\t\t\"end\": \"" + db.rs.getDate("event_end") + "\"\n\t},\n";
                    pw.write(event);
                    pw.flush();
                }
                
                pw.write("\t{\n\t\t\n\t}\n]\n");
                pw.flush();
            }
            catch (SQLException | IOException | NullPointerException e){}
            finally
            {
                if (pw != null)
                    try
                    {
                        pw.close();
                    }
                    catch (IOException ex) {}
            }
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
    }
    /*public static void main (String args[])
    {
    FetchEvents1();
    }*/
}
