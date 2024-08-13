package com.atm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotcustomerservlet")
public class ForgotCustomerPassServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String accountNo = request.getParameter("accountNo");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            conn = ConnectionManager.jdbcConnection();

            // Validate user details
            String query = "SELECT * FROM customer WHERE firstname = ? AND id = ? AND email = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, firstName);
            pstmt.setString(2, accountNo);
            pstmt.setString(3, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Update password
                String updateQuery = "UPDATE customer SET password = ? WHERE firstname = ? AND id = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, firstName);
                pstmt.setString(3, accountNo);
                int rowsUpdated = pstmt.executeUpdate();

                if (rowsUpdated > 0) {
                    // Password updated successfully
                    response.sendRedirect("forgotcustomerpass.jsp?status=success");
                } else {
                    // Failed to update password
                    response.sendRedirect("forgotcustomerpass.jsp?status=error");
                }
            } else {
                // Details are incorrect
                response.sendRedirect("forgotcustomerpass.jsp?status=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("forgotcustomerpass.jsp?status=error");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
