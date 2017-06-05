<%@ page import="acmdb.Reservation" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Confirm</title>
</head>
<body>
    <%
        Reservation reservation =
                (Reservation) session.getAttribute("reservation");
        reservation.pushList();
        session.removeAttribute("reservation");
        response.sendRedirect("reserve.jsp");
    %>
</body>
</html>
