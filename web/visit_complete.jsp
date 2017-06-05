<%@ page import="acmdb.Visit" %>

<%
    try {
        Visit stay = (Visit) session.getAttribute("stay");
        stay.pushList();
        session.removeAttribute("stay");
        response.sendRedirect("visit.jsp");
    } catch (Exception e) {
        session.removeAttribute("stay");
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>