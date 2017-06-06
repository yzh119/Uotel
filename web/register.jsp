<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>

<html>
    <head>
        <title>Functionality 1 | Registration</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 1 | Registration</h2>
            <p><i>Registration: a new user has to provide the appropriate information; he/she can pick a login-name and a password. The login name should be checked for uniqueness.</i></p>
        </div>

        <form method="get" action="register_response.jsp">
            <div align="center">
                <table>
                    <tr>
                        <td><label><b>Username</b></label></td>
                        <td><input type="text" placeholder="Enter username (required)" name="username" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Password</b></label></td>
                        <td><input type="password" placeholder="Enter password (required)" name="password" minlength="6" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Real Name</b></label></td>
                        <td><input type="text" placeholder="Enter real name (required)" name="name" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Home address</b></label></td>
                        <td><input type="text" placeholder="Enter home address" name="address"></td>
                    </tr>
                    <tr>
                        <td><label><b>Mobile Phone</b></label></td>
                        <td><input type="text" placeholder="Enter mobile phone" name="phone"></td>
                    </tr>
                </table>

                <button type="submit">Register a new account</button>
            </div>
        </form>
    </body>
</html>
