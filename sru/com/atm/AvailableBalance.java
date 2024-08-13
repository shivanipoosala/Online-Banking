package com.atm;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AvailableBalance extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String referer = request.getHeader("referer");
        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psBalance = null;
        ResultSet rs = null;

        try {
            // Establishing a connection to the database
            con = ConnectionManager.jdbcConnection();

            if (referer != null && referer.contains("corporateweb.jsp")) {
                // Handle GET request from corporateweb.jsp
                int account = Integer.parseInt(request.getParameter("accno"));

                // Fetch available balance without password
                String balanceQuery = "SELECT available FROM balance WHERE id = ?";
                psBalance = con.prepareStatement(balanceQuery);
                psBalance.setInt(1, account);
                rs = psBalance.executeQuery();

                if (rs.next()) {
                    int avail = rs.getInt("available");
                    Timestamp t = new Timestamp(System.currentTimeMillis());

                    // Set attributes for the JSP page
                    request.setAttribute("account", account);
                    request.setAttribute("availableBalance", avail);
                    request.setAttribute("timestamp", t);

                    // Forward to JSP page for displaying the balance
                    request.getRequestDispatcher("balance.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Balance information not found.");
                    request.getRequestDispatcher("balance.jsp").forward(request, response);
                }
            } else if (referer != null && referer.contains("customerweb.jsp")) {
                // Handle POST request from customerweb.jsp
                int account = Integer.parseInt(request.getParameter("accno"));
                String password = request.getParameter("password");

                // Check if the account exists and password matches
                String checkQuery = "SELECT * FROM customer WHERE id = ? AND password = ?";
                psCheck = con.prepareStatement(checkQuery);
                psCheck.setInt(1, account);
                psCheck.setString(2, password);
                rs = psCheck.executeQuery();

                if (rs.next()) {
                    // Fetch available balance
                    String balanceQuery = "SELECT available FROM balance WHERE id = ?";
                    psBalance = con.prepareStatement(balanceQuery);
                    psBalance.setInt(1, account);
                    ResultSet rsBalance = psBalance.executeQuery();

                    if (rsBalance.next()) {
                        int avail = rsBalance.getInt("available");
                        Timestamp t = new Timestamp(System.currentTimeMillis());

                        // Set attributes for the JSP page
                        request.setAttribute("account", account);
                        request.setAttribute("availableBalance", avail);
                        request.setAttribute("timestamp", t);

                        // Forward to JSP page for displaying the balance
                        request.getRequestDispatcher("balance.jsp").forward(request, response);
                    } else {
                        request.setAttribute("error", "Balance information not found.");
                        request.getRequestDispatcher("balance.jsp").forward(request, response);
                    }

                    // Close balance result set
                    rsBalance.close();
                } else {
                    request.setAttribute("error", "Invalid account number or password.");
                    request.getRequestDispatcher("balance.jsp").forward(request, response);
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request origin.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("balance.jsp").forward(request, response);
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (psCheck != null) psCheck.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (psBalance != null) psBalance.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
