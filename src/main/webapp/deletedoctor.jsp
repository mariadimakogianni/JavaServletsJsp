<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/6/2021
  Time: 2:18 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Utils.*"  %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>DeleteDoctor</title>
</head>
<body>
<div id="banner"><h1>This is admin page for ${username}</h1></div>
<h1> here you delete doctor</h1>

<table align="center" cellpadding="5" cellspacing="5" border="1">
    <tr>
        <br><br>
    </tr>
    <tr>
        <td><b>id</b></td>
        <td><b>username</b></td>
        <td><b>full_name</b></td>
        <td><b>password</b></td>
        <td><b>specialty</b></td>
        <td><b>Delete</b></td>


    </tr>
    <%
        try{
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM doctor");

            while(rs.next()){

    %>
    <tr>

        <td><%=rs.getInt("id") %></td>
        <td><%=rs.getString("username") %></td>
        <td><%=rs.getString("full_name") %></td>
        <td><%=rs.getString("password") %></td>
        <td><%=rs.getString("specialty") %></td>

        <form method="post" action="deletedoctor2.jsp">
            <td> <input name="id" type="submit" value="<%=rs.getInt("id") %>"></td> </form>

    </tr>




    <%
            }
            conn.close();
        stmt.close();
        rs.close();
    } catch(Exception e){System.out.println(e); }
    %>
</table>

    <br> <br>


<form method=post action=admin.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>
</body>
</html>
