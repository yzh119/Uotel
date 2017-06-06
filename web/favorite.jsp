<%@ page import="acmdb.Account" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 5 | Favorite recordings</title>
    </head>
    <body>
        <div align="center">
            <h2>Functionality 5 | Favorite recordings</h2>

            <p><i>Users can declare a TH as his/her favorite place to stay.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
        %>

        <div align="center">
            <h3>All your visits</h3>

            <table align="center" cellspacing="2" cellpadding="2" border="1">
                <tr>
                    <th>RID</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Total spent</th>
                    <th>Number of people</th>
                    <th>UID</th>
                    <th>Owner Name</th>
                    <th>House Name</th>
                    <th>House Address</th>
                    <th>Website</th>
                    <th>Phone number</th>
                    <th>Year built</th>
                    <th>Price</th>
                    <th>Total visits</th>
                </tr>
                <%= Account.list2Table(Account.getVisits(username)) %>
            </table>

            <h3>All your favorites</h3>

            <form method="post" action="favorite_submit.jsp">
                <label><b>UID</b></label>
                <input name="uid" type="text">
                <button type="submit">Add to your favorites</button>
            </form>
            <table align="center" cellspacing="2" cellpadding="2" border="1">
                <tr>
                    <th>UID</th>
                    <th>Owner Name</th>
                    <th>House Name</th>
                    <th>Address</th>
                    <th>Website</th>
                    <th>Telephone</th>
                    <th>Year built</th>
                    <th>Price</th>
                    <th>Total visits</th>
                </tr>
                <%= Account.list2Table(Account.getFavorites(username)) %>
            </table>
        </div>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
