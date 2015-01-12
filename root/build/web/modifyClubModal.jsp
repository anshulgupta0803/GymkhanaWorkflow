<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("modifyClubId") != null && type != null && type == 1)
    {
        SQL = "SELECT * FROM `club` WHERE `club_id` = " + request.getParameter("modifyClubId");
        db.pstmt = db.conn.prepareStatement (SQL);
        db.rs = db.pstmt.executeQuery();
        if (db.rs.next ());
%>
<script>
    $( document ).ready(function() {
        $('.modifyClubModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
    <div class="ui modal modifyClubModal">
            <i class="close icon"></i>
            <div class="header">
                  Modify Club
            </div>
            <div class="content">
                <div>
                    <form action="modifyaction.jsp?id=club" method = "post">
                        <center>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="clubname" value="<% out.print (db.rs.getString("club_name"));%>" placeholder = "Club Name" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="coordinator" value="<% out.print (db.rs.getString("club_coordinator"));%>"  placeholder = "Club Coordinator" size=48 required/></div>
                            <div style="width:310px; height:40px; "><input style="width:310px;" type="text" name="faculty" value="<% out.print (db.rs.getString("club_faculty_mentor"));%>"  placeholder = "Faculty Mentor" size=48 required/></div>
                            <div style="width:310px; height:40px; "><select style="width:310px;" name="council">
                                <option>Gymkhana Council</option>
                                <option value="ScTech" <% if ((db.rs.getString("club_council")).equals("ScTech")) out.print("selected"); %>>Science & Technology</option>
                                <option value="Cult" <% if ((db.rs.getString("club_council")).equals("Cult")) out.print("selected"); %>>Cultural</option>
                                <option value="Sports" <% if ((db.rs.getString("club_council")).equals("Sports")) out.print("selected"); %>>Sports</option> 
                                </select> 
                            </div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_8" style="width:309px;" type="datetime" step="0.01" name="club_date_activation" title = "Start Date" required/></div>
                            <div style="width:310px; height:40px; "><input id = "datetimepicker_7" style="width:309px;" type="datetime" step="0.01" name="club_date_valid_upto" title = "End Date" required/></div>
                            <div style="width:310px; height:40px; "><input style="width:309px;" type="number" step="0.01" name="amount" value="<% out.print (db.rs.getString("club_budget_allocated"));%>"  placeholder = "Budget Allocated" required/></div>
                            <div style="width:310px; height:40px; "><textarea style="width:309px; height:80px;" name="about"  placeholder="About the Club"><% out.print (db.rs.getString("club_details"));%></textarea></div>
                            <div style="width:310px; height:40px; "><input type="hidden" name="club_id" value="<% out.print(request.getParameter("modifyClubId")); %>" required/></div>
                            <br/><br/><br/><br/>
                            <div style="width:310px; height:40px; "><input type="submit" value="Modify Club"  /></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>