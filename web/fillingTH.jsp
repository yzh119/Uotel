<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Complete TH</title>
</head>
<body>

<%
    session.setAttribute("selectTH", Integer.valueOf(request.getParameter("th_id")));
    response.sendRedirect("reserve.jsp");
%>
</body>
</html>
