<%@page import="java.sql.ResultSet"%>
<%
    type = (Integer)session.getAttribute("type");
    if (request.getParameter("modifyBudgetId") != null && type != null && type == 0)
    {
        SQL = "SELECT * FROM `budget` WHERE `budget_id` = " + request.getParameter("modifyBudgetId");
        db.pstmt = db.conn.prepareStatement (SQL);
        ResultSet rs = db.pstmt.executeQuery();
        if (rs.next ());
%>
<script>
    $( document ).ready(function() {
        $('.modifyBudgetModal').modal('setting', 'transition', 'vertical flip').modal('show');
    });
</script>
        <div class="ui modal modifyBudgetModal">
            <i class="close icon"></i>
            <div class="header">
                  Modify Budget
            </div>
            <div class="content">
                <div>
                    <form action="modifyaction.jsp?id=budget" method = "post">
                        <center>
                            <div style="width:310px; height:40px; ">
                                <select name="eventId"  style="width:310px;">
                                    <option>--Select Event--</option>
                                    <%
                                        SQL = "SELECT `event_id`, `event_name` FROM `event`";
                                        try
                                        {
                                            db.pstmt = db.conn.prepareStatement(SQL);
                                            try
                                            {
                                                db.rs = db.pstmt.executeQuery();
                                                while (db.rs.next())
                                                {
                                                    if (rs.getInt ("budget_event_id") == db.rs.getInt("event_id"))
                                                        out.print ("<option value=" + db.rs.getInt("event_id") + " selected>" + db.rs.getString("event_name") + "</option>");
                                                    else
                                                        out.print ("<option value=" + db.rs.getInt("event_id") + ">" + db.rs.getString("event_name") + "</option>");
                                                }
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
                            </div>
                            <div style="width:310px; height:40px; "><input style="width:309px;" type="number" step="0.01" value="<% out.print (rs.getDouble("budget_demanded")); %>" name="amount" placeholder= "Budget Demanded" required/></div>
                            <div style="width:310px; height:40px; "><textarea style="width:309px; height:80px;" name="about" placeholder="Budget Details"><% out.print(rs.getString ("budget_details")); %></textarea></div>
                            <div style="width:310px; height:40px; "><input type="hidden" value="<% out.print(request.getParameter("modifyBudgetId")); %>" name="budget_id"required/></div>
                            <br/><br/><br/><br/>
                            <div style="width:310px; height:40px; "><input type="submit" value="Modify Budget"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>