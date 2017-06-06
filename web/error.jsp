<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Some error has just occurred</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Some error has just occurred</h2>
            <p>Detailed error message is as follows:</p>
            <b> <%= request.getParameter("message") %> </b>
        </div>
    </body>
</html>
