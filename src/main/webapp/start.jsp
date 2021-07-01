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
<form name="loginForm" method="post" >

    <div>
    <label for="username">Username</label><br>
        <input type="text" id="username" name="username"><br> </div>

    <div>
    <label for="password">Password</label><br>
    <input type="password" id="password" name="password"> <br> </div>

     <br><br>
    <input type="submit" formaction="PatientServlet"  value="Login As Patient"><br><br>

    <input type="submit"  formaction="DoctorServlet" value="Login As Doctor"><br><br>

    <input type="submit"  formaction="AdminServlet" value="Login As Admin"><br><br>



</form>
</body>
</html>
