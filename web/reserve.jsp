<%@ page import="acmdb.House" %>
<%@ page import="acmdb.Available" %>
<%@ page import="acmdb.Reservation" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 2 | Reserve</title>
    </head>
    <body>
        <div align="center">
            <h2>Functionality 2 | Reserve</h2>

            <p><i>After registration, a user can record a reservation to any TH (the same user may reserve the same TH multiple times from different available dates). Each user session (meaning each time after a user has logged into the system) may add one or more researvations, and all reservations added by a user in a user session are reported to him/her for the ﬁnal review and conﬁrmation, before they are added into the database.</i></p>
        </div>

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

<%=House.getTHsTable()%>

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

<h3>My reservation lists:</h3>

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
