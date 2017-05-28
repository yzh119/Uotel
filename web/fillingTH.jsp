<%@ page import="acmdb.Connector" %>
<%@ page import="acmdb.Available" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Complete TH</title>
</head>
<body>

<%
    session.setAttribute("selectTH", Integer.valueOf(request.getParameter("th_id")));
    response.sendRedirect("reserve.jsp");
%>
</body>
</html>
