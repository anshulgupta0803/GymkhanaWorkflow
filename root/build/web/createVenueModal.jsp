<%
    type = (Integer)session.getAttribute("type");
    if (type != null && type == 0)
    {
%>
        <div class="ui modal createVenue">
            <i class="close icon"></i>
            <div class="header">
                  Create Venue
            </div>
            <div class="content">
                <div>
                    <form action="createaction.jsp?id=venue" method = "post">
                        <center>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="venuename" placeholder="Venue Name" size=48 required/></div>
                            <div style="width:310px; height:40px; ">
                                <select name="event_id"  style="width:310px;">
                                    <option>--Select Event--</option>
                                    <%
                                        SQL = "SELECT `event_id`, `event_name` FROM `event`";
                                        try
                                        {
                                            db.pstmt = db.conn.prepareStatement(SQL);
                                            try
                                            {
                                                db.rs = db.pstmt.executeQuery();
                                                while (db.rs.next())
                                                    out.print ("<option value=" + db.rs.getInt("event_id") + ">" + db.rs.getString("event_name") + "</option>");
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
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_6" style="width:309px;" type="datetime" step="0.01" name="venue_date_activation" title = "Venue at lease from" required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_5" style="width:309px;" type="datetime" step="0.01" name="venue_date_valid_upto" title = "Venue at lease till" required/></div>
                            <div style="width:310px; height:40px; "><input type="submit" value="Create Venue"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>