<%@ page import="acmdb.Available" %>

<%
    try {
        Available.addAvailable(
                (Integer) session.getAttribute("currentPH"),
                request.getParameter("start_date"),
                request.getParameter("end_date"));
        response.sendRedirect("create_time.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>