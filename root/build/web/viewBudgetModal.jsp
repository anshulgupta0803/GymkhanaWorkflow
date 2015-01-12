<%
            String budget_event_name = null;
            String budget_details = null;
            String budget_created_by = null;
            Double budget_demanded = null;
            Integer budget_last_approved_by = null;
            Integer budget_current_approval_status = null;
            
            if (request.getParameter("viewBudgetId") != null)
            {
                try
                {
                    SQL = "SELECT * FROM `budget` JOIN `event` ON `budget`.`budget_event_id` = `event`.`event_id` WHERE budget_id = " + request.getParameter("viewBudgetId");

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
                        }
                    }
                    catch (SQLException e)
                    {
                    }
                    finally
                    {
                        
                    }
                }
                catch(SQLException e)
                {

                }
        %>
        <script>
            $( document ).ready(function() {
                $('.viewBudgetDetails').modal('setting', 'transition', 'vertical flip').modal('show');
            });
        </script>
        <div class="ui modal viewBudgetDetails">
            <i class="close icon"></i>
            <div class="header">
                  View Budget
            </div>
            <div class="content">
                <div>
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
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Status</div>
                            <div style="float: left;">
                                <%
                                    if (budget_last_approved_by == 0 && budget_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 1 && budget_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 2 && budget_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 3 && budget_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 4 && budget_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    if (budget_last_approved_by == 0 && budget_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui red circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 1 && budget_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 2 && budget_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 3 && budget_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (budget_last_approved_by == 4 && budget_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">GSec</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Finance Comm.</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="40" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="40" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                %>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }}
        %>