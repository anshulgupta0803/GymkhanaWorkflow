<%
            String club_name = null;
            String club_coordinator = null;
            String club_council = null;
            String club_faculty_mentor = null;
            Double club_budget_allocated = null;
            Double club_budget_utilized = null;
            String club_details = null;
            Integer club_events = null;
            Integer club_status = null;
            Integer club_last_approved_by = null;
            Integer club_current_approval_status = null;
            Timestamp club_date_activation = null;
            Timestamp club_valid_upto = null;
            if (request.getParameter("viewClubId") != null)
            {
                try
                {
                    SQL = "SELECT * FROM `club` WHERE club_id = " + request.getParameter("viewClubId");

                    db.pstmt = db.conn.prepareStatement(SQL);

                    try
                    {
                        db.rs = db.pstmt.executeQuery();
                        if (db.rs.next ())
                        {
                            club_name = db.rs.getString ("club_name");
                            club_coordinator = db.rs.getString ("club_coordinator");
                            club_council = db.rs.getString ("club_council");
                            club_faculty_mentor = db.rs.getString ("club_faculty_mentor");
                            club_budget_allocated = db.rs.getDouble ("club_budget_allocated");
                            club_budget_utilized = db.rs.getDouble ("club_budget_utilized");
                            club_details = db.rs.getString ("club_details");
                            club_events = db.rs.getInt("club_events");
                            club_status = db.rs.getInt("club_status");
                            club_last_approved_by = db.rs.getInt("club_last_approved_by");
                            club_current_approval_status = db.rs.getInt("club_current_approval_status");
                            club_date_activation = db.rs.getTimestamp ("club_date_activation");
                            club_valid_upto = db.rs.getTimestamp ("club_valid_upto");
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
                $('.viewClubDetails').modal('setting', 'transition', 'vertical flip').modal('show');
            });
        </script>
        <div class="ui modal viewClubDetails">
            <i class="close icon"></i>
            <div class="header">
                  View Club
            </div>
            <div class="content">
                <div>
                    <div class="ui divided selection list">
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Name</div>
                            <% out.print (club_name); %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Coordinator</div>
                            <%
                                out.print (club_coordinator);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Council</div>
                            <%
                                out.print (club_council);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Faculty Mentor</div>
                            <%
                                out.print (club_faculty_mentor);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Budget Allocated</div>
                            <%
                                out.print (club_budget_allocated);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Budget Utilized</div>
                            <%
                                out.print (club_budget_utilized);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Details</div>
                            <%
                                out.print (club_details);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Date of Activation</div>
                            <%
                                out.print (club_date_activation);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui purple horizontal label" style="width: 200px; margin-right: 100px; float: left;">Valid Upto</div>
                            <%
                                out.print (club_valid_upto);
                            %>
                        </a>
                        <a class="item">
                            <div class="ui red horizontal label" style="width: 200px; margin-right: 100px; float: left;">Status</div>
                            <div style="float: left;">
                                <%
                                    if (club_last_approved_by == 0 && club_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (club_last_approved_by == 1 && club_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (club_last_approved_by == 2 && club_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (club_last_approved_by == 3 && club_current_approval_status == 1)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (club_last_approved_by == 0 && club_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui red circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (club_last_approved_by == 1 && club_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (club_last_approved_by == 2 && club_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
                                <hr noshade size="5" width="50" style="color: #555; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui black circular label" style="float: left; margin-top: -3px;">Approved</div>
                                <%
                                    }
                                    else if (club_last_approved_by == 3 && club_current_approval_status == 0)
                                    {
                                %>
                                <div class="ui green circular label" style="float: left; margin-right: 0px;">Finance Committee</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">President</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui green circular label" style="float: left; margin-top: -3px;">Dean SA</div>
                                <hr noshade size="5" width="50" style="color: #A1CF64; margin: 5px -3px 0px -3px; float: left;" />
                                <div class="ui red circular label" style="float: left; margin-top: -3px;">Finance Dept.</div>
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