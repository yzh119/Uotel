<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 12 | Two degrees of separation</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>

        <div align="center">
            <h2>Functionality 12 | Two degrees of separation</h2>
            <p><i>Given two user names (logins), determine their ‘degree of separation’, defined as follows: Two users ‘A’ and ‘B’ are 1-degree away if they have both favorited at least one common TH; they are 2-degrees away if there exists an user ‘C’ who is 1-degree away from each of ‘A’ and ‘B’, AND ‘A’ and ‘B’ are not 1-degree away at the same time.</i></p>
        </div>

        <div align="center">
            <form method="post" action="distance_response.jsp">
                <table>
                    <tr>
                        <td><label><b>Username 1</b></label></td>
                        <td><input type="text" placeholder="Enter username 1" name="username1" required></td>
                    </tr>
                    <tr>
                        <td><label><b>Username 2</b></label></td>
                        <td><input type="text" placeholder="Enter username 2" name="username2" required></td>
                    </tr>
                </table>

                <button type="submit">Compute the distance between them</button>
            </form>
        </div>
    </body>
</html>
