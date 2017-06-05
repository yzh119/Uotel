<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Two degrees of separation | Welcome to Uotel</title>
    </head>
    <body>
        <h1>Some errors have just occurred!</h1>

        <p> <%= request.getParameter("message") %> </p>

        <a href="index.jsp">back to homepage</a>
    </body>
</html>
