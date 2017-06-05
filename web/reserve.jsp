<%@ page import="acmdb.TemporaryHousing" %>
<%@ page import="acmdb.Available" %>
<%@ page import="acmdb.Reservation" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Reserve</title>
</head>
<body>
<a href="index.jsp">back</a>
<h1>Reserve TH</h1>

<%

    if (session.getAttribute("reservation") == null) {
        Reservation reservation = new Reservation(session.getAttribute("username").toString());
        session.setAttribute("reservation", reservation);
    }
    if (session.getAttribute("selectTH") == null) {
%>

<form name="reserve_form" method="get" action="fillingTH.jsp">
    UID of the TH you select: <input type="text" name="th_id">
    <input type="submit" value="Submit">
</form>


<p>All possible THs:</p>

<%=TemporaryHousing.getTHsTable()%>

<%
    } else {
%>

<%=Available.getAvailableTable((Integer) session.getAttribute("selectTH"))%>

<form name="choose_date" method="get" action="reserve_submit.jsp">
    Start date: <input type="text" name="start_date"> <br>
    End date: <input type="text" name="end_date"> <br>
    <input type="submit" value="Submit">
</form>

<a href="reserve_cancel.jsp">finish</a><br>
<%
    }
%>

<p>My reservation lists:</p>

<%
    if (session.getAttribute("reservation") != null) {
        Reservation reservation = (Reservation) session.getAttribute("reservation");
%>
<%=reservation.getTemporaryReservation()%>
<%}%>
<br><br>
<a href="confirm.jsp">confirm</a>

</body>
</html>
