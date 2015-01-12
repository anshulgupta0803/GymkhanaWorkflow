<%
    String SQL = null;
    DbConnect db = new DbConnect ();
    type = (Integer)session.getAttribute("type");
    if (type != null && type == 0)
    {
%>
        <div class="ui modal createBudget">
            <i class="close icon"></i>
            <div class="header">
                  Create Budget
            </div>
            <div class="content">
                <div>
                    <form action="createaction.jsp?id=budget" method = "post">
                        <center>
                            <div style="width:310px; height:40px; ">
                                <select name="eventId"  style="width:310px;">
                                    <option>--Select Event--</option>
                                    <%
                                        SQL = "SELECT `event_id`, `event_name` FROM `event` WHERE `event_id` NOT IN (SELECT `event_id` FROM `event` JOIN `budget` ON `budget`.`budget_event_id` = `event`.`event_id`)";
                                        try
                                        {
                                            db.pstmt = db.conn.prepareStatement(SQL);
                                            try
                                            {
                                                db.rs = db.pstmt.executeQuery();
                                                while (db.rs.next())
                                                    out.print ("<option value=" + db.rs.getInt("event_id") + ">" + db.rs.getString("event_name") + "</option>");
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
                            <div style="width:310px; height:40px; "><input style="width:309px;" type="number" step="0.01" name="amount" placeholder= "Budget Demanded" required/></div>
                            <div style="width:310px; height:40px; "><textarea style="width:309px; height:80px;" name="about" placeholder="Budget Details"></textarea></div>
                            <br/><br/><br/><br/>
                            <div style="width:310px; height:40px; "><input type="submit" value="Create Budget"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
<%
    }
%>