<%@ page import="acmdb.Reservation" %>

<%
    Reservation reservation = (Reservation) session.getAttribute("reservation");
    reservation.addToList(
            (Integer) session.getAttribute("selectTH"),
            request.getParameter("start_date"),
            request.getParameter("end_date"));
    response.sendRedirect("reserve.jsp");
%>