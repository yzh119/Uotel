<%@ page import="acmdb.Available" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add available</title>
</head>
<body>
    <%
        Available.addAvailable(
                (Integer) session.getAttribute("currentPH"),
                request.getParameter("start_date"),
                request.getParameter("end_date"));
        response.sendRedirect("create.jsp");
    %>
</body>
</html>
