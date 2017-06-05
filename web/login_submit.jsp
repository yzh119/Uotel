<%@ page import="acmdb.Account" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Login | Welcome to Uotel</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <%
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                if (Account.checkPassword(username, password)) {
                    session.setAttribute("username", username);
                    response.sendRedirect("index.jsp");
                } else {
                    throw new Exception("Wrong username or password!");
                }
            } catch (Exception e) {
                response.sendRedirect("error.jsp?message=" + e.getMessage());
            }
        %>
    </body>
</html>
