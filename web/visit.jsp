<%@ page import="acmdb.Visit" %>
<%@ page import="acmdb.Account" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 4 | Stays</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 4 | Stays</h2>
            <p><i>A user can record a stay at any TH (the same user may stay at the same TH multiple times). Each user session (meaning each time after a user has logged into the system) may add one or more stays, and all stays added by a user in a user session are reported to him/her for the ﬁnal review and conﬁrmation, before they are added into the database. Note that a user may only record a stay at a TH during a period he/she has a reservation.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
            String state = request.getParameter("state") != null ? request.getParameter("state") : "add_visit";
            String id = request.getParameter("id");

            if (session.getAttribute("stay") == null) {
                Visit stay = new Visit(session.getAttribute("username").toString());
                session.setAttribute("stay", stay);
            }
        %>

        <div align="center">
            <h3>All your visit records</h3>
            <%
                StringBuilder builder = new StringBuilder();
                List<List<String>> records = Account.getVisits(username);
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
                    <th>Number of People</th>
                    <th>Total Cost</th>
                </tr>
                <%= builder.toString() %>
            </table>

            <h3>All your reservation records</h3>
            <%
                builder = new StringBuilder();
                records = Account.getReservations(username);
                for (int i = 0; i < records.size(); ++i) {
                    builder.append("<tr>");
                    for (int j = 1; j < records.get(i).size(); ++j) {
                        builder.append("<td align=\"center\">");
                        builder.append(records.get(i).get(j));
                        builder.append("</td>");
                    }
                    builder.append("<td align=\"center\">");
                    builder.append("<input type=\"button\" value=\"visit\" onclick=\"location.href='visit.jsp?state=add_date&id=").append(records.get(i).get(0)).append("'\">");
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
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Action</th>
                </tr>
                <%= builder.toString() %>
            </table>

            <%
                if (state.equals("add_date")) {
            %>
                <h3>Add start and end date</h3>

                <form method="post" action="visit_submit.jsp?id=<%= id %>">
                    <table>
                        <tr>
                            <td><label><b>Start date</b></label></td>
                            <td><input type="text" placeholder="Enter start date (required)" name="start_date" required></td>
                        </tr>
                        <tr>
                            <td><label><b>End date</b></label></td>
                            <td><input type="text" placeholder="Enter end date (required)" name="end_date" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Total Cost</b></label></td>
                            <td><input type="text" placeholder="Enter total cost (required)" name="spent" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Number of People</b></label></td>
                            <td><input type="text" placeholder="Enter number of people (required)" name="number" required></td>
                        </tr>
                    </table>

                    <button type="submit">Add to the stacked visit list</button>
                </form>
            <%
                }
            %>

            <%
                if (session.getAttribute("stay") != null) {
                    Visit visit = (Visit) session.getAttribute("stay");
                    if (!visit.selectRID.isEmpty()) {
            %>
                <form>
                    <h3>Temporary visit cart</h3>
                    <%
                        builder = new StringBuilder();
                        for (int i = 0; i < visit.selectRID.size(); ++i) {
                            builder.append("<tr>");
                            builder.append("<td>").append(visit.selectRID.get(i)).append("</td>");
                            builder.append("<td>").append(visit.startDate.get(i)).append("</td>");
                            builder.append("<td>").append(visit.endDate.get(i)).append("</td>");
                            builder.append("<td>").append(visit.spent.get(i)).append("</td>");
                            builder.append("<td>").append(visit.number.get(i)).append("</td>");
                            builder.append("</tr>");
                        }
                    %>
                    <table align="center" cellspacing="2" cellpadding="2" border="1">
                        <tr>
                            <th>RID</th>
                            <th>Start date</th>
                            <th>End date</th>
                            <th>Total spent</th>
                            <th>Number of people</th>
                        </tr>
                        <%= builder.toString() %>
                    </table>
                    <input type="button" value="Confirm the above visit records" onclick="location.href='visit_complete.jsp'">
                </form>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>
