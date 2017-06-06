<%@ page import="acmdb.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Project A | Airbnb-like system : Uotel</title>
    </head>
    <body>
        <div align="center">
            <h2>Project A | Airbnb-like system : Uotel</h2>
        </div>

        <%
            String username = "visitor";
            if (session.getAttribute("username") != null) {
                username = session.getAttribute("username").toString();
            }
        %>

        <%
            if (session.getAttribute("username") == null) {
        %>
        <div align="center">
            <form action="login.jsp">
                <label><b>Username</b></label>
                <input type="text" placeholder="Enter username" name="username" required>

                <label><b>Password</b></label>
                <input type="password" placeholder="Enter password" name="password" required>

                <button type="submit">Login as a user</button>
                <input type="button" value="Register as a new user" onclick="location.href='register.jsp'">
            </form>
        </div>
        <%
            } else {
        %>
        <div align="center">
            <p> Welcome to the Uotel system, <%=username%> <a href="logout.jsp">[logout]</a>.</p>
            <table>
                <tr>
                    <td><a href="reservation.jsp">Functionality 2 | Reserve</a></td>
                </tr>
                <tr>
                    <td><a href="house.jsp">Functionality 3 | New TH</a></td>
                </tr>
                <tr>
                    <td><a href="visit.jsp">Functionality 4 | Stays</a></td>
                </tr>
                <tr>
                    <td><a href="favorite.jsp">Functionality 5 | Favorite recordings</a></td>
                </tr>
                <tr>
                    <td><a href="suggestions.jsp">Functionality 11 | TH suggestions</a></td>
                </tr>
                <tr>
                    <td><a href="distance.jsp">Functionality 12 | Two degrees of separation</a></td>
                </tr>
            </table>
        </div>
        <%
            }
        %>
    </body>
</html>