<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("deleteVenueId") != null && type != null && type == 0)
    {
%>
<script>
    $( document ).ready(function() {
        $('.deleteVenueModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
<div class="ui modal deleteVenueModal">
    <i class="close icon"></i>
    <div class="header">
          Delete Venue
    </div>
    <div class="content">
        <div>
            <%
           
                SQL = "SELECT * FROM `venue` JOIN `event` ON `venue`.`venue_event_id` = `event`.`event_id` WHERE venue_id = " + request.getParameter("deleteVenueId");
                try
                {
                    db.pstmt = db.conn.prepareStatement(SQL);

                    try
                    {
                        db.rs = db.pstmt.executeQuery();
                        if (db.rs.next ())
                        {
                            venue_event_name = db.rs.getString ("event_name");
                            venue_name = db.rs.getString ("venue_name");
                            venue_entry = db.rs.getTimestamp ("venue_entry");
                            venue_exit = db.rs.getTimestamp ("venue_exit");
                            venue_last_approved_by = db.rs.getInt ("venue_last_approved_by");
                            venue_current_approval_status = db.rs.getInt ("venue_last_approved_status");
                            %>
                            <div class="ui divided selection list">
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Name</div>
                            <% out.print (venue_event_name); %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Venue Name</div>
                            <%
                                out.print (venue_name);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Entry</div>
                            <%
                                out.print (venue_entry);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Exit</div>
                            <%
                                out.print (venue_exit);
                            %>
                        </a>
                      </div>
                            <%
                            out.print("<br/><br/>Do you want to Delete this Venue ? <br/><br/>");%><a href="deleteaction.jsp?object=venue&id=<%out.print(db.rs.getInt("venue_id"));%>&decision=1" class="myButton">Yes</a> &nbsp;&nbsp;<a href="deleteaction.jsp?object=venue&id=<%out.print(db.rs.getInt("venue_id"));%>&decision=0" class="myButton">No</a>

                            </div></center><br/><br/>
            <%
                        }
                    }catch(SQLException Ex)
                    {
                    }
                }catch(SQLException Ex)
                {
                }
                finally
                {
                    try
                    {
                        db.conn.close();
                    }
                    catch (SQLException e){}
                }
            }
            %>
            
        </div>
    </div>
</div>