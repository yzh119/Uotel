<%@ page import="acmdb.Account" %>

<%
    try {
        Account.addFavorite(
            session.getAttribute("username").toString(),
            Integer.valueOf(request.getParameter("id"))
        );
        response.sendRedirect("favorite.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>