<%@ page import="acmdb.Available" %>

<%
    try {
        Available.addAvailable(
                (Integer) session.getAttribute("currentPH"),
                request.getParameter("start_date"),
                request.getParameter("end_date")
        );
        response.sendRedirect("house.jsp?state=add_time");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>