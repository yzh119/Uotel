<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Stay" %>
<%@ page import="acmdb.Favorite" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>User profile</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <h1>User profile</h1>

        <h2>My reservations</h2>
        <%
            Reservation reservation = (Reservation) session.getAttribute("reservation");
            Favorite favorite = (Favorite) session.getAttribute("favorite");
            Stay stay = (Stay) session.getAttribute("stay");
        %>
        <%= reservation.getPermanentReservation() %>

        <h2>My stays</h2>
        <%= stay.getPermanentStay() %>

        <h2>My favorites</h2>
        <%= favorite.getFavoriteList() %>

        <h2> Add favorite </h2>
        <form name="add_favorite" method="get" action="add_favorite.jsp">
            uid: <input name="uid" type="text">
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
