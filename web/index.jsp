<%@ page import="acmdb.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Homepage | Welcome to Uotel</title>
    </head>
    <body>
        <%
            String username = "visitor";
            if (session.getAttribute("username") != null) {
                username = session.getAttribute("username").toString();
                if (session.getAttribute("reservation") == null) {
                    Reservation reservation = new Reservation(username);
                    session.setAttribute("reservation", reservation);
                }
                if (session.getAttribute("stay") == null) {
                    Stay stay = new Stay(username);
                    session.setAttribute("stay", stay);
                }
                if (session.getAttribute("favorite") == null) {
                    Favorite favorite = new Favorite(username);
                    session.setAttribute("favorite", favorite);
                }
            }
        %>

        <div align="center">
            <h2>Project A | Airbnb-like system : Uotel</h2>
        </div>
        <%
            if (session.getAttribute("username") == null) {
        %>
        <div align="center">
            <form action="login_submit.jsp">
                <label><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>

                <label><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>

                <button type="submit">Login as a user</button>
                <input type="button" value="Register as a new user" onclick="location.href='register.jsp'">
            </form>
        </div>
        <%
            } else {
        %>
        <div align="center">
            <p> Welcome to the Uotel system, <%=username%> <a href="logout.jsp">[logout]</a>.</p>
            <ul>
                <li><a href="profile.jsp">My profile</a> </li>
                <li><a href="reserve.jsp">Add reservation</a> </li>
                <li><a href="stay.jsp">Add stay</a> </li>
                <li><a href="recommendations.jsp">Recommendations</a> </li>
                <li><a href="create.jsp">Add Housing</a> </li>
                <li><a href="distance.jsp">Two degrees of separation</a> </li>
            </ul>
        </div>
        <%
            }
        %>
    </body>
</html>