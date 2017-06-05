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

        <form method="post" action="new_th_time_submit.jsp">
            <div align="center">
                <label><b>Start date</b></label>
                <input type="text" placeholder="Enter start date" name="start_date" required>

                <label><b>End date</b></label>
                <input type="text" placeholder="Enter end date" name="end_date" required>

                <button type="submit">Continue to add available date</button>
                <input type="button" value="Complete" onclick="location.href='new_th_submit.jsp'">
            </div>
        </form>

        <div align="right">
            <a href="index.jsp">back to the homepage</a>
        </div>
    </body>
</html>
