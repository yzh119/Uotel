<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Two degrees of separation | Welcome to Uotel</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h1>Two degrees of separation</h1>

            <form method="post" action="distance_submit.jsp">
                <label><b>Username 1</b></label>
                <input type="text" placeholder="Enter Username 1" name="username1" required>

                <label><b>Username 2</b></label>
                <input type="text" placeholder="Enter Username 2" name="username2" required>

                <button type="submit">Compute distance</button>
            </form>
        </div>
    </body>
</html>
