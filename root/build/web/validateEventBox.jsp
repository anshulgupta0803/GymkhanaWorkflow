<div class="ui modal validateEvent">
            <i class="close icon"></i>
            <div class="header">
                 Validate Event
            </div>
            <div class="content">
                <div>
                    <form>
                        <center>
                            <select name="validateEventId">
                                <%
                                    SQL = "SELECT `event_id`, `event_name` FROM `event` WHERE `event_last_approved_by` != 1";
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
                            <div style="width:310px; height:40px; "><input type="submit" value="View Event"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>