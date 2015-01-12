<%@page import="java.sql.Date"%>
<%@page import="model.Budget"%>
<%@page import="java.sql.Statement"%>
<%@page import="model.Club"%>
<%@page import="model.Event"%>
<%@page import="java.sql.SQLException"%>
<%@page import="control.DbConnect"%>
<%@page import="control.FetchEvents"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LNMIIT Gymkhana Workflow Management</title>
        <link rel="stylesheet" href="assets/css/style_navigation.css" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href='assets/css/cupertino/jquery-ui.min.css' />
        <link href='assets/js/fullcalendar/fullcalendar.css' rel='stylesheet' />
        <link href='assets/js/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
        <script src='assets/js/lib/jquery.min.js'></script>
        <script src='assets/js/lib/jquery-ui.custom.min.js'></script>
        <script src='assets/js/fullcalendar/fullcalendar.min.js'></script>
        <link href="assets/css/semantic.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/semantic.js" type="text/javascript"></script>
        <link href="assets/css/homepage.css" rel="stylesheet" type="text/css"/>
        <link href="http://cdn.kendostatic.com/2014.1.318/styles/kendo.common.min.css" rel="stylesheet" />
        <link href="http://cdn.kendostatic.com/2014.1.318/styles/kendo.default.min.css" rel="stylesheet" />
        <script src="http://cdn.kendostatic.com/2014.1.318/js/kendo.all.min.js"></script>
        <script>
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_1").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_2").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_3").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_4").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_5").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_6").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_7").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_8").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_9").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_10").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_11").kendoDateTimePicker({
                    value:new Date()
                });
            });
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker_12").kendoDateTimePicker({
                    value:new Date()
                });
            });
        </script>
        <style>
            #to-do {
                height: 52px;
                width: 221px;
                margin: 30px auto;
                padding: 91px 0 0 188px;
                background: url('../../content/web/datepicker/todo.png') transparent no-repeat 0 0;
            }
        </style>
        <style>
            #calendar
            {
                width: 900px;
                padding-top: 50px;
                margin: 0 auto;
            }
            
        </style>
        <script>
            $(document).ready(function()
            {
                $('#calendar').fullCalendar({
                    theme: true,
                    header: {
                        left: 'prev, next today',
                        center: 'title',
                        right: 'month, agendaWeek, agendaDay'
                    },

                    editable: false,

                    events: "assets/public/events.json"
                });
            });
        </script>
        <script>
            $('.ui.overlay.sidebar').sidebar();
            $('.message .close').on('click', function() {
            $(this).closest('.message').fadeOut();});
        </script>
    </head>
    <body>
        <div class="ui demo red vertical overlay sidebar menu">
            <div class="item ui compact message">
                <p>To be implemented</p>
            </div>
            <div class="item success ui compact message">
                <p>Success Message</p>
            </div>
            <div class="item error ui compact message">
                <p>Error Message</p>
            </div>
            <div class="item ui compact message">
                <p>Standard Message</p>
            </div>
        </div>
        <%
            new FetchEvents ();
        %>
        <div class="content">
            <div class="header-left">
                <img src="assets/img/logo.png" style="float:left; margin-left: 20px; margin-top: -5px;" alt="" height="50"/>
                <div class="ui purple button" id="sidebarInactive" style="float:left; display:true; margin-left:250px;" onclick="$('.demo.sidebar').sidebar('toggle'); getElementById('sidebarActive').style.display=''; $(this).hide();">Notifications</div>
                <div class="ui red button" id="sidebarActive" style="float: left; display:none;margin-left:250px;" onclick="$('.demo.sidebar').sidebar('toggle'); getElementById('sidebarInactive').style.display=''; $(this).hide();">Notifications</div>
            </div>
            <div class="header-right">
                <div class="top-nav">
                    <ul>
                        <li class="active ui simple dropdown item"><a href="home.jsp">Home</a></li>
                        <li class="ui simple dropdown item">
                            <a href="#">Club</a>
                            <div class="menu">
                                <%
                                    Integer mytype = (Integer)session.getAttribute("type");
                                    if (mytype == 1)
                                    {
                                %>
                                <div class="item" onclick="$('.createClub').modal('setting', 'transition', 'vertical flip').modal('show');">Create</div>
                                <div class="item" onclick="$('.modifyClub').modal('setting', 'transition', 'vertical flip').modal('show');">Modify</div>
                                <div class="item" onclick="$('.deleteClub').modal('setting', 'transition', 'vertical flip').modal('show');">Delete</div>
                                <%
                                    }
                                %>
                                <div class="item" onclick="$('.viewClub').modal('setting', 'transition', 'vertical flip').modal('show');">View</div>
                                <%
                                    if (mytype == 1 || mytype == 4 || mytype == 5 || mytype == 2)
                                    {
                                %>
                                <div class="item" onclick="$('.validateClub').modal('setting', 'transition', 'vertical flip').modal('show');">Validate</div>
                                <%
                                    }
                                %>
                            </div>
                        </li>
                        <li class="ui simple dropdown item">
                            <a href="#">Event</a>
                            <div class="menu">
                                <%
                                    if (mytype == 0)
                                    {
                                %>
                                <div class="item" onclick="$('.createEvent').modal('setting', 'transition', 'vertical flip').modal('show');">Create</div>
                                <div class="item" onclick="$('.modifyEvent').modal('setting', 'transition', 'vertical flip').modal('show');">Modify</div>
                                <div class="item" onclick="$('.deleteEvent').modal('setting', 'transition', 'vertical flip').modal('show');">Delete</div>
                                <%
                                    }
                                %>
                                <div class="item" onclick="$('.viewEvent').modal('setting', 'transition', 'vertical flip').modal('show');">View</div>
                                <%
                                    if (mytype == 3 || mytype == 5)
                                    {
                                %>
                                <div class="item" onclick="$('.validateEvent').modal('setting', 'transition', 'vertical flip').modal('show');">Validate</div>
                                <%
                                    }
                                %>
                            </div>
                        </li>
                        <li class="ui simple dropdown item">
                            <a href="#">Budget</a>
                            <div class="menu">
                                <%
                                    if (mytype == 0)
                                    {
                                %>
                                <div class="item" onclick="$('.createBudget').modal('setting', 'transition', 'vertical flip').modal('show');">Create</div>
                                <div class="item" onclick="$('.modifyBudget').modal('setting', 'transition', 'vertical flip').modal('show');">Modify</div>
                                <div class="item" onclick="$('.deleteBudget').modal('setting', 'transition', 'vertical flip').modal('show');">Delete</div>
                                <%
                                    }
                                %>
                                <div class="item" onclick="$('.viewBudget').modal('setting', 'transition', 'vertical flip').modal('show');">View</div>
                                <%
                                    if (mytype == 3 || mytype == 1 || mytype == 5 || mytype == 2)
                                    {
                                %>
                                <div class="item" onclick="$('.validateBudget').modal('setting', 'transition', 'vertical flip').modal('show');">Validate</div>
                                <%
                                    }
                                %>
                            </div>
                        </li>
                        <li class="ui simple dropdown item">
                            <a href="#">Venue</a>
                            <div class="menu">
                                <%
                                    if (mytype == 0)
                                    {
                                %>
                                <div class="item" onclick="$('.createVenue').modal('setting', 'transition', 'vertical flip').modal('show');">Create</div>
                                <div class="item" onclick="$('.modifyVenue').modal('setting', 'transition', 'vertical flip').modal('show');">Modify</div>
                                <div class="item" onclick="$('.deleteVenue').modal('setting', 'transition', 'vertical flip').modal('show');">Delete</div>
                                <%
                                    }
                                %>
                                <div class="item" onclick="$('.viewVenue').modal('setting', 'transition', 'vertical flip').modal('show');">View</div>
                                <%
                                    if (mytype == 5 || mytype == 6 || mytype == 7)
                                    {
                                %>
                                <div class="item" onclick="$('.validateVenue').modal('setting', 'transition', 'vertical flip').modal('show');">Validate</div>
                                <%
                                    }
                                %>
                            </div>
                        </li>
                        <li class="ui simple dropdown item"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div id='calendar'></div>
        <%@include file="createClubModal.jsp" %>
        <%@include file="createEventModal.jsp" %>
        <%@include file="createBudgetModal.jsp" %>
        <%@include file="createVenueModal.jsp" %>
        <%@include file="viewEventBox.jsp" %>
        <%@include file="viewEventModal.jsp" %>
        <%@include file="validateEventBox.jsp" %>
        <%@include file="validateEventModal.jsp" %>
        <%@include file="deleteEventBox.jsp" %>
        <%@include file="deleteEventModal.jsp" %>
        <%@include file="viewClubBox.jsp" %>
        <%@include file="viewClubModal.jsp" %>
        <%@include file="validateClubBox.jsp" %>
        <%@include file="validateClubModal.jsp" %>
        <%@include file="deleteClubBox.jsp" %>
        <%@include file="deleteClubModal.jsp" %>
        <%@include file="viewBudgetBox.jsp" %>
        <%@include file="viewBudgetModal.jsp" %>
        <%@include file="validateBudgetBox.jsp" %>
        <%@include file="validateBudgetModal.jsp" %>
        <%@include file="deleteBudgetBox.jsp" %>
        <%@include file="deleteBudgetModal.jsp" %>
        <%@include file="viewVenueBox.jsp"%>
        <%@include file="viewVenueModal.jsp"%>
        <%@include file="validateVenueBox.jsp"%>
        <%@include file="validateVenueModal.jsp"%>
        <%@include file="deleteVenueBox.jsp"%>
        <%@include file="deleteVenueModal.jsp"%>
        <%@include file="modifyClubBox.jsp"%>
        <%@include file="modifyClubModal.jsp"%>
        <%@include file="modifyEventBox.jsp"%>
        <%@include file="modifyEventModal.jsp"%>
        <%@include file="modifyBudgetBox.jsp"%>
        <%@include file="modifyBudgetModal.jsp"%>
        <%@include file="modifyVenueBox.jsp"%>
        <%@include file="modifyVenueModal.jsp"%>
    </body>
</html>
