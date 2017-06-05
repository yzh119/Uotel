<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Cancel reservation</title>
</head>
<body>
    <%
        session.removeAttribute("selectTH");
        response.sendRedirect("reserve.jsp");
    %>
</body>
</html>
