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
    <title>CreateDoctor</title>
</head>
<body>
<div id="banner"><h1>This is admin page for ${username}</h1></div>
<h1> Here you create a doctor</h1>

<form method="post" action="createdoctor2.jsp">
    Username:<br>
    <input type="text" name="username">
    <br>
    Full Name:<br>
    <input type="text" name="full_name">
    <br>
    password:<br>
    <input type="password" name="password">
    <br><br>
    Specialty:<br>
    <select id="specialty" name="specialty">
        <option value="pathologos">Pathologos</option>
        <option value="ofthalmiatros">Ofthalmiatros</option>
        <option value="orthopedikos">Orthopedikos</option>
    </select>
    <br><br>
    <input type="submit" value="Create Doctor"><br><br>

</form>



<form method=post action=admin.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>
</body>
</html>
