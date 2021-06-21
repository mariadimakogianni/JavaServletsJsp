<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/6/2021
  Time: 5:31 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HOSPITAL</title>
</head>
<body>
<h1> LOGIN</h1>
<form name="loginForm" method="post" action="PatientServlet">
    <label for="username">Username</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="password">Password</label><br>
    <input type="text" id="password" name="password">
    <input type="submit" value="Login" />
</form>



</body>
</html>
