<%@ page import="acmdb.Database" %>

<%
    try {
        Database.addFavorite(
            session.getAttribute("username").toString(),
            Integer.valueOf(request.getParameter("uid"))
        );
        response.sendRedirect("favorite.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>