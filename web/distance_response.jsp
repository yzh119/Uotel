<%@ page import="acmdb.Distance" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 12 | Two degrees of separation</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 12 | Two degrees of separation</h2>
            <p><i>Given two user names (logins), determine their ‘degree of separation’, defined as follows: Two users ‘A’ and ‘B’ are 1-degree away if they have both favorited at least one common TH; they are 2-degrees away if there exists an user ‘C’ who is 1-degree away from each of ‘A’ and ‘B’, AND ‘A’ and ‘B’ are not 1-degree away at the same time.</i></p>
        </div>

        <%
            int distance = -1;
            try {
                distance = Distance.get(
                    request.getParameter("username1"),
                    request.getParameter("username2")
                );
            } catch (Exception e) {
                response.sendRedirect("error.jsp?message=" + e.getMessage());
            }
        %>

        <div align="center">
            <%
                if (distance == -1) {
            %>
                <p><b>The distance between <%= request.getParameter("username1") %> and <%= request.getParameter("username2") %> is at least 3-degree away.</b></p>
            <%
                } else {
            %>
                <p><b>The distance between <%= request.getParameter("username1") %> and <%= request.getParameter("username2") %> is <%= distance %>-degree away.</b></p>
            <%
                }
            %>
        </div>
    </body>
</html>
