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
    <title>ADMIN</title>
</head>
<body>
<div id="banner"><h1>This is admin page for ${username}</h1></div>

<br>

<table>
    <tr>
        <td>Create Doctor </td>
        <td>Delete Doctor </td>
        <td>Create Patient </td>
    </tr>
    <tr>
    <td><form action="createdoctor.jsp" method="post">
    <input type="submit"  value="Create Doctor"></form><br><br></td>

    <td> <form action="deletedoctor.jsp" method="post">
    <input type="submit" value="Delete Doctor"></form> <br><br> </td>

     <td> <form action="createpatient.jsp" method="post">
    <input type="submit" value="Create Patient"></form> <br><br> </td>

    </tr>
    <br> <br> <br>



</table>

<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
