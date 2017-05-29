<%@ page import="acmdb.Favorite" %><%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/29
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add favorite</title>
</head>
<body>
<%
    Favorite favorite = (Favorite) session.getAttribute("favorite");
    favorite.addFavorite(
            Integer.valueOf(request.getParameter("uid"))
    );
    response.sendRedirect("profile.jsp");
%>
</body>
</html>
