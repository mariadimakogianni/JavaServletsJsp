<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="Utils.*"  %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/6/2021
  Time: 1:37 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DOCTOR AVAILABILITY</title>
</head>
<body>
<div id="banner"><h1>This is doctor page for ${username}</h1></div>

<%

         String dateavail=request.getParameter("availability");
         String[] hours = request.getParameterValues("hours");
         String username = (String) session.getAttribute("username");
         Integer doctor_id = (Integer) session.getAttribute("doctor_id");


    try {
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
        Statement stmt = conn.createStatement();


     if(hours[0]!=null) {
    stmt.executeUpdate("insert into availability(doctor_id,date,time,booked)values('" + doctor_id + "','" + dateavail + "','" + hours[0] +  "',FALSE)");
}
        if(hours[1]!=null) {
            stmt.executeUpdate("insert into availability(doctor_id,date,time,booked)values('" + doctor_id + "','" + dateavail + "','" + hours[1] +  "',FALSE)");
        }
        if(hours[2]!=null) {
            stmt.executeUpdate("insert into availability(doctor_id,date,time,booked)values('" + doctor_id + "','" + dateavail + "','" + hours[2] +  "',FALSE)");
        }
        if(hours[3]!=null) {
            stmt.executeUpdate("insert into availability(doctor_id,date,time,booked)values('" + doctor_id + "','" + dateavail + "','" + hours[3] +  "',FALSE)");
        }
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }



%>

<h2>Availability is successfully inserted</h2>







<form method=post action=doctor.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
