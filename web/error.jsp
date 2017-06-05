<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Error | Welcome to Uotel</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <p>Some error has just occurred, and the message is as follows:</p>

        <b> <%= request.getParameter("message") %> </b>
    </body>
</html>
