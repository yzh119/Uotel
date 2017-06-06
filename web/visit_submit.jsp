<%@ page import="acmdb.Visit" %>

<%
    try {
        Visit stay = (Visit) session.getAttribute("stay");
        stay.add(
                Integer.valueOf(request.getParameter("id")),
                request.getParameter("start_date"),
                request.getParameter("end_date"),
                Integer.valueOf(request.getParameter("spent")),
                Integer.valueOf(request.getParameter("number"))
        );
        response.sendRedirect("visit.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>
