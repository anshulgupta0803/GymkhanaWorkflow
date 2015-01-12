<div class="ui modal modifyBudget">
            <i class="close icon"></i>
            <div class="header">
                 Modify Budget
            </div>
            <div class="content">
                <div>
                    <form>
                        <center>
                            <select name="modifyBudgetId">
                                <%
                                    SQL = "SELECT `budget_id`, `event_name` FROM `budget` JOIN  `event` ON `budget`.`budget_event_id` = `event`.`event_id`";
                                    try
                                    {
                                        db.pstmt = db.conn.prepareStatement(SQL);
                                        try
                                        {
                                            db.rs = db.pstmt.executeQuery();
                                            while (db.rs.next())
                                                out.print ("<option value=" + db.rs.getInt("budget_id") + ">" + db.rs.getString("event_name") + "</option>");
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
                            <div style="width:310px; height:40px; "><input type="submit" value="Modify Budget"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>