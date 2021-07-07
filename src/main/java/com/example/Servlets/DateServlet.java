package com.example.Servlets;
import Utils.BCrypt;

import java.io.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.sql.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.sql.DataSource;
import Utils.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.LocalDate;
import java.util.*;
import java.text.*;
import java.util.concurrent.TimeUnit;

@WebServlet(name = "DateServlet", value = "/DateServlet")

public class DateServlet extends HttpServlet{
    public DateServlet() throws SQLException {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session=request.getSession(false);
        String username =(String)session.getAttribute("username");

        System.out.println("username is: " + username);

        String app_id = request.getParameter("id");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date todaydate = new Date();
       // Date toddate = dateFormat.format(todaydate);


        try {

            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM appointment WHERE (id='"+app_id+"')");



            while (rs.next()){
                Date appdate = rs.getDate("date");

                long diffInMillies = Math.abs(appdate.getTime() - todaydate.getTime());
                long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

                if(diff<3){
                    out.println("<html><body><h2>Sorry you cant delete this  </h2>");
                    out.println("<form method=\"post\" action=\"doctorapp.jsp\">");
                    out.println("<button type=\"submit\">BACK</button>");
                    out.println("</form>");
                    out.println("</body></html>");

                }
                else {
                    response.sendRedirect("doctordelapp.jsp");
                    request.getSession().setAttribute("app_id",app_id);
                }



            }



        } catch (SQLException throwables){
            throwables.printStackTrace();
            response.getWriter().println("exception");
        }

    }
//jdbc:postgresql://localhost:5432/telikhergasia


}

