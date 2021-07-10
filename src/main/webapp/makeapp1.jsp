<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/6/2021
  Time: 1:37 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Utils.*"  %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>PATIENT</title>
</head>
<body>
<div id="banner"><h1>This is patient page for ${username}</h1></div>

<h2>Please choose Specialty</h2>

<form method="post" action="makeapp2.jsp">

    Specialty:<br>
    <select id="specialty" name="specialty">
        <option value="pathologos">Pathologos</option>
        <option value="ofthalmiatros">Ofthalmiatros</option>
        <option value="orthopedikos">Orthopedikos</option>
    </select>
    <br><br>
    <input type="submit" value="Choose Specialty"><br><br>

</form>


<form method=post action=patient.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
