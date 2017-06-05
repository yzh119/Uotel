<%@ page import="acmdb.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Submit reservation</title>
</head>
<body>
    <%
        Reservation reservation = (Reservation) session.getAttribute("reservation");
        reservation.addToList(
                (Integer) session.getAttribute("selectTH"),
                request.getParameter("start_date"),
                request.getParameter("end_date"));
        response.sendRedirect("reserve.jsp");
    %>
</body>
</html>
