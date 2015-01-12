<div class="ui modal validateVenue">
            <i class="close icon"></i>
            <div class="header">
                 Validate Venue
            </div>
            <div class="content">
                <div>
                    <form>
                        <center>
                            <select name="validateVenueId">
                                <%
                                    if (type == 6)
                                        SQL = "SELECT `venue_id`, `event_name` FROM `venue` JOIN  `event` ON `venue`.`venue_event_id` = `event`.`event_id`  WHERE venue_last_approved_by = \"2\" AND venue_last_approved_status = \"1\"";
                                    if (type == 7)
                                        SQL = "SELECT `venue_id`, `event_name` FROM `venue` JOIN  `event` ON `venue`.`venue_event_id` = `event`.`event_id`  WHERE venue_last_approved_by = \"1\" AND venue_last_approved_status = \"1\"";
                                    if (type == 5)
                                        SQL = "SELECT `venue_id`, `event_name` FROM `venue` JOIN  `event` ON `venue`.`venue_event_id` = `event`.`event_id`  WHERE venue_last_approved_by = \"0\" AND venue_last_approved_status = \"1\"";
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