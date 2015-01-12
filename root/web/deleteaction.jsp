<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="control.ValidateInput"%>
<%@page import="control.UpdateDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            Integer type = (Integer)session.getAttribute("type");
            String object = request.getParameter("object");
            if((type != null) && (type == 1))
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
                        if(status==1)
                        {
                                if(Obj.status_update_delete(club_id,type,"club"))
                                {
                                    out.print("<script>alert(\"Changes successfully done.!!\");window.location.assign(\"index.jsp\");</script>");
                                    //response.sendRedirect("home.jsp");
                                }
                                else out.print("<script>alert(\"Unable to delete the club.\");window.location.assign(\"index.jsp\");</script>");
                        }	
                        else out.print("<script>alert(\"Unable to delete the club.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to delete the club.\");window.location.assign(\"index.jsp\");</script>");
                }
                else out.print("<script>alert(\"Unable to delete the club.\");window.location.assign(\"index.jsp\");</script>");
            }			
            else if((type != null) && (type==0))
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
                        if ( status == 1)
                        {       		
                            if(Obj.status_update_delete(event_id,type,"event"))
                            {
                                out.print("<script>alert(\"Changes succesfully done.!!\");window.location.assign(\"index.jsp\");</script>");
                                //response.sendRedirect("home.jsp");
                            }
                            else out.print("<script>alert(\"Unable to delete the event.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to delete the event.\");window.location.assign(\"index.jsp\");</script>");
                   }
                    else out.print("<script>alert(\"Unable to delete the event.\");window.location.assign(\"index.jsp\");</script>");

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
                        if ( status == 1)
			{
                            if(Obj.status_update_delete(venue_id,type,"venue"))
                            {
                                out.print("<script>alert(\"Changes Successfully  Done.!!\");window.location.assign(\"index.jsp\");</script>");
                                //response.sendRedirect("home.jsp");
                            }
                            else out.print("<script>alert(\"Unable to delete the venue.\");window.location.assign(\"index.jsp\");</script>");
			}
                        else out.print("<script>alert(\"Unable to delete the venue.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to delete the venue.\");window.location.assign(\"index.jsp\");</script>");
					
                }
		else if((object != null) && (object.equals("budget")))
                {		
                    String decision = request.getParameter("decision");
                    String id = request.getParameter("id");
                    
                    if((decision != null) && (id != null)) 
                    {
                        int budget_id = Integer.parseInt(id);
                        int status =  Integer.parseInt(decision);
                        UpdateDb Obj = new UpdateDb();
                        if ( status == 1)
			{	
							
                            if(Obj.status_update_delete(budget_id,type,"budget"))
                            {
                                out.print("<script>alert(\"Changes Successfully Done.\");window.location.assign(\"index.jsp\");</script>");
                                //response.sendRedirect("home.jsp");
                            }
                            else out.print("<script>alert(\"Unable to delete the budget.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else out.print("<script>alert(\"Unable to delete the budget.\");window.location.assign(\"index.jsp\");</script>");
                    }
                    else out.print("<script>alert(\"Unable to delete the budget.\");window.location.assign(\"index.jsp\");</script>");
		}
            }
        %>