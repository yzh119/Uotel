<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Logout | Welcome to Uotel</title>
    </head>
    <body>
        <%
            session.removeAttribute("username");
            session.removeAttribute("reservation");
            session.removeAttribute("selectTH");
            session.removeAttribute("stay");
            session.removeAttribute("favorite");
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
