<%@ page import="acmdb.Available" %>

<%
    try {
        int id = Integer.valueOf(request.getParameter("id"));
        Available.addAvailable(
            id,
            request.getParameter("start_date"),
            request.getParameter("end_date")
        );
        response.sendRedirect("house.jsp?state=add_time&id=" + id);
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>