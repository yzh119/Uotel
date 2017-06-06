<%@ page import="acmdb.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="acmdb.House" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 3 | New TH</title>
    </head>
    <body>
        <div align="center">
            <h2>Functionality 3 | New TH</h2>

            <p><i>A user may record the details of a new TH, and may update the information regarding an existing TH he/she owns.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
        %>

        <div align="center">
            <form>
                <h3>All your houses</h3>

                <%
                    StringBuilder builder = new StringBuilder();
                    List<List<String>> records = Account.getHouses(username);
                    for (int i = 0; i < records.size(); ++i) {
                        builder.append("<tr>");
                        for (int j = 0; j < records.get(i).size(); ++j) {
                            builder.append("<td>");
                            builder.append(records.get(i).get(j));
                            builder.append("</td>");
                        }
                        builder.append("<td>");
                        builder.append("<input type=\"button\" value=\"update\" onclick=\"location.href='house.jsp?id=").append(records.get(i).get(0)).append("'\">");
                        builder.append("</td>");
                        builder.append("</tr>");
                    }
                %>

                <table align="center" cellspacing="2" cellpadding="2" border="1">
                    <tr>
                        <th>UID</th>
                        <th>House name</th>
                        <th>House address</th>
                        <th>Website</th>
                        <th>Telephone</th>
                        <th>Year built</th>
                        <th>Rental</th>
                        <th>Visits</th>
                        <th>Action</th>
                    </tr>
                    <%= builder.toString() %>
                </table>
            </form>

            <%
                if (request.getParameter("id") == null) {
            %>
                <form method="post" action="house_information_submit.jsp">
                    <h3>Release a new house</h3>

                    <table>
                        <tr>
                            <td><label><b>Name</b></label></td>
                            <td><input type="text" name="name"></td>
                        </tr>
                        <tr>
                            <td><label><b>Address</b></label></td>
                            <td><input type="text" name="address"></td>
                        </tr>
                        <tr>
                            <td><label><b>Website</b></label></td>
                            <td><input type="text" name="url"></td>
                        </tr>
                        <tr>
                            <td><label><b>Telephone</b></label></td>
                            <td><input type="text" name="telephone"></td>
                        </tr>
                        <tr>
                            <td><label><b>Year built</b></label></td>
                            <td><input type="text" name="year_built"></td>
                        </tr>
                        <tr>
                            <td><label><b>Price</b></label></td>
                            <td><input type="text" name="price"></td>
                        </tr>
                    </table>

                    <button type="submit">Continue to add available time</button>
                </form>
            <%
                } else {
                    String id = request.getParameter("id").toString();
                    Map<String, String> record = House.get(Integer.valueOf(id));
            %>
                <form method="post" action="house_update.jsp?id=<%= id %>">
                    <h3>Update house information</h3>

                    <table>
                        <tr>
                            <td><label><b>Name</b></label></td>
                            <td><input type="text" name="name" value="<%= record.getOrDefault("name", "") %>"></td>
                        </tr>
                        <tr>
                            <td><label><b>Address</b></label></td>
                            <td><input type="text" name="address" value="<%= record.getOrDefault("address", "") %>"></td>
                        </tr>
                        <tr>
                            <td><label><b>Website</b></label></td>
                            <td><input type="text" name="url" value="<%= record.getOrDefault("url", "") %>"></td>
                        </tr>
                        <tr>
                            <td><label><b>Telephone</b></label></td>
                            <td><input type="text" name="telephone" value="<%= record.getOrDefault("phone_number", "") %>"></td>
                        </tr>
                        <tr>
                            <td><label><b>Year built</b></label></td>
                            <td><input type="text" name="year_built" value="<%= record.getOrDefault("year_built", "") %>"></td>
                        </tr>
                        <tr>
                            <td><label><b>Price</b></label></td>
                            <td><input type="text" name="price" value="<%= record.getOrDefault("price", "") %>"></td>
                        </tr>
                    </table>

                    <button type="submit">Update information of selected house</button>
                </form>
            <%
                }
            %>
        </div>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
