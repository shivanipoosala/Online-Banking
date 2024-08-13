package com.atm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomerSignup extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        int bankid = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("pass");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");

        Connection con = null;
        PreparedStatement psCustomer = null;
        PreparedStatement psBalance = null;

        try {
            con = ConnectionManager.jdbcConnection();

            String customerQuery = "INSERT INTO customer (firstname, lastname, address, id, email, password, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";
            psCustomer = con.prepareStatement(customerQuery);
            psCustomer.setString(1, name);
            psCustomer.setString(2, lastname);
            psCustomer.setString(3, address);
            psCustomer.setInt(4, bankid);
            psCustomer.setString(5, email);
            psCustomer.setString(6, password);
            psCustomer.setString(7, gender);
            psCustomer.executeUpdate();

            String balanceQuery = "INSERT INTO balance (id, available) VALUES (?, ?)";
            psBalance = con.prepareStatement(balanceQuery);
            psBalance.setInt(1, bankid);
            psBalance.setInt(2, 0);  
            psBalance.executeUpdate();
            response.sendRedirect("customerlogin.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (psCustomer != null) psCustomer.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (psBalance != null) psBalance.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
