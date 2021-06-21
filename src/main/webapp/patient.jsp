

<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 19/6/2021
  Time: 5:43 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PATIENT</title>
</head>
<body>
<div id="banner"><h1>This is patient page for ${username}</h1></div>


<h2>Please choose an option </h2>
<form name="patient" method="get" action="PatientPers" >
    <button name="pers_det" type="submit" value="pers_det">Show your personal details</button>
</form>


<form name="patient" method="get" action="PatientApp" >
    <button name="appointments" type="submit" value="appoinments">Show your appointments</button>
</form>


<form name ="logout" method="post" action="Logout">
<button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
