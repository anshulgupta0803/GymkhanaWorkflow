<%
            String event_name = null;
            Timestamp event_start = null;
            Timestamp event_end = null;
            String event_organizer = null;
            String event_details = null;
            Integer event_approval_flag_deanSA = 0;
            Integer event_approval_flag_gsec = 0;
            Integer event_last_approved_by = -1;
            if (request.getParameter("viewEventId") != null)
            {
                try
                {
                    SQL = "SELECT * FROM `event` WHERE event_id = " + request.getParameter("viewEventId");

                    db.pstmt = db.conn.prepareStatement(SQL);

                    try
                    {
                        db.rs = db.pstmt.executeQuery();
                        if (db.rs.next ())
                        {
                            event_name = db.rs.getString ("event_name");
                            event_start = db.rs.getTimestamp ("event_start");
                            event_end = db.rs.getTimestamp ("event_end");
                            event_organizer = db.rs.getString ("event_organizer");
                            event_details = db.rs.getString ("event_details");
                            event_approval_flag_deanSA = db.rs.getInt("event_approval_flag_deanSA");
                            event_approval_flag_gsec = db.rs.getInt("event_approval_flag_gsec");
                            event_last_approved_by = db.rs.getInt("event_last_approved_by");
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
                $('.viewEventDetails').modal('setting', 'transition', 'vertical flip').modal('show');
            });
        </script>
        <div class="ui modal viewEventDetails">
            <i class="close icon"></i>
            <div class="header">
                  View Event
            </div>
            <div class="content">
                <div>
                    <div class="ui divided selection list">
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Name</div>
                            <% out.print (event_name); %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Start Date</div>
                            <%
                                out.print (event_start);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event End Date</div>
                            <%
                                out.print (event_end);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Organizer</div>
                            <%
                                out.print (event_organizer);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Details</div>
                            <%
                                out.print (event_details);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Approval Status</div>
                            <div style="float: left;">
                                <%
                                    if (event_approval_flag_gsec == 0 && event_approval_flag_deanSA == 0 && event_last_approved_by == -1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left;">Start</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-right: 0px;">GSec</div>
                                <hr noshade size="5" width="100" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="100" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (event_approval_flag_gsec == 1 && event_approval_flag_deanSA == 0 && event_last_approved_by == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left;">Start</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">GSec</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="100" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (event_approval_flag_gsec == 1 && event_approval_flag_deanSA == 1 && event_last_approved_by == 1)
                                    {
                                %>
                                <<div class="ui green circular label" style="float: left;">Start</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">GSec</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (event_approval_flag_gsec == 0 && event_last_approved_by == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left;">Start</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-right: 0px;">GSec</div>
                                <hr noshade size="5" width="100" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="100" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (event_approval_flag_deanSA == 0 && event_last_approved_by == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left;">Start</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">GSec</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="100" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else {
                                %>
                                <div class="ui green circular label" style="float: left;">Start</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">GSec</div>
                                <hr noshade size="5" width="100" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="100" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
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
            }
        %>