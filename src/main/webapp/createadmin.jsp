<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/6/2021
  Time: 2:18 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CreateAdmin</title>
</head>
<body>
<div id="banner"><h1>This is admin page for ${username}</h1></div>
<h1> Here you create an admin</h1>

<form method="post" action="createadmin2.jsp">

    Username:<br>
    <input type="text" name="username">
    <br>
    Full Name:<br>
    <input type="text" name="full_name">
    <br>
    password:<br>
    <input type="password" name="password">
    <br><br>

    <input type="submit" value="Create Admin"><br><br>

</form>



<form method=post action=admin.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>
</body>
</html>

