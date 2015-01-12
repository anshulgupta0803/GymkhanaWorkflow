<div class="ui modal validateBudget">
            <i class="close icon"></i>
            <div class="header">
                 Validate Budget
            </div>
            <div class="content">
                <div>
                    <form>
                        <center>
                            <select name="validateBudgetId">
                                <%
                                    if (type == 3)
                                        SQL = "SELECT `budget_id`, `event_name` FROM `budget` JOIN  `event` ON `budget`.`budget_event_id` = `event`.`event_id` WHERE budget_last_approved_by = 0 AND budget_current_approval_status = 1";
                                    if (type == 1)
                                        SQL = "SELECT `budget_id`, `event_name` FROM `budget` JOIN  `event` ON `budget`.`budget_event_id` = `event`.`event_id` WHERE budget_last_approved_by = 1 AND budget_current_approval_status = 1";
                                    if (type == 5)
                                        SQL = "SELECT `budget_id`, `event_name` FROM `budget` JOIN  `event` ON `budget`.`budget_event_id` = `event`.`event_id` WHERE budget_last_approved_by = 2 AND budget_current_approval_status = 1";
                                    if (type == 2)
                                        SQL = "SELECT `budget_id`, `event_name` FROM `budget` JOIN  `event` ON `budget`.`budget_event_id` = `event`.`event_id` WHERE budget_last_approved_by = 3 AND budget_current_approval_status = 1";
                                        
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
                            <div style="width:310px; height:40px; "><input type="submit" value="View Budget"></div>
                        </center>
                    </form>
                </div>
            </div>
        </div>