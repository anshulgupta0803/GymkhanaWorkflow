<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="control.ValidateInput"%>
<%@page import="control.UpdateDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>create</title>
    </head>
    <body>
        <%
            Integer type = (Integer)session.getAttribute("type");
            String object = request.getParameter("object");
            if(type == 4)
            {
                if((object != null) && (object.equals("club")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int club_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        if(Obj.status_update_club(club_id,status,0))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the club.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the club.\");window.location.assign(\"index.jsp\");</script>");
                }
                else out.print("<script>alert(\"Unable to validate the club.\");window.location.assign(\"index.jsp\");</script>");
            }
            else if(type == 3)
            {
                if((object != null) && (object.equals("event")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int event_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_event(event_id,status,0))
                        {
                            out.print("<script>alert(\"Changes Successfully done.\");window.location.assign(\"index.jsp\");</script>");
                            //response.sendRedirect("home.jsp");
                        }
                        else out.print("<script>alert(\"Unable to validate the event.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the event.\");window.location.assign(\"index.jsp\");</script>");
                }
                else if((object != null) && (object.equals("budget")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int event_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_budget(event_id,status,0))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                            //response.sendRedirect("home.jsp");
                        }
                        else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
                }
            }
            else if(type == 2)
            {
                if((object != null) && (object.equals("club")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int event_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_club(event_id,status,2))
                        {
                            out.print("<script>alert(\"Changes Successfully done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the club.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the club.\");window.location.assign(\"index.jsp\");</script>");
                }
                else if((object != null) && (object.equals("budget")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int event_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_budget(event_id,status,3))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
                }
            }
            else if(type == 5)
            {
                if((object != null) && (object.equals("club")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int club_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        if(Obj.status_update_club(club_id,status,1))
                        {
                            out.print("<script>alert(\"Changes Successfully done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the club.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the club.\");window.location.assign(\"index.jsp\");</script>");
                }
                else if((object != null) && (object.equals("event")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int event_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_event(event_id,status,0))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the event.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the event.\");window.location.assign(\"index.jsp\");</script>");
                }
                else if((object != null) && (object.equals("budget")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int event_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_budget(event_id,status,2))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
                    }
                }
                else if((object != null) && (object.equals("venue")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int venue_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_venue(venue_id,status,0))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
                }
            }
            else if(type == 6)
            {
                if((object != null) && (object.equals("venue")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int venue_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_venue(venue_id,status,2))
                        {
                            out.print("<script>alert(\"Changes Successfully Done\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
                }
                else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
            }
            else if(type == 7)
            {
                if((object != null) && (object.equals("venue")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int venue_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_venue(venue_id,status,1))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
                }
                else out.print("<script>alert(\"Unable to validate the venue.\");window.location.assign(\"index.jsp\");</script>");
            }
            else if (type == 1)
            {
                if((object != null) && (object.equals("budget")))
                {
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null))  
                    {
                        int event_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        
                        if(Obj.status_update_budget(event_id,status,1))
                        {
                            out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
                }
                else out.print("<script>alert(\"Unable to validate the budget.\");window.location.assign(\"index.jsp\");</script>");
            }
        %>
    </body>
</html>