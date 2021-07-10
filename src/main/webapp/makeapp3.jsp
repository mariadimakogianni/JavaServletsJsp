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

<%
    String avail_id = request.getParameter("id");
    Integer patient_id = (Integer) session.getAttribute("patient_id");


    try {
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");



        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT doctor_id, date, time FROM availability WHERE id = '"+avail_id+"'");

        while(rs.next()){

        Date date = rs.getDate(2);
        Integer doctor_id = rs.getInt(1);
        String hours = rs.getString(3);

        Statement stmt2 = conn.createStatement();
        stmt2.executeUpdate("insert into appointment(patient_id, date, doctor_id, hours)values('"+patient_id+"','"+date+"','"+doctor_id+"','"+hours+"')");

        Statement stmt1 = conn.createStatement();
        stmt1.executeUpdate("UPDATE availability SET booked = true WHERE id = '"+avail_id+"'");


%>



<h1> YOU BOOKED THE APPOINTMENT</h1>





<%
        }
        conn.close();
        stmt.close();
        rs.close();
        //stmt1.close();
        //stmt2.close();


    } catch(Exception e)
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

