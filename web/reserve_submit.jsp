<%@ page import="acmdb.Reserve" %>

<%
    try {
        Reserve reservation = (Reserve) session.getAttribute("reservation");
        reservation.addToList(
                Integer.valueOf(request.getParameter("uid")),
                request.getParameter("start_date"),
                request.getParameter("end_date"));
        response.sendRedirect("reserve.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>