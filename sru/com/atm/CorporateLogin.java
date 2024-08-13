package com.atm;

import java.sql.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CorporateLogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        try {
            // Establish database connection
            Connection con = ConnectionManager.jdbcConnection();

            // Use PreparedStatement to prevent SQL injection
            String query = "SELECT * FROM corporate WHERE first_name = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, uname);

            // Execute the query
            ResultSet rs = pst.executeQuery();

            // Check if any matching record is found
            boolean userFound = false;
            if (rs.next()) {
                String storedPassword = rs.getString("password");

                if (storedPassword.equals(pass)) {
                    userFound = true;
                }
            }
            // Redirect based on login success
            if (userFound) {
                response.sendRedirect("corporateweb.jsp");
            } else {
                response.sendRedirect("corporatesignup.jsp");
            }

            // Close resources
            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
