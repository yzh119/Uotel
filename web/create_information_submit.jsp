<%@ page import="acmdb.House" %>

<%
    try {
        House.uid++;
        session.setAttribute("currentPH", House.uid);
        House.createHouse(House.uid,
                request.getParameter("name"),
                session.getAttribute("username").toString(),
                request.getParameter("address"),
                request.getParameter("url"),
                request.getParameter("telephone"),
                request.getParameter("year_built"),
                request.getParameter("price"));
        response.sendRedirect("create_time.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>