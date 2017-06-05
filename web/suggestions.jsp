<%@ page import="acmdb.Recommendation" %>
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

        <%= Recommendation.getRecommendations(username) %>
    </body>
</html>