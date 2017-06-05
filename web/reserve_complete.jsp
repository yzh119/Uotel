<%@ page import="acmdb.Reserve" %>

<%
    try {
        Reserve reservation = (Reserve) session.getAttribute("reservation");
        reservation.pushList();
        session.removeAttribute("reservation");
        response.sendRedirect("reserve.jsp");
    } catch (Exception e) {
        session.removeAttribute("reservation");
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>