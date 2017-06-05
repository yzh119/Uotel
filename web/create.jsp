<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Housing</title>
</head>
<body>
<a href="index.jsp">back</a>

<h1>Create Housing </h1>

<%
    if (session.getAttribute("currentPH") == null) {
%>
    <p> Complete the following form first:</p>
    <form method="get" action="fillingPH.jsp">
        Name: <input type="text" name="name"> <br>
        Address: <input type="text" name="address"> <br>
        Url: <input type="text" name="url"> <br>
        Telephone: <input type="text" name="telephone"> <br>
        Year built: <input type="text" name="year_built"> <br>
        Price: <input type="text" name="price"> <br>
        <input type="submit" value="Submit">
    </form>
<%
    } else {
%>
    <p>Add available time:</p>
    <form name="available" method="get" action="add_available.jsp">
        Start time: <input type="text" name="start_date"> <br>
        End time: <input type="text" name="end_date"> <br>
        <input type="submit" value="Submit">
    </form>
    <a href="completePH.jsp">Complete</a>
<%
    }
%>
</body>
</html>
