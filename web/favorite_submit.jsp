<%@ page import="acmdb.Account" %>

<%
    try {
        Account.addFavorite(
            session.getAttribute("username").toString(),
            Integer.valueOf(request.getParameter("uid"))
        );
        response.sendRedirect("favorite.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>