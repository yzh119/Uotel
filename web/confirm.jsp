<%@ page import="acmdb.Reservation" %>

<%
    Reservation reservation = (Reservation) session.getAttribute("reservation");
    reservation.pushList();
    session.removeAttribute("reservation");
    response.sendRedirect("reserve.jsp");
%>