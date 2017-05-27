<%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/26
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Uotel</title>
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
    <li><a href="create.jsp">Add Housing</a> </li>
    <li><a href="suggestions.jsp">TH Suggestions</a> </li>
    <li><a href="stay.jsp">Stay</a> </li>
    <li><a href="similarity.jsp">Similarity</a> </li>
  </ul>

  <%
    }
  %>
  </body>
</html>
