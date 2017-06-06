<%@ page import="acmdb.House" %>

<%
    try {
        String state = request.getParameter("state");
        if (state.equals("add_information")) {
            int id = House.add(
                request.getParameter("name"),
                session.getAttribute("username").toString(),
                request.getParameter("address"),
                request.getParameter("url"),
                request.getParameter("telephone"),
                request.getParameter("year_built"),
                request.getParameter("price")
            );
            session.setAttribute("currentPH", id);
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