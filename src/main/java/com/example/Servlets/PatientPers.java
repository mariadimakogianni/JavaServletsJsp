package com.example.Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name = "PatientPers", value = "/PatientPers")
public class PatientPers extends HttpServlet {
    public PatientPers() throws SQLException {
    }


        public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            HttpSession session=request.getSession(false);
            String usernam =(String)session.getAttribute("username");
            out.print("Hello "+usernam);

            try {
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM patient WHERE (username='"+usernam+"')");

                boolean found = false;
                while (rs.next() && !found) {

                    if(rs.getString(2).equals(usernam)){
                            found=true;
                        String fullname = rs.getString(3);
                        String amka = rs.getString(4);
                        String password = rs.getString(5);

                        out.println("<html><body><h2>YOUR PERSONAL DETAILS ARE : </h2>");
                        out.println("<hr></br><table cellspacing='0' cellpadding='5' border='1'>");
                        out.println("<tr>");
                        out.println("<td><b>username</b></td>");
                        out.println("<td><b>fullname</b></td>");
                        out.println("<td><b>amka</b></td>");
                        out.println("<td><b>password</b></td>");
                        out.println("</tr>");

                        out.print("<td> "+ usernam+ "</td>");
                        out.print("<td> "+ fullname+ "</td>");
                        out.print("<td> "+ amka+ "</td>");
                        out.print("<td> "+ password+ "</td>");

                        out.println("</table></br><hr>");

                    }

                }
                if(found==false) {
                    response.sendRedirect("start.jsp");
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
                response.getWriter().println("exception");}

            out.close();

        }catch(Exception e){System.out.println(e);}
    }

    /*public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        doGet(request, response);
        String username = request.getParameter("username");
        response.getWriter().println(username);}*/

}



