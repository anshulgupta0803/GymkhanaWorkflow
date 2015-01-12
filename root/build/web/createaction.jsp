
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
            String id_type = request.getParameter("id");
            if(type == 1)
            {
                if((id_type != null) && (id_type.equals("club")))
                {
                    String Club_Name = request.getParameter("clubname");
                    String Coordinator = request.getParameter("coordinator");
                    String Faculty_Mentor = request.getParameter("faculty");
                    String Council = request.getParameter("council");
                    String Club_Date_Activation = request.getParameter("club_date_activation");
                    String Club_Date_Valid_Upto = request.getParameter("club_date_valid_upto");
                    String Club_Budget_Allocated = request.getParameter("amount");
                    String Club_Description = request.getParameter("about");

                    if((Club_Name != null) && (Coordinator != null ) && (Faculty_Mentor != null) && (Council != null) && (Club_Date_Activation != null) && (Club_Date_Valid_Upto != null) && (Club_Budget_Allocated != null))
                    {
                        ValidateInput Obj = new ValidateInput();
                        try
                        {
                            if((Obj.isalpha(Club_Name)) && (Obj.isalpha(Coordinator)) && (Obj.isalpha(Faculty_Mentor)) && (Obj.isalpha(Council)) && (new Double(Club_Budget_Allocated) > 0))
                            {
                                if((new Date(Club_Date_Activation)).compareTo(new Date(Club_Date_Valid_Upto)) <= 0)
                                {
                                    Timestamp new_Club_Date_Activation = new Timestamp(Obj.convert12to24(Club_Date_Activation).getTime());
                                    Timestamp new_Club_Date_Valid_Upto = new Timestamp(Obj.convert12to24(Club_Date_Valid_Upto).getTime());
                                    String Club_Created_By = (String)session.getAttribute("userid");
                                    UpdateDb DbObj = new UpdateDb();
                                    if(DbObj.new_update_club(Club_Name, Coordinator, Faculty_Mentor, Council, new_Club_Date_Activation, new_Club_Date_Valid_Upto, new Double(Club_Budget_Allocated), Club_Description, Club_Created_By))
                                    {
                                       out.print("<script>alert(\"Changes successfully done.\");window.location.assign(\"index.jsp\");</script>");
                                       //response.sendRedirect("index.jsp");
                                    }
                                    else out.print("<script>alert(\"Unable to create the club.\");window.location.assign(\"index.jsp\");</script>");
                                }
                            }
                            else
                            {
                                out.print("<script>alert(\"Unable to create the club.\");window.location.assign(\"index.jsp\");</script>");
                            }
                        }catch(Exception ex)
                        {
                            out.print("<script>alert(\"Unable to create the club.\");window.location.assign(\"index.jsp\");</script>");
                        }
                     }
                    else
                            {
                                out.print("<script>alert(\"Unable to create the club.\");window.location.assign(\"index.jsp\");</script>");
                            }
                }
            }
            else if (type == 0)
            {
                if((id_type != null) && (id_type.equals("event")))
                {
                    String event_name = request.getParameter("eventname");
                    Integer event_club_id = Integer.parseInt(request.getParameter("club_id"));
                    String event_organizer = request.getParameter("organizer");
                    String event_start = request.getParameter("event_date_activation");
                    String event_end = request.getParameter("event_date_valid_upto");
                    String event_details = request.getParameter("about");

                    if((event_name != null) && (event_club_id != null ) && (event_organizer != null) && (event_start != null) && (event_end != null))
                    {
                        ValidateInput Obj = new ValidateInput();

                        if((Obj.isalpha(event_organizer)) && (event_club_id > 0))
                        {
                            if((new Date(event_start)).compareTo(new Date(event_end)) <= 0)
                            {
                                Timestamp new_event_start = new Timestamp(Obj.convert12to24(event_start).getTime());
                                Timestamp new_event_end = new Timestamp(Obj.convert12to24(event_end).getTime());
                                String event_created_by  = (String)session.getAttribute("userid");
                                UpdateDb DbObj = new UpdateDb();
                                if(DbObj.new_update_event(event_name, event_club_id, new_event_start, new_event_end, event_details, event_organizer, event_created_by))
                                {
                                   //out.print("");
                                   out.print("<script>alert(\"Changes were sucessfully done !!\");window.location.assign(\"index.jsp\");</script>");
                                   //response.sendRedirect("index.jsp");
                                }
                                else out.print("<script>alert(\"Unable to create the event.\");window.location.assign(\"index.jsp\");</script>");
                            }
                            else
                            {
                                out.print("<script>alert(\"Unable to create the event.\");window.location.assign(\"index.jsp\");</script>");
                            }
                        }
                        else
                            {
                                out.print("<script>alert(\"Unable to create the event.\");window.location.assign(\"index.jsp\");</script>");
                            }
                     }
                    else
                            {
                                out.print("<script>alert(\"Unable to create the event.\");window.location.assign(\"index.jsp\");</script>");
                            }
                }
                if((id_type != null) && (id_type.equals("venue")))
                {
                    String venue_name = request.getParameter("venuename");
                    Integer venue_event_id = Integer.parseInt(request.getParameter("event_id"));
                    String venue_entry = request.getParameter("venue_date_activation");
                    String venue_exit = request.getParameter("venue_date_valid_upto");

                    if((venue_name != null) && (venue_event_id != null ) && (venue_entry != null) && (venue_exit != null))
                    {
                        ValidateInput Obj = new ValidateInput();
                        if((Obj.isalphanum(venue_name)) && (venue_event_id>0))
                        {
                            if((new Date(venue_entry)).compareTo(new Date(venue_exit)) <= 0)
                            {
                                Timestamp new_venue_entry = new Timestamp(Obj.convert12to24(venue_entry).getTime());
                                Timestamp new_venue_exit = new Timestamp(Obj.convert12to24(venue_exit).getTime());
                                String venue_created_by = (String)session.getAttribute("userid");
                                UpdateDb DbObj = new UpdateDb();
                                if(DbObj.new_update_venue (venue_name, venue_event_id, new_venue_entry , new_venue_exit, venue_created_by))
                                {
                                   //out.print("");
                                   out.print("<script>alert(\"Changes were sucessfully done !!\");window.location.assign(\"index.jsp\");</script>");
                                   //response.sendRedirect("index.jsp");
                                }
                                else out.print("<script>alert(\"Unable to create the venue.\");window.location.assign(\"index.jsp\");</script>");
                            }
                            else
                            {
                                out.print("<script>alert(\"Unable to create the venue.\");window.location.assign(\"index.jsp\");</script>");
                            }
                        }
                        else
                            {
                                out.print("<script>alert(\"Unable to create the venue.\");window.location.assign(\"index.jsp\");</script>");
                            }
                     }
                    else
                            {
                                out.print("<script>alert(\"Unable to create the venue.\");window.location.assign(\"index.jsp\");</script>");
                            }
                }
                if((id_type != null) && (id_type.equals("budget")))
                {
                    String budget_event_id = request.getParameter("eventId");
                    String budget_demanded = request.getParameter("amount");
                    String budget_details = request.getParameter("about");
                    

                    if((budget_event_id != null) && (budget_demanded != null))
                    {
                        ValidateInput Obj = new ValidateInput();

                        if((Obj.isnum(budget_event_id)) && (new Double(budget_demanded) > 0))
                        {
                                String budget_created_by = (String)session.getAttribute("userid");
                                UpdateDb DbObj = new UpdateDb();
                                if(DbObj.new_update_budget(new Double(budget_demanded),new Integer(budget_event_id),budget_details, budget_created_by))
                                {
                                   //out.print("");
                                    out.print("<script>alert(\"Changes were sucessfully done !!\");window.location.assign(\"index.jsp\");</script>");
                                   //response.sendRedirect("index.jsp");
                                }
                                else out.print("<script>alert(\"Unable to create the budget.\");window.location.assign(\"index.jsp\");</script>");
                        }
                        else
                            {
                                out.print("<script>alert(\"Unable to create the budget.\");window.location.assign(\"index.jsp\");</script>");
                            }
                    }
                    else
                            {
                                out.print("<script>alert(\"Unable to create the budget.\");window.location.assign(\"index.jsp\");</script>");
                            }
                }
                else
                            {
                                out.print("<script>alert(\"Unable to create the budget.\");window.location.assign(\"index.jsp\");</script>");
                            }
            }
            %>
    </body>
</html>