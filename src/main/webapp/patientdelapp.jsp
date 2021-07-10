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


<%
    String id =(String)session.getAttribute("app_id");

%>
<h1>Epelekses to appointment : <%=id%></h1>


<%
    try {
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
        Statement stmt = conn.createStatement();


        stmt.executeUpdate("DELETE   from  appointment where   (id="+id+");");

%>


<h2>Appointment is successfully deleted</h2>




<%
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }



%>


<form method=post action=patient.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>

