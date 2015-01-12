<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("modifyEventId") != null && type != null && type == 0)
    {
        SQL = "SELECT * FROM `event` WHERE `event_id` = " + request.getParameter("modifyEventId");
        db.pstmt = db.conn.prepareStatement (SQL);
        db.rs = db.pstmt.executeQuery();
        if (db.rs.next ());
%>
<script>
    $( document ).ready(function() {
        $('.modifyEventModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
        <div class="ui modal modifyEventModal">
            <i class="close icon"></i>
            <div class="header">
                  Modify Event
            </div>
            <div class="content">
                <div>
                    <form action="modifyaction.jsp?id=event" method = "post">
                        <center>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="eventname" value="<% out.print (db.rs.getString("event_name"));%>"  placeholder = "Event Name" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="club_id" value="<% out.print (db.rs.getString("event_club_id"));%>"  placeholder = "Club Identification" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="organizer" value="<% out.print (db.rs.getString("event_organizer"));%>"  placeholder = "Event Organizer" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_10" style="width:309px;" type="datetime" step="0.01" name="event_date_activation" title = "Event starts at" required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_9" style="width:309px;" type="datetime" step="0.01" name="event_date_valid_upto" title = "Event ends at" required/></div>
                            <div style="width:310px; height:40px; "><textarea style="width:309px; height:80px;" name="about"  placeholder="About the Event"><% out.print (db.rs.getString("event_details"));%></textarea></div>
                            <div style="width:310px; height:40px; "><input type="hidden" name="event_id" value="<% out.print(request.getParameter("modifyEventId")); %>" required/></div>
                            <br/><br/><br/><br/>
                            <div style="width:310px; height:40px; "><input type="submit" value="Modify Event"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>