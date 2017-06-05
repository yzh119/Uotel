<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>

<html>
    <head>
        <title>Register User</title>
    </head>
    <body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phonenumber");
        boolean success = Account.createAccount(username, password, name, address, phone);
        if (success) {
    %>
        <p> Register successful!</p>
    <%
        } else {
    %>
        <p> Register unsuccessful!</p>
    <%
        }
    %>

        <a href="index.jsp">back to homepage</a>
    </body>
</html>
