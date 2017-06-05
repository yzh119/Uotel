<%@ page import="acmdb.Database" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 11 | TH suggestions</title>
    </head>
    <body>
        <div align="center">
            <h2>Functionality 11 | TH suggestions</h2>

            <p><i>Like most e-commerce websites, when a user records his/her reservations to a TH ‘A’, your system should give a list of other suggested THs. TH ‘B’ is suggested, if there exist a user ‘X’ that visited both ‘A’ and ‘B’. The suggested THs should be sorted on decreasing total visit count (i.e., most popular ﬁrst); count only visits by users like ‘X’.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
        %>

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
            <%= Database.list2Table(Database.getRecommendations(username)) %>
        </table>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
