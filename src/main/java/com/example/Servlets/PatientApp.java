package com.example.Servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name = "PatientApp", value = "/PatientApp")
public class PatientApp extends HttpServlet {
    public PatientApp() throws SQLException {
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            HttpSession session = request.getSession(false);
            String usernam = (String) session.getAttribute("username");
            out.print("Hello " + usernam);

            try {
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT patient.username , appointment.patient_id,appointment.doctor_id, appointment.date, doctor.full_name, doctor.specialty " +
                         "FROM appointment " +
                         "INNER JOIN patient on appointment.patient_id = patient.id " +
                         "RIGHT JOIN doctor on appointment.doctor_id=doctor.id");
                        //, appointment.patient_id,appointment.doctor_id, appointment.date



                boolean found = false;

                out.println("<html><body><h2>YOUR APPOINTMENTS : </h2>");


                while (rs.next()) {
                    if(rs.getString(1).equals(usernam) ){
                        if(!found){
                            out.println("<hr></br><table cellspacing='0' cellpadding='5' border='1'>");
                            out.println("<tr>");
                            out.println("<td><b>id</b></td>");
                            out.println("<td><b>username</b></td>");
                            out.println("<td><b>doctorid</b></td>");
                            out.println("<td><b>doctor full name</b></td>");
                            out.println("<td><b>specialty</b></td>");
                            out.println("<td><b>date</b></td>");
                            out.println("</tr>");
                        }

                        found = true;
                        Integer id = rs.getInt(2);
                        String username = rs.getString(1);
                        Integer doctorid = rs.getInt(3);
                        String date = rs.getString(4);
                        String fullname = rs.getString(5);
                        String specialty = rs.getString(6);

                        out.println("<tr>");
                        out.print("<td> "+ id+ "</td>");
                        out.print("<td> "+ username+ "</td>");
                        out.print("<td> "+ doctorid+ "</td>");
                        out.print("<td> "+ fullname+ "</td>");
                        out.print("<td> "+ specialty+ "</td>");
                        out.print("<td> "+ date+ "</td>");
                        out.println("</tr>");

                        out.println("</br>");

                }}
                out.println("</table></hr>");

                if(found==false) {
                    out.println("<h3>THERE ARE NO UPCOMING APPOINTMENTS </h3>");

                }
                out.println("</br>");
                out.println("<form method=\"post\" action=\"patient.jsp\">");
                out.println("<button type=\"submit\">BACK</button>");
                out.println("</form>");
                out.println("</body></html>");

                conn.close();
                stmt.close();
                rs.close();


            }
            catch (SQLException throwables){
                throwables.printStackTrace();
                response.getWriter().println(throwables.getMessage());}

            out.close();



        } catch (Exception e) {
            System.out.println(e);
        }


    }
}
