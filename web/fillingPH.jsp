<%@ page import="acmdb.TemporaryHousing" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Filling PH</title>
</head>
<body>
<%
    session.setAttribute("currentPH", TemporaryHousing.uid);
    response.sendRedirect("create.jsp");
%>
</body>
</html>
