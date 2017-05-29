<%@ page import="acmdb.Stay" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/29
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm stay</title>
</head>
<body>
<%
    Stay stay = (Stay) session.getAttribute("stay");
    stay.pushList();
    session.removeAttribute("stay");
    response.sendRedirect("stay.jsp");
%>
</body>
</html>
