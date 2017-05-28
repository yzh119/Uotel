<%@ page import="acmdb.TemporaryHousing" %>
<%@ page import="acmdb.Connector" %><%--
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
    Connector connector = new Connector();
    TemporaryHousing th = new TemporaryHousing();
    session.setAttribute("currentPH", TemporaryHousing.uid);
    th.addPH(TemporaryHousing.uid,
            request.getParameter("name"),
            request.getParameter("address"),
            request.getParameter("url"),
            request.getParameter("telephone"),
            request.getParameter("year_built"),
            request.getParameter("price"),
            connector.stmt);
    connector.closeConnection();
    response.sendRedirect("create.jsp");
%>
</body>
</html>
