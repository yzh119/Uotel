<%@ page import="acmdb.Account" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Distance</title>
</head>
<body>
<a href="index.jsp">back</a>
<h1>Distance</h1>

<form name="distance_form" method="get">
    <input type="hidden" name="is_filled" value="frog">
    User: <input type="text" name="sim_user">
    <input type="submit" value="Submit">
</form>

<%
    int dis = -1;
    if (request.getParameter("is_filled") != null) {
        dis = Account.computeDistance(
                (String) session.getAttribute("username"),
                request.getParameter("sim_user")
        );
%>

<br>
<p>
Your distance with <%=request.getParameter("sim_user")%> is <%=dis%>.
</p>

<%
    }
%>
</body>
</html>
