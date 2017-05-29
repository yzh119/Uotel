<%@ page import="acmdb.Connector" %>
<%@ page import="acmdb.User" %>
<%@ page import="acmdb.Reservation" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/27
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<a href="index.jsp">back</a><br>

<body>
    <%
        String isFilled = request.getParameter("fill");
        if (isFilled == null) {
    %>

    <form name="login_form" method="get" onsubmit="return check_all_fields(this)">
        <input type="hidden" name="fill" value="register">
        Login name: <input type="text" name="username" ><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Submit">
    </form>

    <%
        } else {
            String
                    username = request.getParameter("username"),
                    password = request.getParameter("password");
            Connector connector = new Connector();
            User user = new User();
            String sql_passwd = user.getPasswd(username, connector.stmt);
            if (sql_passwd.equals(password)) {
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } else {
    %>
        <p> Wrong password. </p>
    <%
        }
        connector.closeConnection();
        }
    %>
</body>
</html>
