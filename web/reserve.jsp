<%@ page import="acmdb.TemporaryHousing" %>
<%@ page import="acmdb.Connector" %>
<%@ page import="acmdb.Available" %>
<%@ page import="sun.security.x509.AVA" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reserve</title>
</head>
<body>
<a href="index.jsp">back</a>
<h1>Reserve TH</h1>

<%
    if (session.getAttribute("selectTH") == null) {
%>

<form name="reserve_form" method="get" action="fillingTH.jsp">
    UID of the TH you select: <input type="text" name="th_id"> <br>
    <input type="submit" value="Submit">
</form>


<p>All possible THs:</p>
<%
    Connector connector = new Connector();
%>
<%=TemporaryHousing.getTHsTable(connector.stmt)%>

<%
    connector.closeConnection();
%>

<%
    } else {
%>

<%
    Connector connector = new Connector();
    Available a = new Available();
%>
<%=a.getAvailableTable((Integer) session.getAttribute("selectTH"), connector.stmt)%>

<% connector.closeConnection(); %>

<form name="choose_date" method="get">
    Start date: <input type="text" name="start_date"> <br>
    End date: <input type="text" name="end_date"> <br>
    <input type="submit" value="Submit">
</form>

<a href="cancelreserve.jsp">cancel</a> <br>
<a href="finishreserve.jsp">finish</a>
<%
    }
%>

</body>
</html>
