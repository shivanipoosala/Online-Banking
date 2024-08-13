package com.atm;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Deposit extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String referer = request.getHeader("referer");

        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psUpdate = null;
        ResultSet rs = null;

        try {
            // Establishing a connection to the database
            con = ConnectionManager.jdbcConnection();

            if (referer != null && referer.contains("corporateweb.jsp")) {
                // Handle GET request from corporateweb.jsp
                int account = Integer.parseInt(request.getParameter("accno"));
                int amount = Integer.parseInt(request.getParameter("deposit"));

                // Update the balance without requiring a password
                String balanceQuery = "SELECT available FROM balance WHERE id = ?";
                psCheck = con.prepareStatement(balanceQuery);
                psCheck.setInt(1, account);
                rs = psCheck.executeQuery();

                if (rs.next()) {
                    int avail = rs.getInt("available");
                    avail += amount;

                    String updateQuery = "UPDATE balance SET available = ? WHERE id = ?";
                    psUpdate = con.prepareStatement(updateQuery);
                    psUpdate.setInt(1, avail);
                    psUpdate.setInt(2, account);
                    psUpdate.executeUpdate();

                    // Get the current timestamp after the balance has been updated
                    Timestamp t = new Timestamp(System.currentTimeMillis());

                    // Set attributes for the JSP page
                    request.setAttribute("account", account);
                    request.setAttribute("amount", amount);
                    request.setAttribute("timestamp", t);
                    request.setAttribute("availableBalance", avail);

                    // Forward to the deposit download JSP
                    request.getRequestDispatcher("depositdownload.jsp").forward(request, response);
                } else {
                    // If balance information is not found, display an error message
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Balance information not found.");
                }
            } else if (referer != null && referer.contains("customerweb.jsp")) {
                // Handle POST request from customerweb.jsp
                int account = Integer.parseInt(request.getParameter("accno"));
                int amount = Integer.parseInt(request.getParameter("deposit"));
                String password = request.getParameter("password");

                // Check if the account exists and password matches
                String checkQuery = "SELECT available FROM customer c JOIN balance b ON c.id = b.id WHERE c.id = ? AND c.password = ?";
                psCheck = con.prepareStatement(checkQuery);
                psCheck.setInt(1, account);
                psCheck.setString(2, password); // Assuming password is stored as plain text
                rs = psCheck.executeQuery();

                if (rs.next()) {
                    // Update the available balance by adding the deposit amount
                    int avail = rs.getInt("available");
                    avail += amount;

                    String updateQuery = "UPDATE balance SET available = ? WHERE id = ?";
                    psUpdate = con.prepareStatement(updateQuery);
                    psUpdate.setInt(1, avail);
                    psUpdate.setInt(2, account);
                    psUpdate.executeUpdate();

                    // Get the current timestamp after the balance has been updated
                    Timestamp t = new Timestamp(System.currentTimeMillis());

                    // Set attributes for the JSP page
                    request.setAttribute("account", account);
                    request.setAttribute("amount", amount);
                    request.setAttribute("timestamp", t);
                    request.setAttribute("availableBalance", avail);

                    // Forward to the deposit download JSP
                    request.getRequestDispatcher("depositdownload.jsp").forward(request, response);
                } else {
                    // If the account number or password is incorrect, display an error message
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid account number or password.");
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request origin.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
        } finally {
            // Close resources to avoid memory leaks
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (psCheck != null) psCheck.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (psUpdate != null) psUpdate.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
