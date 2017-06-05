<%@ page import="acmdb.Stay" %>

<%
    try {
        Stay stay = (Stay) session.getAttribute("stay");
        stay.pushList();
        session.removeAttribute("stay");
        response.sendRedirect("stay.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>