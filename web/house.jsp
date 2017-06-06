<%@ page import="acmdb.Available" %>
<%@ page import="acmdb.House" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 3 | New TH</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 3 | New TH</h2>
            <p><i>A user may record the details of a new TH, and may update the information regarding an existing TH he/she owns.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
            String state = request.getParameter("state") != null ? request.getParameter("state") : "add_information";
            String id = request.getParameter("id");
        %>

        <div align="center">
            <form>
                <h3>All your houses</h3>
                <%
                    StringBuilder builder = new StringBuilder();
                    List<List<String>> records = House.get(username);
                    for (int i = 0; i < records.size(); ++i) {
                        builder.append("<tr>");
                        for (int j = 1; j < records.get(i).size(); ++j) {
                            builder.append("<td align=\"center\">");
                            builder.append(records.get(i).get(j));
                            builder.append("</td>");
                        }
                        builder.append("<td align=\"center\">");
                        builder.append("<input type=\"button\" value=\"update information\" onclick=\"location.href='house.jsp?state=update_information&id=").append(records.get(i).get(0)).append("'\">");
                        builder.append("<input type=\"button\" value=\"add available date\" onclick=\"location.href='house.jsp?state=add_date&id=").append(records.get(i).get(0)).append("'\">");
                        builder.append("</td>");
                        builder.append("</tr>");
                    }
                %>
                <table align="center" cellspacing="2" cellpadding="2" border="1">
                    <tr>
                        <th>House Name</th>
                        <th>Address</th>
                        <th>Website</th>
                        <th>Telephone</th>
                        <th>Year of Build</th>
                        <th>Rental</th>
                        <th>Total Visits</th>
                        <th>Action</th>
                    </tr>
                    <%= builder.toString() %>
                </table>
            </form>

            <%
                if (state.equals("add_date")) {
            %>
                <h3>Available dates</h3>
                <%
                    builder = new StringBuilder();
                    records = Available.get(Integer.valueOf(id));
                    for (int i = 0; i < records.size(); ++i) {
                        builder.append("<tr>");
                        for (int j = 0; j < records.get(i).size(); ++j) {
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
                        <th>Address</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                    </tr>
                    <%= builder.toString() %>
                </table>
            <%
                }
            %>

            <%
                if (state.equals("add_information")) {
            %>
                <form method="post" action="house_response.jsp?state=add_information">
                    <h3>Release a new house</h3>
                    <table>
                        <tr>
                            <td><label><b>House Name</b></label></td>
                            <td><input type="text" name="name" placeholder="Enter house name" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Address</b></label></td>
                            <td><input type="text" name="address" placeholder="Enter address" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Website</b></label></td>
                            <td><input type="text" name="url" placeholder="Enter website" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Telephone</b></label></td>
                            <td><input type="text" name="telephone" placeholder="Enter telephone" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Year of Build</b></label></td>
                            <td><input type="text" name="year_built" placeholder="Enter year of build" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Rental</b></label></td>
                            <td><input type="text" name="price" placeholder="Enter rental" required></td>
                        </tr>
                    </table>

                    <button type="submit">Continue to add available time</button>
                </form>
            <%
                }
            %>

            <%
                if (state.equals("update_information")){
                    Map<String, String> record = House.get(Integer.valueOf(id));
            %>
                <form method="post" action="house_response.jsp?state=update_information&id=<%= id %>">
                    <h3>Update house information</h3>
                    <table>
                        <tr>
                            <td><label><b>House Name</b></label></td>
                            <td><input type="text" name="name" value="<%= record.getOrDefault("name", "") %>" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Address</b></label></td>
                            <td><input type="text" name="address" value="<%= record.getOrDefault("address", "") %>" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Website</b></label></td>
                            <td><input type="text" name="url" value="<%= record.getOrDefault("url", "") %>" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Telephone</b></label></td>
                            <td><input type="text" name="telephone" value="<%= record.getOrDefault("phone_number", "") %>" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Year of Build</b></label></td>
                            <td><input type="text" name="year_built" value="<%= record.getOrDefault("year_built", "") %>" required></td>
                        </tr>
                        <tr>
                            <td><label><b>Rental</b></label></td>
                            <td><input type="text" name="price" value="<%= record.getOrDefault("price", "") %>" required></td>
                        </tr>
                    </table>

                    <button type="submit">Update information of selected house</button>
                </form>
            <%
                }
            %>

            <%
                if (state.equals("add_date")) {
            %>
                <form method="post" action="house_response.jsp?state=add_date&id=<%= id %>">
                    <h3>Add an available date</h3>
                    <div align="center">
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
                        <button type="submit">Add to available dates</button>
                        <input type="button" value="Return" onclick="location.href='house.jsp'">
                    </div>
                </form>
            <%
                }
            %>
        </div>
    </body>
</html>
