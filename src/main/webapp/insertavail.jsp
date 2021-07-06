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
<h2> Here you insert your availability </h2>

<form method="post" action="insertavail2.jsp">

<label for="availability">Availability:</label>
<input type="date" id="availability" name="availability">

Hours:<br>
<select id="hours" name="hours" multiple>
    <option value="8-10">8-10</option>
    <option value="10-12">10-12</option>
    <option value="12-14">12-14</option>
    <option value="14-16">14-16</option>
</select>
<br><br>
<input type="submit" value="Insert Availability"><br><br>

</form>




<form method=post action=doctor.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
