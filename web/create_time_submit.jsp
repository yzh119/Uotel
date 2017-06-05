<%@ page import="acmdb.Available" %>

<%
    Available.addAvailable(
            (Integer) session.getAttribute("currentPH"),
            request.getParameter("start_date"),
            request.getParameter("end_date"));
    response.sendRedirect("create_time.jsp");
%>