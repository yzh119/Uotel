<%@ page import="acmdb.Account" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Two degrees of separation | Welcome to Uotel</title>
    </head>
    <body>
        <h1>Two degrees of separation</h1>

        <%
            int distance = -1;
            try {
                distance = Account.computeDistance(
                    request.getParameter("username1"),
                    request.getParameter("username2")
                );
            } catch (Exception e) {
                response.sendRedirect("error.jsp?message=" + e.getMessage());
            }
        %>

        <%
            if (distance == -1) {
        %>
            <p>
                The distance between <%= request.getParameter("username1") %> and <%= request.getParameter("username2") %> is at least 3-degree away.
            </p>
        <%
            } else {
        %>
            <p>
                The distance between <%= request.getParameter("username1") %> and <%= request.getParameter("username2") %> is <%= distance %>-degree away.
            </p>
        <%
            }
        %>

        <a href="index.jsp">back to homepage</a>
    </body>
</html>
