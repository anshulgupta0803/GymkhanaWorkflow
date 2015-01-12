<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("modifyVenueId") != null && type != null && type == 0)
    {
        SQL = "SELECT * FROM `venue` WHERE `venue_id` = " + request.getParameter("modifyVenueId");
        db.pstmt = db.conn.prepareStatement (SQL);
        db.rs = db.pstmt.executeQuery();
        if (db.rs.next ());
%>
<script>
    $( document ).ready(function() {
        $('.modifyVenueModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
        <div class="ui modal modifyVenueModal">
            <i class="close icon"></i>
            <div class="header">
                  Modify Venue
            </div>
            <div class="content">
                <div>
                    <form action="modifyaction.jsp?id=venue" method = "post">
                        <center>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" value="<% out.print (db.rs.getString("venue_name"));%>"  name="venuename" placeholder="Venue Name" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" value="<% out.print (db.rs.getString("venue_event_id"));%>"  name="event_id" placeholder="Event Identification" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_12" style="width:309px;" type="datetime" step="0.01" name="venue_date_activation" title = "Venue at lease from" required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_11" style="width:309px;" type="datetime" step="0.01" name="venue_date_valid_upto" title = "Venue at lease till" required/></div>
                            <div style="width:310px; height:40px; "><input type="hidden" name="venue_id" value="<% out.print (request.getParameter("modifyVenueId"));%>" required/></div>
                            <div style="width:310px; height:40px; "><input type="submit" value="Modify Venue"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>