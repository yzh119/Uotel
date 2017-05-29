<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Stay" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User profile</title>
</head>
<body>
<a href="index.jsp">back</a>
<h1>User profile</h1>
<h2>My reservations</h2>
<%
    Reservation reservation = (Reservation) session.getAttribute("reservation");
    Stay stay = (Stay) session.getAttribute("stay");
%>
<%=reservation.getPermanentReservation()%>

<h2>My stays</h2>
<%=stay.getPermanentStay()%>

<h2>My favorites</h2>
</body>
</html>
