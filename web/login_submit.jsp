<%@ page import="acmdb.Database" %>

<%
    try {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (Database.checkPassword(username, password)) {
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
            throw new Exception("Wrong username or password!");
        }
    } catch (Exception e) {
        response.sendRedirect("error.jsp?message=" + e.getMessage());
    }
%>