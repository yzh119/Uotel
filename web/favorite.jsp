<%@ page import="acmdb.Reservation" %>
<%@ page import="acmdb.Stay" %>
<%@ page import="acmdb.Favorite" %>

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
            Reservation reservation = (Reservation) session.getAttribute("reservation");
            Favorite favorite = (Favorite) session.getAttribute("favorite");
            Stay stay = (Stay) session.getAttribute("stay");
        %>

        <div align="center">
            <h3>My reservations</h3>
            <%= reservation.getPermanentReservation() %>

            <h3>My stays</h3>
            <%= stay.getPermanentStay() %>

            <h3>My favorites</h3>
            <%= favorite.getFavoriteList() %>

            <h3>Add favorite</h3>
            <form method="post" action="favorite_submit.jsp">
                uid: <input name="uid" type="text">
                <input type="submit" value="Submit">
            </form>
        </div>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
