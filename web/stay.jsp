<%@ page import="acmdb.User" %>
<%@ page import="acmdb.Connector" %>
<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Stay" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 1:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stay</title>
</head>
<body>
<a href="index.jsp">back</a>
<h1>Stay</h1>

<%
    if (session.getAttribute("stay") == null) {
        Stay stay = new Stay(session.getAttribute("username").toString());
        session.setAttribute("stay", stay);
    }
%>

<%
    Reservation reservation = (Reservation) session.getAttribute("reservation");

%>
<p>Your reservations:</p>
<%=reservation.getPermanentReservation()%>

<p>My stay lists:</p>
<%
    if (session.getAttribute("stay") != null) {
        Stay stay = (Stay) session.getAttribute("stay");
%>
<%=stay.getTemporaryStay()%>
<%}%>

<form name="fill_stay" method="get" action="completestay.jsp">
    rid: <input type="text" name="rid"> <br>
    start_date: <input type="text" name="start_date"> <br>
    end_date: <input type="text" name="end_date"> <br>
    total_spent: <input type="text" name="spent"> <br>
    num_person: <input type="text" name="number"> <br>
    <input type="submit" value="Submit">
</form>

<a href="confirmstay.jsp">confirm</a>

</body>
</html>
