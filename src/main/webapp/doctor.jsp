<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/6/2021
  Time: 1:37 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DOCTOR</title>
</head>
<body>
<div id="banner"><h1>This is doctor page for ${username}</h1></div>

<h2>Please choose an option </h2>

<form action="insertavail.jsp" method="post">
    <input type="submit" value="Insert Availability"></form> <br><br>

<form action="doctorapp.jsp" method="post">
    <input type="submit" value="Show Appointments"></form> <br><br>


<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
