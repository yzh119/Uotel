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

        <%
            if (session.getAttribute("username") == null) {
        %>
        <div align="center">
            <form action="login_submit.jsp">
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
                    <td>
                        <a href="profile.jsp">My profile</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="stay.jsp">Add stay</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="reserve.jsp">Functionality 2 | Reserve</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="new_th_information.jsp">Functionality 3 | New TH</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="suggestions.jsp">Functionality 11 | TH suggestions</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="distance.jsp">Functionality 12 | Two degrees of separation</a>
                    </td>
                </tr>
            </table>
        </div>
        <%
            }
        %>
    </body>
</html>