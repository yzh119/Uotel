<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>

<html>
    <head>
        <title>Register User</title>
    </head>
    <body>
        <form name="register_form" method="get" action="register_submit.jsp">
            Login name: <input type="text" name="username" ><br>
            Password: <input type="password" name="password"><br>
            Real name: <input type="text" name="name"> <br>
            Address: <input type="text" name="address"> <br>
            Phone number: <input type="text" name="phonenumber"> <br>
            <input type="submit" value="Submit">
        </form>

        <a href="index.jsp">back to homepage</a>
    </body>
</html>
