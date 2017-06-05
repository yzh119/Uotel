<%@ page import="acmdb.Reservation" %>

<%
    try {
        Reservation reservation = (Reservation) session.getAttribute("reservation");
        reservation.pushList();
        session.removeAttribute("reservation");
        response.sendRedirect("reserve.jsp");
    } catch (Exception e) {
        session.removeAttribute("reservation");
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>