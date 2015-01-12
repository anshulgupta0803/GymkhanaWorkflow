<%@page import="control.GetUserType"%>
<%@ page import="control.LoginValidate" %>
<%
    if (session.getAttribute("userid") != null)
        response.sendRedirect("home.jsp");
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <title>LNMIIT Gymkhana Workflow Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">
        
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
    </head>

    <body>
        <div class="page-container">
            <h1>LNMIIT Gymkhana Workflow Management</h1>
            <form action = "" method = "post">
                <input type="text" name="username" placeholder="Username">
                <input type="password" name="password" placeholder="Password">
                <button type="submit">Login</button>
                <div class="error"><span>+</span></div>
                <%
                    try
                    {
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        if(username.isEmpty() || password.isEmpty())
                        out.print("Please enter the login details");
                        else
                        {
                            LoginValidate db = new LoginValidate();
                            if(db.validate(username, password))
                            {
                                GetUserType User = new GetUserType ();
                                Integer type = User.get_user_type(username,password);
                                session.setAttribute("userid", username);
                                session.setAttribute("type", type);
                                response.sendRedirect("home.jsp");
                            }
                            else
                                out.println("Wrong Username or Password");
                        }
                    }
                    catch (Exception ex){}
                %>
            </form>
        </div>
    </body>
</html>
