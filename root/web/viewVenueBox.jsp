<div class="ui modal viewVenue">
            <i class="close icon"></i>
            <div class="header">
                 View Venue
            </div>
            <div class="content">
                <div>
                    <form>
                        <center>
                            <select name="viewVenueId">
                                <option>--Select Event--</option>
                                <%
                                    SQL = "SELECT `venue_id`, `event_name` FROM `venue` JOIN  `event` ON `venue`.`venue_event_id` = `event`.`event_id`";
                                    try
                                    {
                                        db.pstmt = db.conn.prepareStatement(SQL);
                                        try
                                        {
                                            db.rs = db.pstmt.executeQuery();
                                            while (db.rs.next())
                                                out.print ("<option value=" + db.rs.getInt("venue_id") + ">" + db.rs.getString("event_name") + "</option>");
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
                            <div style="width:310px; height:40px; "><input type="submit" value="View Venue"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>