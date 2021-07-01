<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="Utils.*"  %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/6/2021
  Time: 2:31 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CreateDoctor</title>
</head>
<body>
<div id="banner"><h1>This is admin page for ${username}</h1></div>

<%

        String userid=request.getParameter("userid");
        String username=request.getParameter("username");
        String full_name=request.getParameter("full_name");
        String password=request.getParameter("password");
        String specialty=request.getParameter("specialty");


    int workload = 12;
    String salt = BCrypt.gensalt(workload);
    String password_hash= BCrypt.hashpw(password, salt);


        System.out.println(userid+username+full_name+password+specialty);


    try {
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
        Statement stmt = conn.createStatement();

        //hash+salt password
        



        stmt.executeUpdate("insert into doctor(id,username,full_name,password,specialty)values('"+userid+"','"+username+"','"+full_name+"','"+password_hash+"','"+specialty+"')");

        %>


        <h2>Data is successfully inserted</h2>




<%
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }



%>



<form method=post action=admin.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>
</body>
</html>
