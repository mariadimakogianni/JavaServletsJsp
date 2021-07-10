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

@WebServlet(name = "PatientServlet", value = "/PatientServlet")

public class PatientServlet extends HttpServlet{
    public PatientServlet() throws SQLException {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("username : " + username);


        try {
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
            Statement stmt = conn.createStatement();
            PreparedStatement ps = conn.prepareStatement("SELECT password, id FROM patient WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            boolean found = false;
            while (rs.next() && !found) {
                String hashed = rs.getString("password");
                boolean hash_pass = BCrypt.checkpw(password, hashed);
                if(hash_pass){

                    Integer patient_id = rs.getInt("id");
                    System.out.println(patient_id);

                    found=true;
                    //response.getWriter().println("successfull logiiiin");

                    System.out.println("Succesfull login.");
                    request.getSession().setAttribute("username",username);//to session apothikeyte
                    request.getSession().setAttribute("patient_id",patient_id);

                    request.getRequestDispatcher("patient.jsp").forward(request, response);//to session paei
                    request.getRequestDispatcher("makeapp1.jsp").forward(request, response);//to session paei
                    request.getRequestDispatcher("makeapp2.jsp").forward(request, response);//to session paei
                    request.getRequestDispatcher("makeapp3.jsp").forward(request, response);//to session paei
                    request.getRequestDispatcher("patientapp.jsp").forward(request, response);//to session paei
                    request.getRequestDispatcher("patientdelapp.jsp").forward(request, response);//to session paei
                        response.sendRedirect("patient.jsp");
                    }




            }
            if(!found) {
                response.sendRedirect("start.jsp");
            }
            conn.close();
            stmt.close();
            rs.close();
        } catch (SQLException | ServletException throwables){
            throwables.printStackTrace();
            response.getWriter().println("exception");
        }

    }
//jdbc:postgresql://localhost:5432/telikhergasia


}
