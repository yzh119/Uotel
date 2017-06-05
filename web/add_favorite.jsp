<%@ page import="acmdb.Favorite" %>

<%
    Favorite favorite = (Favorite) session.getAttribute("favorite");
    favorite.addFavorite(Integer.valueOf(request.getParameter("uid")));
    response.sendRedirect("profile.jsp");
%>