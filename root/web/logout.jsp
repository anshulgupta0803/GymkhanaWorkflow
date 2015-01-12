<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LNMIIT Gymkhana Workflow Management</title>
    </head>
    <body>
        <%
            session.removeAttribute("userid");
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
