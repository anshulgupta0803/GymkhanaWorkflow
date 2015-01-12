<%@page import="java.sql.Timestamp"%>
<%
            String venue_event_name = null;
            String venue_name = null;
            Timestamp venue_entry = null;
            Timestamp venue_exit = null;
            Integer venue_last_approved_by = null;
            Integer venue_current_approval_status = null;
            
            if (request.getParameter("viewVenueId") != null)
            {
                try
                {
                    SQL = "SELECT * FROM `venue` JOIN  `event` ON `venue`.`venue_event_id` = `event`.`event_id` WHERE venue_id = " + request.getParameter("viewVenueId");

                    db.pstmt = db.conn.prepareStatement(SQL);

                    try
                    {
                        db.rs = db.pstmt.executeQuery();
                        if (db.rs.next ())
                        {
                            venue_event_name = db.rs.getString ("event_name");
                            venue_name = db.rs.getString ("venue_name");
                            venue_entry = db.rs.getTimestamp ("venue_entry");
                            venue_exit = db.rs.getTimestamp ("venue_exit");
                            venue_last_approved_by = db.rs.getInt ("venue_last_approved_by");
                            venue_current_approval_status = db.rs.getInt ("venue_last_approved_status");
                        }
                    }
                    catch (SQLException e){}
                }
                catch(SQLException e){}
        %>
        <script>
            $( document ).ready(function() {
                $('.viewVenueDetails').modal('setting', 'transition', 'vertical flip').modal('show');
            });
        </script>
        <div class="ui modal viewVenueDetails">
            <i class="close icon"></i>
            <div class="header">
                  View Venue
            </div>
            <div class="content">
                <div>
                    <div class="ui divided selection list">
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Event Name</div>
                            <% out.print (venue_event_name); %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Venue Name</div>
                            <%
                                out.print (venue_name);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Entry</div>
                            <%
                                out.print (venue_entry);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Exit</div>
                            <%
                                out.print (venue_exit);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Status</div>
                            <div style="float: left;">
                                <%
                                    if (venue_last_approved_by == 0 && venue_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Start</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (venue_last_approved_by == 1 && venue_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (venue_last_approved_by == 2 && venue_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (venue_last_approved_by == 3 && venue_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (venue_last_approved_by == 0 && venue_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui red circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (venue_last_approved_by == 1 && venue_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (venue_last_approved_by == 2 && venue_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (venue_last_approved_by == 3 && venue_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Warden</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Estate Manager</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
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
        