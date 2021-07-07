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
    <title>DOCTOR</title>
</head>
<body>
<div id="banner"><h1>This is doctor page for ${username}</h1></div>

<h2> Here are your appointments </h2>

<table align="center" cellpadding="5" cellspacing="5" border="1">

    <%
        String usernam = (String) session.getAttribute("username");
        Integer doctor_id = (Integer) session.getAttribute("doctor_id");
        try{
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT appointment.id ,appointment.doctor_id, doctor.username, appointment.patient_id, patient.full_name, appointment.date, appointment.hours " +
                    "FROM appointment " +
                    "INNER JOIN doctor on appointment.doctor_id = doctor.id "+
                    "RIGHT JOIN patient on appointment.patient_id = patient.id ");
                    //"INNER JOIN doctor on appointment.doctor_id=doctor.id");

            boolean found = false;

            while(rs.next()){
                if(rs.getInt(2)==doctor_id ){
                  if (!found)   {

                        %>
                   <tr>
                   <br><br>
                    </tr>
                  <tr>
                    <td><b>appointment id</b></td>
                    <td><b>doctor id</b></td>
                    <td><b>username</b></td>
                    <td><b>patient_id</b></td>
                    <td><b>patient full_name</b></td>
                    <td><b>date</b></td>
                    <td><b>hour</b></td>
                    <td><b>Delete</b></td>


                   </tr>
<%
    }
    found=true;
%>

    <tr>
        <td><%=rs.getInt(1) %></td>
        <td><%=rs.getInt(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getInt(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><%=rs.getDate(6) %></td>
        <td><%=rs.getString(7) %></td>

        <form method="post" action="DateServlet">
            <td> <input name="id" type="submit" value="<%=rs.getInt(1) %>"></td> </form>

    </tr>




    <%
            }}
            if(!found) {

                %>

                <h3>THERE ARE NO UPCOMING APPOINTMENTS </h3>


<%
            }
            conn.close();
            stmt.close();
            rs.close();
        } catch(Exception e){System.out.println(e); }
    %>
</table>

<br> <br>



<form method=post action=doctor.jsp>
    <button type=submit>BACK</button>
</form>
<form name ="logout" method="post" action="Logout">
    <button name="logout" type="submit" value="logout">LOGOUT</button>
</form>

</body>
</html>
