package com.atm;

import java.sql.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomerLogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");

        try {
            Connection con = ConnectionManager.jdbcConnection();
            
           
            String query = "SELECT * FROM customer WHERE firstname = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, username);
            
          
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                
              
                if (storedPassword.equals(password)) {
                    response.sendRedirect("customerweb.jsp");
                } else {
                    response.sendRedirect("customersignup.jsp");
                }
            } else {
              
                response.sendRedirect("customersignup.jsp");
            }

           
            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
