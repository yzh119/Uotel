<%@ page import="acmdb.Account" %>

<%
    try {
        Account.uid++;
        session.setAttribute("currentPH", Account.uid);
        Account.createHouse(Account.uid,
                request.getParameter("name"),
                session.getAttribute("username").toString(),
                request.getParameter("address"),
                request.getParameter("url"),
                request.getParameter("telephone"),
                request.getParameter("year_built"),
                request.getParameter("price"));
        response.sendRedirect("house_time.jsp");
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>