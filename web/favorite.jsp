<%@ page import="acmdb.Favorite" %>
<%@ page import="acmdb.Visit" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 5 | Favorite recordings</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 5 | Favorite recordings</h2>
            <p><i>Users can declare a TH as his/her favorite place to stay.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
        %>

        <div align="center">
            <h3>All your visits</h3>
            <%
                StringBuilder builder = new StringBuilder();
                List<List<String>> records = Visit.get(username);
                for (int i = 0; i < records.size(); ++i) {
                    builder.append("<tr>");
                    for (int j = 1; j < records.get(i).size(); ++j) {
                        builder.append("<td align=\"center\">");
                        builder.append(records.get(i).get(j));
                        builder.append("</td>");
                    }
                    builder.append("<td align=\"center\">");
                    builder.append("<input type=\"button\" value=\"favorite\" onclick=\"location.href='favorite_response.jsp?id=").append(records.get(i).get(0)).append("'\">");
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
                    <th>Number of People</th>
                    <th>Total Cost</th>
                    <th>Action</th>
                </tr>
                <%= builder.toString() %>
            </table>

            <h3>All your favorites</h3>
            <%
                builder = new StringBuilder();
                records = Favorite.get(username);
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
                    <th>Year of Build</th>
                    <th>Rental</th>
                    <th>Total Visits</th>
                </tr>
                <%= builder.toString() %>
            </table>
        </div>
    </body>
</html>
