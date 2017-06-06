<%@ page import="acmdb.Account" %>
<%@ page import="acmdb.House" %>

<%
    try {
        House.update(
            Integer.valueOf(request.getParameter("id").toString()),
            request.getParameter("name"),
            session.getAttribute("username").toString(),
            request.getParameter("address"),
            request.getParameter("url"),
            request.getParameter("telephone"),
            request.getParameter("year_built"),
            request.getParameter("price")
        );
        response.sendRedirect("house.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>