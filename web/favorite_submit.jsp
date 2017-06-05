<%@ page import="acmdb.Favorite" %>

<%
    try {
        Favorite favorite = (Favorite) session.getAttribute("favorite");
        favorite.addFavorite(Integer.valueOf(request.getParameter("uid")));
        response.sendRedirect("favorite.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>