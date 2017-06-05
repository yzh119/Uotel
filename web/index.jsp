<%@ page import="acmdb.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Welcome to Uotel</title>
  </head>
  <body>
  <h1>Uotel System</h1>
  <%
    if (session.getAttribute("username") == null) {
  %>
  <ul>
    <li>
      <a href="register.jsp">Register</a>
    </li>
    <li>
      <a href="login.jsp">Login</a>
    </li>
  </ul>
  <%
    } else {
      String username = session.getAttribute("username").toString();
  %>
  <a href="logout.jsp">logout</a>
  <p> Welcome to Uotel, <%=username%>.</p>

  <ul>
    <li><a href="profile.jsp">My profile</a> </li>
    <li><a href="reserve.jsp">Add reservation</a> </li>
    <li><a href="stay.jsp">Add stay</a> </li>
    <li><a href="recommendations.jsp">Recommendations</a> </li>
    <li><a href="create.jsp">Add Housing</a> </li>
    <li><a href="distance.jsp">Two degrees of separation</a> </li>
  </ul>

  <%
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
  </body>
</html>
