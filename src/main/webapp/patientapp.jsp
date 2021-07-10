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
<h2> Here are your appointments </h2>

<table align="center" cellpadding="5" cellspacing="5" border="1">



<%
        String usernam = (String) session.getAttribute("username");
        Integer patient_id = (Integer) session.getAttribute("patient_id");

        try{
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery( "SELECT appointment.id ,appointment.doctor_id, doctor.full_name, appointment.patient_id, patient.username, appointment.date, appointment.hours, doctor.specialty " +
                         "FROM appointment " +
                         "INNER JOIN patient on appointment.patient_id = patient.id " +
                         "RIGHT JOIN doctor on appointment.doctor_id=doctor.id");
                    //"INNER JOIN doctor on appointment.doctor_id=doctor.id");

            boolean found = false;

            while(rs.next()){
                if(rs.getInt(4)==patient_id ){
                  if (!found)   {

                        %>
    <tr>
        <br><br>
    </tr>
    <tr>
        <td><b>appointment id</b></td>
        <td><b>doctor id</b></td>
        <td><b>doctor full name</b></td>
        <td><b>doctor specialty</b></td>
        <td><b>patient id </b></td>
        <td><b>patient username </b></td>
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
        <td><%=rs.getString(8) %></td>
        <td><%=rs.getInt(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><%=rs.getDate(6) %></td>
        <td><%=rs.getString(7) %></td>

        <form method="post" action="DateServlet2">
            <td> <input name="id" type="submit" value="<%=rs.getInt(1) %>"></td> </form>

    </tr>




<%
    }}
    if(!found) {

           %>

    <h3>THERE ARE NO UPCOMING APPOINTMENTS </h3>



<%
    }}
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
