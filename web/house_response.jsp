<%@ page import="acmdb.House" %>
<%@ page import="acmdb.Account" %>

<%
    try {
        String state = request.getParameter("state");
        if (state.equals("add_information")) {
            Account.uid++;
            session.setAttribute("currentPH", Account.uid);
            Account.createHouse(Account.uid,
                request.getParameter("name"),
                session.getAttribute("username").toString(),
                request.getParameter("address"),
                request.getParameter("url"),
                request.getParameter("telephone"),
                request.getParameter("year_built"),
                request.getParameter("price")
            );
            response.sendRedirect("house.jsp?state=add_time");
        } else if (state.equals("update_information")) {
            House.update(
                Integer.valueOf(request.getParameter("id")),
                request.getParameter("name"),
                session.getAttribute("username").toString(),
                request.getParameter("address"),
                request.getParameter("url"),
                request.getParameter("telephone"),
                request.getParameter("year_built"),
                request.getParameter("price")
            );
            response.sendRedirect("house.jsp?state=add_information");
        }
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>