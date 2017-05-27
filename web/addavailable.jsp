<%@ page import="acmdb.Connector" %>
<%@ page import="acmdb.TemporaryHousing" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add available</title>
</head>
<body>
    <%
        Connector connector = new Connector();
        TemporaryHousing th = new TemporaryHousing();

        connector.closeConnection();
        response.sendRedirect("create.jsp");
    %>
</body>
</html>
