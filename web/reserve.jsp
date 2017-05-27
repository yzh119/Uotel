<%@ page import="acmdb.TemporaryHousing" %><%--
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
    UID of the TH you select: <input type="number" name="th_id"> <br>
    <input type="submit" value="Submit">
</form>


<p>All possible THs:</p>
<%=TemporaryHousing.getAllTHs()%>

<%
    } else {
%>

<form name="choose_date" method="get">
    Start date: <input type="datetime" name="start_date"> <br>
    End date: <input type="datetime" name="end_date"> <br>
    <input type="submit" value="Submit">
</form>

<a href="cancelreserve.jsp">cancel</a>
<a href="finishreserve.jsp">finish</a>
<%
    }
%>

</body>
</html>
