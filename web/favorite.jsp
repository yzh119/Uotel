<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Stay" %>
<%@ page import="acmdb.Favorite" %>
<%@ page import="com.jcraft.jsch.Session" %>

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
            Stay stay = (Stay) session.getAttribute("stay");
        %>

        <div align="center">
            <h3>All your stays</h3>
            <%= stay.getPermanentStay() %>

            <h3>All your favorites</h3>

            <form method="post" action="favorite_submit.jsp">
                UID: <input name="uid" type="text">
                <input type="submit" value="Submit">
            </form>

            <%= Favorite.getFavoriteList(username) %>

        </div>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
