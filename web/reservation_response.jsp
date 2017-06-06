<%@ page import="acmdb.Reservation" %>

<%
    try {
        String state = request.getParameter("state");
        Reservation reservation = (Reservation) session.getAttribute("reservation");
        if (state.equals("stack")) {
            reservation.add(
                Integer.valueOf(request.getParameter("id")),
                request.getParameter("start_date"),
                request.getParameter("end_date")
            );
        } else if (state.equals("complete")){
            reservation.push();
            session.removeAttribute("reservation");
        }
        response.sendRedirect("reservation.jsp");
    } catch (Exception e) {
        session.removeAttribute("reservation");
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>