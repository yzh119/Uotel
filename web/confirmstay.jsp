<%@ page import="acmdb.Stay" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Confirm stay</title>
    </head>
    <body>
    <%
        Stay stay = (Stay) session.getAttribute("stay");
        stay.pushList();
        session.removeAttribute("stay");
        response.sendRedirect("stay.jsp");
    %>
    </body>
</html>
