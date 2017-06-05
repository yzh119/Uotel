<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Login | Welcome to Uotel</title>
    </head>
    <body>
        <form action="login_submit.jsp">
            <label><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="username" required>
            <br>

            <label><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required>
            <br>

            <button type="submit">Login</button>
        </form>

        <a href="index.jsp">back to homepage</a>
    </body>
</html>