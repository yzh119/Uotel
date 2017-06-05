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

        <div align="center">
            <h3>All possible houses and their available dates</h3>

            <%= House.getTHsTable() %>
        </div>

        <%
            if (session.getAttribute("reservation") == null) {
                Reservation reservation = new Reservation(session.getAttribute("username").toString());
                session.setAttribute("reservation", reservation);
            }
        %>

        <div align="center">
            <h3>Stacked reservation list</h3>

            <form method="post" action="reserve_submit.jsp">
                <label><b>UID</b></label>
                <input type="text" placeholder="Enter UID of the house" name="uid" required>

                <label><b>Start date</b></label>
                <input type="text" placeholder="Enter start date" name="start_date" required>

                <label><b>Start date</b></label>
                <input type="text" placeholder="Enter end date" name="end_date" required>

                <button type="submit">Add to the reservation list</button>

                <%
                    if (session.getAttribute("reservation") != null) {
                        Reservation reservation = (Reservation) session.getAttribute("reservation");
                %>
                    <br><br>

                    <%=reservation.getTemporaryReservation()%>

                    <input type="button" value="Confirm the above reservations" onclick="location.href='reserve_complete.jsp'">
                <%
                    }
                %>
            </form>
        </div>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
