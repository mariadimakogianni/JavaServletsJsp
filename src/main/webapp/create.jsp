<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CreatePatient</title>
</head>
<body>
<h1> here you create patient</h1>

<form method="post" action="create2.jsp">
    Userid:<br>
    <input type="text" name="userid">
    <br>
    Username:<br>
    <input type="text" name="username">
    <br>
    Full Name:<br>
    <input type="text" name="full_name">
    <br>
    AMKA:<br>
    <input type="text" name="amka">
    <br>
    Password:<br>
    <input type="password" name="password">

    <br><br>
    <input type="submit" value="Create Patient"><br><br>

</form>



<form method=post action=start.jsp>
    <button type=submit>BACK</button>
</form>

</body>
</html>


