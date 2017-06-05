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

            <form method="post" action="stay_submit.jsp">
                <table>
                    <tr>
                        <td><label><b>RID</b></label></td>
                        <td><input type="text" placeholder="Enter RID of the reservation" name="rid" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Start date</b></label></td>
                        <td><input type="text" placeholder="Enter start date" name="start_date" required></td>
                    </tr>
                    <tr>
                        <td><label><b>End date</b></label></td>
                        <td><input type="text" placeholder="Enter end date" name="end_date" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Total spent</b></label></td>
                        <td><input type="text" placeholder="Enter total spent" name="spent" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Number of people</b></label></td>
                        <td><input type="text" placeholder="Enter number of people" name="number" required></td>
                    </tr>
                </table>

                <button type="submit">Add to the stacked stay list</button>

                <%
                    if (session.getAttribute("stay") != null) {
                        Stay stay = (Stay) session.getAttribute("stay");
                %>
                    <br><br>

                    <%= stay.getTemporaryStay() %>

                    <input type="button" value="Confirm the above stays" onclick="location.href='stay_complete.jsp'">
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
