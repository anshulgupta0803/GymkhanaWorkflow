<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("deleteBudgetId") != null && type != null && type == 0)
    {
%>
<script>
    $( document ).ready(function() {
        $('.deleteBudgetModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
<div class="ui modal deleteBudgetModal">
    <i class="close icon"></i>
    <div class="header">
          Delete Budget
    </div>
    <div class="content">
        <div>
            <%
           
                SQL = "SELECT * FROM `budget` JOIN `event` ON `budget`.`budget_event_id` = `event`.`event_id` WHERE budget_id = " + request.getParameter("deleteBudgetId");
                try
                {
                    db.pstmt = db.conn.prepareStatement(SQL);

                    try
                    {
                        db.rs = db.pstmt.executeQuery();
                        if (db.rs.next ())
                        {
                            budget_event_name = db.rs.getString ("event_name");
                            budget_demanded = db.rs.getDouble ("budget_demanded");
                            budget_details = db.rs.getString ("budget_details");
                            budget_created_by = db.rs.getString ("budget_created_by");
                            budget_current_approval_status = db.rs.getInt ("budget_current_approval_status");
                            budget_last_approved_by = db.rs.getInt ("budget_last_approved_by");
                            %>
                            <div class="ui divided selection list">
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Name</div>
                            <% out.print (budget_event_name); %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Budget Demanded</div>
                            <%
                                out.print (budget_demanded);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Created By</div>
                            <%
                                out.print (budget_created_by);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Budget Details</div>
                            <%
                                out.print (budget_details);
                            %>
                        </a>
                      </div>
                            <%
                            out.print("<br/><br/>Do you want to Delete this Budget ? <br/><br/>");%><a href="deleteaction.jsp?object=budget&id=<%out.print(db.rs.getInt("budget_id"));%>&decision=1" class="myButton">Yes</a> &nbsp;&nbsp;<a href="deleteaction.jsp?object=budget&id=<%out.print(db.rs.getInt("budget_id"));%>&decision=0" class="myButton">No</a>

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