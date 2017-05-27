<%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/28
  Time: 2:43
  To change this template use File | Settings | File Templates.
--%>
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
