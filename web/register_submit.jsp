<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>

<html>
    <head>
        <title>Register account | Welcome to Uotel</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <%
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                Account.createAccount(username, password, name, address, phone);
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                response.sendRedirect("error.jsp?message=" + e.getMessage());
            }
        %>
    </body>
</html>
