<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("deleteEventId") != null && type != null && type == 0)
    {
%>
<script>
    $( document ).ready(function() {
        $('.deleteClubModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
<div class="ui modal deleteClubModal">
    <i class="close icon"></i>
    <div class="header">
          Delete Event
    </div>
    <div class="content">
        <div>
            <%
                SQL = "SELECT * FROM `event` WHERE `event_id` = " + request.getParameter("deleteEventId");
        
                try
                {
                    db.pstmt = db.conn.prepareStatement (SQL);

                    try
                    {
                        db.rs = db.pstmt.executeQuery();
                        if(db.rs.next())
                        {
                            %>
                       <div class="ui divided selection list">
                    <a class="item">
                        <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Name</div>
                        <% out.print (db.rs.getString("event_name")); %>
                    </a>
                    <a class="item">
                        <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Start Date</div>
                        <%
                            out.print (db.rs.getString("event_start"));
                        %>
                    </a>
                    <a class="item">
                        <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event End Date</div>
                        <%
                            out.print (db.rs.getString("event_end"));
                        %>
                    </a>
                    <a class="item">
                        <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Organizer</div>
                        <%
                            out.print (db.rs.getString("event_organizer"));
                        %>
                    </a>
                    <a class="item">
                        <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Details</div>
                        <%
                            out.print (db.rs.getString("event_details"));
                        %>
                    </a>
            </div>
                            <%
                            out.print("<br/><br/>Do you want to Delete this event ? <br/><br/>");%><a href="deleteaction.jsp?object=event&id=<%out.print(db.rs.getInt("event_id"));%>&decision=1" class="myButton">Yes</a> &nbsp;&nbsp;<a href="deleteaction.jsp?object=event&id=<%out.print(db.rs.getInt("event_id"));%>&decision=0" class="myButton">No</a>

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