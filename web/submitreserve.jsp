<%@ page import="acmdb.Reserve" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submit reservation</title>
</head>
<body>

    <%
        Reserve reservation = (Reserve)
                session.getAttribute("reservation");
        reservation.addToList(
                (Integer) session.getAttribute("selectTH"),
                request.getParameter("start_date"),
                request.getParameter("end_date"));
        response.sendRedirect("reserve.jsp");
    %>
</body>
</html>
