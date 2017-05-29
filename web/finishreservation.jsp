<%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cancel reservation</title>
</head>
<body>
    <%
        session.removeAttribute("selectTH");
        response.sendRedirect("reserve.jsp");
    %>
</body>
</html>
