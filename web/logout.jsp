<%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/27
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body
<%
    session.removeAttribute("username");
    session.removeAttribute("reservation");
    response.sendRedirect("index.jsp");
%>
</body>
</html>
