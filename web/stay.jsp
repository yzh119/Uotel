<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Stay" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 4 | Stays</title>
    </head>
    <body>
        <div align="center">
            <h2>Functionality 4 | Stays</h2>

            <p><i>A user can record a stay at any TH (the same user may stay at the same TH multiple times). Each user session (meaning each time after a user has logged into the system) may add one or more stays, and all stays added by a user in a user session are reported to him/her for the ﬁnal review and conﬁrmation, before they are added into the database. Note that a user may only record a stay at a TH during a period he/she has a reservation.</i></p>
        </div>

        <%
            if (session.getAttribute("stay") == null) {
                Stay stay = new Stay(session.getAttribute("username").toString());
                session.setAttribute("stay", stay);
            }
        %>

        <%
            Reservation reservation = (Reservation) session.getAttribute("reservation");

        %>

        <div align="center">
            <h3>All your reservations</h3>

            <%=reservation.getPermanentReservation()%>

            <h3>Stacked stay list</h3>

            <%
                if (session.getAttribute("stay") != null) {
                    Stay stay = (Stay) session.getAttribute("stay");
            %>
            <%=stay.getTemporaryStay()%>
            <%}%>

            <form name="fill_stay" method="get" action="stay_submit.jsp">
                rid: <input type="text" name="rid"> <br>
                start_date: <input type="text" name="start_date"> <br>
                end_date: <input type="text" name="end_date"> <br>
                total_spent: <input type="text" name="spent"> <br>
                num_person: <input type="text" name="number"> <br>
                <input type="submit" value="Submit">
            </form>

            <a href="stay_complete.jsp">confirm</a>
        </div>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
