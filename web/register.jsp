<%@ page contentType="text/html;charset=UTF-8" language="java" import="acmdb.*" %>

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

        Account.createAccount(username, passwd, name, address, phonenumber);
%>

<p> Register successful! </p>

<%
    }
%>
</body>
</html>
