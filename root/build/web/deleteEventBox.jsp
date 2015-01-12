<div class="ui modal deleteEvent">
            <i class="close icon"></i>
            <div class="header">
                 Delete Event
            </div>
            <div class="content">
                <div>
                    <form>
                        <center>
                            <select name="deleteEventId">
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
                            <div style="width:310px; height:40px; "><input type="submit" value="Delete Event"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>