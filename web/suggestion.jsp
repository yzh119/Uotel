<%@ page import="acmdb.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="acmdb.Suggestion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 11 | TH suggestions</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 11 | TH suggestions</h2>
            <p><i>Like most e-commerce websites, when a user records his/her reservations to a TH ‘A’, your system should give a list of other suggested THs. TH ‘B’ is suggested, if there exist a user ‘X’ that visited both ‘A’ and ‘B’. The suggested THs should be sorted on decreasing total visit count (i.e., most popular ﬁrst); count only visits by users like ‘X’.</i></p>
        </div>

        <%
            String username = session.getAttribute("username").toString();
        %>

        <%
            StringBuilder builder = new StringBuilder();
            List<List<String>> records = Suggestion.get(username);
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
                <th>Owner</th>
                <th>House Name</th>
                <th>Address</th>
                <th>Website</th>
                <th>Telephone</th>
                <th>Year of Build</th>
                <th>Rental</th>
                <th>Total Visits</th>
                <th>Common Visits</th>
            </tr>
            <%= builder.toString() %>
        </table>
    </body>
</html>
