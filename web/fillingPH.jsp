<%@ page import="acmdb.TemporaryHousing" %>
<%@ page import="acmdb.Connector" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Filling PH</title>
</head>
<body>
<%
    Connector connector = new Connector();
    TemporaryHousing th = new TemporaryHousing();
    session.setAttribute("currentPH", TemporaryHousing.uid);
    th.addPH(TemporaryHousing.uid,
            request.getParameter("name"),
            request.getParameter("address"),
            request.getParameter("url"),
            request.getParameter("telephone"),
            request.getParameter("year_built"),
            request.getParameter("price"),
            connector.statement);
    connector.close();
    response.sendRedirect("create.jsp");
%>
</body>
</html>
