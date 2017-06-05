<%@ page import="acmdb.Stay" %>

<%
    try {
        Stay stay = (Stay) session.getAttribute("stay");
        stay.addToList(
                Integer.valueOf(request.getParameter("rid")),
                request.getParameter("start_date"),
                request.getParameter("end_date"),
                Integer.valueOf(request.getParameter("spent")),
                Integer.valueOf(request.getParameter("number"))
        );
        response.sendRedirect("stay.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>
