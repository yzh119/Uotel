<%@ page import="acmdb.House" %>
<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Database" %>
<%@ page import="java.util.List" %>

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
            String username = session.getAttribute("username").toString();
        %>

        <div align="center">
            <h3>All possible houses and their available dates</h3>

            <table align="center" cellspacing="2" cellpadding="2" border="1">
                <tr>
                    <th>UID</th>
                    <th>Owner Name</th>
                    <th>House Address</th>
                    <th>Website</th>
                    <th>Phone number</th>
                    <th>Year built</th>
                    <th>Price</th>
                    <th>Total visits</th>
                    <th>Start date</th>
                    <th>End date</th>
                </tr>

                <%= Database.list2Table(Database.getAvailableHouses()) %>
            </table>

            <h3>All your reservations</h3>

            <table align="center" cellspacing="2" cellpadding="2" border="1">
                <tr>
                    <th>RID</th>
                    <th>UID</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Owner Name</th>
                    <th>House Address</th>
                    <th>Website</th>
                    <th>Phone number</th>
                    <th>Year built</th>
                    <th>Price</th>
                    <th>Total visits</th>
                </tr>

                <%= Database.list2Table(Database.getReservations(username)) %>
            </table>
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
                <table>
                    <tr>
                        <td><label><b>UID</b></label></td>
                        <td><input type="text" placeholder="Enter UID of the house" name="uid" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Start date</b></label></td>
                        <td><input type="text" placeholder="Enter start date" name="start_date" required></td>
                    </tr>
                    <tr>
                        <td><label><b>End date</b></label></td>
                        <td><input type="text" placeholder="Enter end date" name="end_date" required></td>
                    </tr>
                </table>

                <button type="submit">Add to the stacked reservation list</button>

                <%
                    if (session.getAttribute("reservation") != null) {
                        Reservation reservation = (Reservation) session.getAttribute("reservation");
                        if (!reservation.selectTH.isEmpty()) {
                %>
                    <br><br>
                    <%
                        StringBuilder builder = new StringBuilder();
                        for (int i = 0; i < reservation.selectTH.size(); ++i) {
                            builder.append("<tr>");
                            builder.append("<td>").append(reservation.selectTH.get(i)).append("</td>");
                            builder.append("<td>").append(reservation.startDate.get(i).substring(0, 10)).append("</td>");
                            builder.append("<td>").append(reservation.endDate.get(i).substring(0, 10)).append("</td>");
                            builder.append("</tr>");
                        }
                    %>
                    <table align="center" cellspacing="2" cellpadding="2" border="1">
                        <tr>
                            <th>UID</th>
                            <th>Start date</th>
                            <th>End date</th>
                        </tr>
                        <%= builder.toString() %>
                    </table>

                    <input type="button" value="Confirm the above reservations" onclick="location.href='reserve_complete.jsp'">
                <%
                        }
                    }
                %>
            </form>
        </div>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
