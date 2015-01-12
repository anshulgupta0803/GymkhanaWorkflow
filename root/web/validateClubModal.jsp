<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("validateClubId") != null && type != null && (type == 4 || type == 5 || type == 2))
    {
%>
<script>
    $( document ).ready(function() {
        $('.validateClubModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
<div class="ui modal validateClubModal">
    <i class="close icon"></i>
    <div class="header">
          Validate Club
    </div>
    <div class="content">
        <div>
            <%
                if (type == 4)
                    SQL = "SELECT * FROM `club` WHERE club_last_approved_by = \"0\" AND club_current_approval_status = \"1\" AND `club_id` = " + request.getParameter("validateClubId");
                if (type == 5)
                    SQL = "SELECT * FROM `club` WHERE club_last_approved_by = \"1\" AND club_current_approval_status = \"1\" AND `club_id` = " + request.getParameter("validateClubId");
                if (type == 2)
                    SQL = "SELECT * FROM `club` WHERE club_last_approved_by = \"2\" AND club_current_approval_status = \"1\" AND `club_id` = " + request.getParameter("validateClubId");
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
                    <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Club ID</div>
                    <% out.print (db.rs.getInt("club_id")); %>
                </a>
                <a class="item">
                    <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Name</div>
                    <% out.print (db.rs.getString("club_name")); %>
                </a>
                <a class="item">
                    <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Coordinator</div>
                    <%
                        out.print (db.rs.getString("club_coordinator"));
                    %>
                </a>
                <a class="item">
                    <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Council</div>
                    <%
                        out.print (db.rs.getString("club_council"));
                    %>
                </a>
                <a class="item">
                    <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Faculty Mentor</div>
                    <%
                        out.print (db.rs.getString("club_faculty_mentor"));
                    %>
                </a>
                <a class="item">
                    <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Budget Allocated</div>
                    <%
                        out.print (db.rs.getInt("club_budget_allocated"));
                    %>
                </a>
                <a class="item">
                    <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Created By</div>
                    <%
                        out.print (db.rs.getString("club_created_by"));
                    %>
                </a>
                <a class="item">
                    <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Details</div>
                    <%
                        out.print (db.rs.getString("club_details"));
                    %>
                </a>
                <a class="item">
                    <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Date of Activation</div>
                    <%
                        out.print (db.rs.getTimestamp("club_date_activation"));
                    %>
                </a>
                <a class="item">
                    <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Valid Upto</div>
                    <%
                        out.print (db.rs.getTimestamp("club_valid_upto"));
                    %>
                </a>
            </div>
                            <%
                            out.print("<br/><br/>Do you want to approve this club ? <br/><br/>");%><a href="validateaction.jsp?object=club&id=<%out.print(db.rs.getInt("club_id"));%>&decision=1" class="myButton">Yes</a> &nbsp;&nbsp;<a href="validateaction.jsp?object=club&id=<%out.print(db.rs.getInt("club_id"));%>&decision=0" class="myButton">No</a>

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