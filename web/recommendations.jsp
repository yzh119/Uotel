<%@ page import="acmdb.Recommendation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Suggestions</title>
</head>
<body>
<a href="index.jsp">back</a>
<h1>Suggestions</h1>
<p>TH suggestions for you:</p>

<%
    String username = session.getAttribute("username").toString();
%>

<%=Recommendation.getRecommendations(username)%>

</body>
</html>
