<%--
  Created by IntelliJ IDEA.
  User: zihao
  Date: 2017/5/27
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<html>
<head>
    <title>Register User</title>
    <script LANGUAGE="javascript">

        function check_all_fields(form_obj){
            if( form_obj.username.value == "" ||
                form.obj.password.value == "" ||
                form.obj.name.value == "" ||
                form.obj.address.value == "" ||
                form.obj.phonenumber.value == "") {
                alert("All fields should be nonempty");
                return false;
            }
            return true;
        }

    </script>
</head>
<body>

<a href="index.jsp">back</a><br>

<%
    String isFilled = request.getParameter("fill");
    if (isFilled == null) {
%>

<form name="register_form" method="get" onsubmit="return check_all_fields(this)">
    <input type="hidden" name="fill" value="register">
    Login name: <input type="text" name="username" ><br>
    Password: <input type="password" name="password"><br>
    Real name: <input type="text" name="name"> <br>
    Address: <input type="text" name="address"> <br>
    Phone number: <input type="text" name="phonenumber"> <br>
    <input type="submit" value="Submit">
</form>

<%
    } else {
        String
            username = request.getParameter("username"),
            passwd = request.getParameter("password"),
            name = request.getParameter("name"),
            address = request.getParameter("address"),
            phonenumber = request.getParameter("phonenumber");

        Connector connector = new Connector();
        User user = new User();

        user.addUser(username, passwd,
                name, address, phonenumber, connector.stmt);
%>

<p> Register successful! </p>

<%
        connector.closeConnection();
    }
%>
</body>
</html>
