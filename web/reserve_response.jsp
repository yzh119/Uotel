<%@ page import="acmdb.Reserve" %>

<%
    try {
        String state = request.getParameter("state");
        Reserve reservation = (Reserve) session.getAttribute("reservation");
        if (state.equals("stack")) {
            reservation.addToList(
                Integer.valueOf(request.getParameter("id")),
                request.getParameter("start_date"),
                request.getParameter("end_date")
            );
        } else if (state.equals("complete")){
            reservation.pushList();
            session.removeAttribute("reservation");
        }
        response.sendRedirect("reserve.jsp");
    } catch (Exception e) {
        session.removeAttribute("reservation");
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>