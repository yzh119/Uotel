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
    <title>Complete stay</title>
</head>
<body>
    <%
        Stay stay = (Stay) session.getAttribute("stay");
        stay.addToList(
                Integer.valueOf(request.getParameter("rid")),
                request.getParameter("start_date"),
                request.getParameter("end_date"),
                Integer.valueOf(request.getParameter("spent")),
                Integer.valueOf(request.getParameter("number"))
        );
        response.sendRedirect("stay.jsp");
    %>
</body>
</html>
