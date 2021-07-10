<<%--
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

<h2>Please choose Appointment</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">


<%
    String specialty =request.getParameter("specialty");

    try {
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT doctor.full_name ,availability.date, availability.time,availability.booked, doctor.specialty, availability.id " +
                "FROM availability " +
                "INNER JOIN doctor on doctor.id= availability.doctor_id ");

        boolean found = false;

        while(rs.next()){
            if(rs.getString(5).equals(specialty) && !rs.getBoolean(4)){
                if (!found)   {

%>

<tr>

    <br><br>

</tr>
<tr>
    <td><b>doctor name</b></td>
    <td><b>date</b></td>
    <td><b>hour</b></td>
    <td><b>MakeApp</b></td>


</tr>
<%
    }
    found=true;
%>

<tr>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getDate(2) %></td>
    <td><%=rs.getString(3) %></td>


    <form method="post" action="makeapp3.jsp">
        <td> <input name="id" type="submit" value="<%=rs.getInt(6) %>"></td> </form>

</tr>




<%
        }}
    if(!found) {

%>


<h3>THERE ARE NO AVAILABLE APPOINTMENTS </h3>


<%
    }
    conn.close();
    stmt.close();
    rs.close();


    } catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }


%>
</table>


<form method=post action=makeapp1.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
