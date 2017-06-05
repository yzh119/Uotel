<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Functionality 3 | New TH</title>
    </head>
    <body>
        <div align="center">
            <h2>Functionality 3 | New TH</h2>

            <p><i>A user may record the details of a new TH, and may update the information regarding an existing TH he/she owns.</i></p>
        </div>

        <form method="post" action="create_information_submit.jsp">
            <div align="center">
                <table>
                    <tr>
                        <td>
                            <label><b>Address</b></label>
                        </td>
                        <td>
                            <input type="text" name="address">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><b>Website</b></label>
                        </td>
                        <td>
                            <input type="text" name="url">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><b>Telephone</b></label>
                        </td>
                        <td>
                            <input type="text" name="telephone">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><b>Year built</b></label>
                        </td>
                        <td>
                            <input type="text" name="year_built">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><b>Price</b></label>
                        </td>
                        <td>
                            <input type="text" name="price">
                        </td>
                    </tr>
                </table>

                <button type="submit">Continue to add available time</button>
            </div>
        </form>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
