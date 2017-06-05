<%@ page import="acmdb.Favorite" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add favorite</title>
</head>
<body>
<%
    Favorite favorite = (Favorite) session.getAttribute("favorite");
    favorite.addFavorite(Integer.valueOf(request.getParameter("uid")));
    response.sendRedirect("profile.jsp");
%>
</body>
</html>
