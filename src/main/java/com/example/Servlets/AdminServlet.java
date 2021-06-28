package com.example.Servlets;
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

@WebServlet(name = "AdminServlet", value = "/AdminServlet")

public class AdminServlet extends HttpServlet{
    public AdminServlet() throws SQLException {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("username is: " + username);


        try {
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/telikhergasia", "postgres", "1234");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM admin");

            boolean found = false;
            while (rs.next() && found==false) {

                if(rs.getString(2).equals(username)){
                    if( rs.getString(4).equals(password)){

                        found=true;

                        System.out.println("Succesfull login.");
                        request.getSession().setAttribute("username",username);//to session apothikeyte
                        request.getRequestDispatcher("admin.jsp").forward(request, response);//to session paei


                        response.sendRedirect("admin.jsp");
                    }


                }

            }
            if(found==false) {
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
