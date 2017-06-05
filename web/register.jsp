<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>

<html>
    <head>
        <title>Register account | Welcome to Uotel</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <form method="get" action="register_submit.jsp">
            <table align="center">
                <tr>
                    <td>
                        <label><b>Username</b></label>
                    </td>
                    <td>
                        <input type="text" placeholder="Enter username (required)" name="username" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Password</b></label>
                    </td>
                    <td>
                        <input type="password" placeholder="Enter password (required)" name="password" minlength="6" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Real Name</b></label>
                    </td>
                    <td>
                        <input type="text" placeholder="Enter real name (required)" name="name" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Home address</b></label>
                    </td>
                    <td>
                        <input type="text" placeholder="Enter home address" name="address">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Mobile Phone</b></label>
                    </td>
                    <td>
                        <input type="text" placeholder="Enter mobile phone" name="phone">
                    </td>
                </tr>
            </table>
            <div align="center">
                <button type="submit">Register account</button>
            </div>
        </form>
    </body>
</html>
