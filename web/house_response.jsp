<%@ page import="acmdb.Available" %>
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
            response.sendRedirect("house.jsp?state=add_date&id=" + id);
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
            response.sendRedirect("house.jsp");
        } else if (state.equals("add_date")) {
            int id = Integer.valueOf(request.getParameter("id"));
            Available.add(
                id,
                request.getParameter("start_date"),
                request.getParameter("end_date")
            );
            response.sendRedirect("house.jsp?state=add_time&id=" + id);
        }
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>