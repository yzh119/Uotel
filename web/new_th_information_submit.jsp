<%@ page import="acmdb.House" %>

<%
    try {
        session.setAttribute("currentPH", House.uid);
        House.createHouse(House.uid,
                session.getAttribute("username").toString(),
                request.getParameter("address"),
                request.getParameter("url"),
                request.getParameter("telephone"),
                request.getParameter("year_built"),
                request.getParameter("price"));
        response.sendRedirect("new_th_time.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>