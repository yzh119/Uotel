<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Complete PH</title>
</head>
<body>
    <%
        session.removeAttribute("currentPH");
        response.sendRedirect("index.jsp");
    %>
</body>
</html>
