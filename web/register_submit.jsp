<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>

<html>
    <head>
        <title>Functionality 1 | Registration</title>
    </head>
    <body>
        <div align="center">
            <h2>Functionality 1 | Registration</h2>

            <p><i>Registration: a new user has to provide the appropriate information; he/she can pick a login-name and a password. The login name should be checked for uniqueness.</i></p>
        </div>

        <%
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                Database.createAccount(username, password, name, address, phone);
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                response.sendRedirect("error.jsp?message=" + e.getMessage());
            }
        %>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
