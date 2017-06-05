<%@ page import="acmdb.Account" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <a href="index.jsp">back</a><br>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (Account.checkPassword(username, password)) {
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
    %>
        <p> Wrong password. </p>
    <%
        }
    %>
    </body>
</html>
