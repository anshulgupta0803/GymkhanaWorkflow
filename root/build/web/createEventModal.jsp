<%
    type = (Integer)session.getAttribute("type");
    if (type != null && type == 0)
    {
%>
        <div class="ui modal createEvent">
            <i class="close icon"></i>
            <div class="header">
                  Create Event
            </div>
            <div class="content">
                <div>
                    <form action="createaction.jsp?id=event" method = "post">
                        <center>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="eventname" placeholder = "Event Name" size=48 required/></div>
                            <div style="width:310px; height:40px; ">
                                <select name="club_id"  style="width:310px;">
                                    <option>--Select Club--</option>
                                    <%
                                        String SQL = "SELECT `club_id`, `club_name` FROM `club` WHERE `club_last_approved_by` = 3 AND `club_current_approval_status` = 1";
                                        DbConnect db = new DbConnect ();
                                        try
                                        {
                                            db.pstmt = db.conn.prepareStatement(SQL);
                                            try
                                            {
                                                db.rs = db.pstmt.executeQuery();
                                                while (db.rs.next())
                                                    out.print ("<option value=" + db.rs.getInt("club_id") + ">" + db.rs.getString("club_name") + "</option>");
                                            }
                                            catch (SQLException e){}
                                        }
                                        catch (SQLException e){}
                                        finally
                                        {
                                            //db.conn.close();
                                        }
                                    %>
                                </select>
                            </div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="organizer" placeholder = "Event Organizer" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_4" style="width:309px;" type="datetime" step="0.01" name="event_date_activation" title = "Event starts at" required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_3" style="width:309px;" type="datetime" step="0.01" name="event_date_valid_upto" title = "Event ends at" required/></div>
                            <div style="width:310px; height:40px; "><textarea style="width:309px; height:80px;" name="about" placeholder="About the Event"></textarea></div>
                            <br/><br/><br/><br/>
                            <div style="width:310px; height:40px; "><input type="submit" value="Create Event"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>