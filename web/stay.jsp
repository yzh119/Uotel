<%@ page import="acmdb.User" %>
<%@ page import="acmdb.Connector" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 1:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stay</title>
</head>
<body>
<a href="index.jsp">back</a>
<h1>Stay</h1>

<form name="stay_form" method="get">
    UID of the TH you want to stay in: <input type="text" name="stay_uid">
    <input type="submit" value="Submit">
</form>

<p>Your reservations:</p>

<%
    User user = new User();
    Connector connector = new Connector();
    String showReservation = user.getReservationTable(
            session.getAttribute("username").toString(),
            connector.stmt
    );
%>

<%=showReservation%>

<%
    connector.closeConnection();
%>

</body>
</html>
