<%@ page import="acmdb.Favorite" %>

<%
    try {
        Favorite.add(
            session.getAttribute("username").toString(),
            Integer.valueOf(request.getParameter("id"))
        );
        response.sendRedirect("favorite.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>