package com.atm;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

public class Withdraw extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int account = Integer.parseInt(request.getParameter("accno"));
        String password = request.getParameter("password"); // Retrieve the password from request
        int amount = Integer.parseInt(request.getParameter("withdraw"));

        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psBalance = null;
        PreparedStatement psUpdate = null;
        ResultSet rs = null;

        try {
            // Establishing a connection to the database
            con = ConnectionManager.jdbcConnection();

            // Check if the account exists and password matches
            String checkQuery = "SELECT * FROM customer WHERE id = ? AND password = ?";
            psCheck = con.prepareStatement(checkQuery);
            psCheck.setInt(1, account);
            psCheck.setString(2, password); // Assuming password is stored as plain text
            rs = psCheck.executeQuery();

            if (rs.next()) {
                // If the account and password are valid, get the balance
                String balanceQuery = "SELECT * FROM balance WHERE id = ?";
                psBalance = con.prepareStatement(balanceQuery);
                psBalance.setInt(1, account);
                ResultSet rsBalance = psBalance.executeQuery();

                if (rsBalance.next()) {
                    int avail = rsBalance.getInt("available");
                    int withdraw = rsBalance.getInt("withdraw");
                    Timestamp t = rsBalance.getTimestamp("time");

                    // Check if sufficient funds are available
                    if (amount <= avail) {
                        withdraw += amount;
                        avail -= amount; // Deduct the amount from available balance

                        // Update the balance and withdrawal details
                        String updateBalanceQuery = "UPDATE balance SET available = ?, withdraw = ? WHERE id = ?";
                        psUpdate = con.prepareStatement(updateBalanceQuery);
                        psUpdate.setInt(1, avail);
                        psUpdate.setInt(2, withdraw);
                        psUpdate.setInt(3, account);
                        psUpdate.executeUpdate();

                        // Set attributes to be forwarded to JSP
                        request.setAttribute("account", account);
                        request.setAttribute("amount", amount);
                        request.setAttribute("time", t);
                        request.setAttribute("avail", avail);

                        // Forward the request to withdrawdownload.jsp
                        RequestDispatcher dispatcher = request.getRequestDispatcher("withdrawdownload.jsp");
                        dispatcher.forward(request, response);

                    } else {
                        // If insufficient funds, display an error message
                        response.sendRedirect("error.jsp?message=Your requirement exceeds your bank balance.");
                    }

                    rsBalance.close();
                } else {
                    response.sendRedirect("error.jsp?message=Balance information not found.");
                }
            } else {
                response.sendRedirect("error.jsp?message=Invalid account number or password.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid account number or withdraw amount.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred.");
        } finally {
            // Close resources to avoid memory leaks
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (psCheck != null) psCheck.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (psBalance != null) psBalance.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (psUpdate != null) psUpdate.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
