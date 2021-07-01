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

<%
    String id=request.getParameter("id");

%>
<h1>Epelekses ton doctor : <%=id%></h1>


<%
try {
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
Statement stmt = conn.createStatement();


stmt.executeUpdate("DELETE   from  doctor where   (id="+id+");");

%>


<h2>Data is successfully deleted</h2>




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
