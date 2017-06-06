<%@ page import="acmdb.Reserve" %>
<%@ page import="acmdb.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="acmdb.House" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 2 | Reserve</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 2 | Reserve</h2>
            <p><i>After registration, a user can record a reservation to any TH (the same user may reserve the same TH multiple times from different available dates). Each user session (meaning each time after a user has logged into the system) may add one or more researvations, and all reservations added by a user in a user session are reported to him/her for the ﬁnal review and conﬁrmation, before they are added into the database.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
            String state = request.getParameter("state") != null ? request.getParameter("state") : "add_reserve";
            String id = request.getParameter("id");

            if (session.getAttribute("reservation") == null) {
                Reserve reservation = new Reserve(session.getAttribute("username").toString());
                session.setAttribute("reservation", reservation);
            }
        %>

        <div align="center">
            <h3>All your reservation records</h3>
            <%
                StringBuilder builder = new StringBuilder();
                List<List<String>> records = Account.getReservations(username);
                for (int i = 0; i < records.size(); ++i) {
                    builder.append("<tr>");
                    for (int j = 1; j < records.get(i).size(); ++j) {
                        builder.append("<td align=\"center\">");
                        builder.append(records.get(i).get(j));
                        builder.append("</td>");
                    }
                    builder.append("</tr>");
                }
            %>
            <table align="center" cellspacing="2" cellpadding="2" border="1">
                <tr>
                    <th>House Name</th>
                    <th>Owner</th>
                    <th>Address</th>
                    <th>Website</th>
                    <th>Telephone</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                </tr>
                <%= builder.toString() %>
            </table>

            <h3>All possible houses and their available dates</h3>
            <%
                builder = new StringBuilder();
                records = Account.getHouses();
                for (int i = 0; i < records.size(); ++i) {
                    builder.append("<tr>");
                    for (int j = 1; j < records.get(i).size(); ++j) {
                        builder.append("<td align=\"center\">");
                        builder.append(records.get(i).get(j));
                        builder.append("</td>");
                    }
                    builder.append("<td align=\"center\">");
                    builder.append("<input type=\"button\" value=\"reserve\" onclick=\"location.href='reserve.jsp?state=add_date&id=").append(records.get(i).get(0)).append("'\">");
                    builder.append("</td>");
                    builder.append("</tr>");
                }
            %>
            <table align="center" cellspacing="2" cellpadding="2" border="1">
                <tr>
                    <th>House Name</th>
                    <th>Owner</th>
                    <th>Address</th>
                    <th>Website</th>
                    <th>Telephone</th>
                    <th>Year of Build</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Rental</th>
                    <th>Total Visits</th>
                    <th>Action</th>
                </tr>
                <%= builder.toString() %>
            </table>

            <%
                if (state.equals("add_date")) {
            %>
                <h3>Add start and end date</h3>

                <form method="post" action="reserve_submit.jsp?id=<%= id %>">
                    <table>
                        <tr>
                            <td><label><b>Start date</b></label></td>
                            <td><input type="text" placeholder="Enter start date (required)" name="start_date" required></td>
                        </tr>
                        <tr>
                            <td><label><b>End date</b></label></td>
                            <td><input type="text" placeholder="Enter end date (required)" name="end_date" required></td>
                        </tr>
                    </table>

                    <button type="submit">Add to the temporary reservation stack</button>
                </form>
            <%
                }
            %>

            <%
                if (session.getAttribute("reservation") != null) {
                    Reserve reservation = (Reserve) session.getAttribute("reservation");
                    if (!reservation.indices.isEmpty()) {
            %>
                <form>
                    <h3>Temporary reservation stack</h3>
                    <%
                        builder = new StringBuilder();
                        for (int i = 0; i < reservation.indices.size(); ++i) {
                            Map<String, String> record = House.get(reservation.indices.get(i));
                            builder.append("<tr>");
                            builder.append("<td align=\"center\">").append(record.get("name")).append("</td>");
                            builder.append("<td align=\"center\">").append(record.get("owner")).append("</td>");
                            builder.append("<td align=\"center\">").append(reservation.start.get(i).substring(0, 10)).append("</td>");
                            builder.append("<td align=\"center\">").append(reservation.end.get(i).substring(0, 10)).append("</td>");
                            builder.append("</tr>");
                        }
                    %>
                    <table align="center" cellspacing="2" cellpadding="2" border="1">
                        <tr>
                            <th>House Name</th>
                            <th>Owner</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                        </tr>
                        <%= builder.toString() %>
                    </table>
                    <input type="button" value="Confirm the above reservation records" onclick="location.href='reserve_complete.jsp'">
                </form>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>
