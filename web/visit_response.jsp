<%@ page import="acmdb.Visit" %>

<%
    try {
        String state = request.getParameter("state");
        Visit visit = (Visit) session.getAttribute("visit");
        if (state.equals("add_stack")) {
            visit.add(
                Integer.valueOf(request.getParameter("id")),
                request.getParameter("start_date"),
                request.getParameter("end_date"),
                Integer.valueOf(request.getParameter("spent")),
                Integer.valueOf(request.getParameter("number"))
            );
        } else if (state.equals("remove_stack")) {
            visit.remove(Integer.valueOf(request.getParameter("id")));
        } else if (state.equals("push_stack")) {
            visit.push();
            session.removeAttribute("visit");
        }
        response.sendRedirect("visit.jsp");
    } catch (Exception e) {
        session.removeAttribute("visit");
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>
