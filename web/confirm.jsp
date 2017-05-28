<%@ page import="acmdb.Reserve" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm</title>
</head>
<body>
    <%
        Reserve reserve =
                (Reserve) session.getAttribute("reservation");
        reserve.pushList();
        session.removeAttribute("reservation");
        response.sendRedirect("reserve.jsp");
    %>
</body>
</html>
