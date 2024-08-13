package com.atm;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String firstName = request.getParameter("firstname");
        String post = request.getParameter("post");
        String newPassword = request.getParameter("password");

        try {
            Connection conn = ConnectionManager.jdbcConnection();
            String selectQuery = "SELECT * FROM corporate WHERE id = ? AND first_name = ? AND post = ?";
            PreparedStatement pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1, Integer.parseInt(id));
            pstmt.setString(2, firstName);
            pstmt.setString(3, post);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String updateQuery = "UPDATE corporate SET password = ? WHERE id = ?";
                PreparedStatement updatePstmt = conn.prepareStatement(updateQuery);
                updatePstmt.setString(1, newPassword);
                updatePstmt.setInt(2, Integer.parseInt(id));

                int rowsAffected = updatePstmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.getWriter().println("<script>alert('Password updated successfully.'); window.location.href='corporatelogin.jsp';</script>");
                } else {
                    response.getWriter().println("<script>alert('Failed to update password. Please try again.'); window.history.back();</script>");
                }

                updatePstmt.close();
            } else {
                response.getWriter().println("<script>alert('No record found. Please check your details and try again.'); window.history.back();</script>");
            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('An error occurred. Please try again later.'); window.history.back();</script>");
        }
    }
}
