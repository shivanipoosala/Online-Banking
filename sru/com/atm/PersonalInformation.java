package com.atm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PersonalInformation extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String referer = request.getHeader("referer");
        String action = request.getParameter("action");

        if (action != null && action.equals("download")) {
            generatePdf(request, response);
        } else {
            // Handle normal request and forward to JSP
            processPersonalInfoRequest(request, response, referer);
        }
    }

    private void processPersonalInfoRequest(HttpServletRequest request, HttpServletResponse response, String referer) throws ServletException, IOException {
        if (referer != null && referer.contains("corporateweb.jsp")) {
            int account = Integer.parseInt(request.getParameter("accno"));

            try {
                String query = "SELECT * FROM customer WHERE id = ?";
                Connection con = ConnectionManager.jdbcConnection();
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, account);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    request.setAttribute("account", rs.getInt("id"));
                    request.setAttribute("name", rs.getString("firstname") + " " + rs.getString("lastname"));
                    request.setAttribute("address", rs.getString("address"));
                    request.setAttribute("gender", rs.getString("gender"));
                    request.setAttribute("email", rs.getString("email"));
                    request.getRequestDispatcher("personalinfo.jsp").forward(request, response);
                } else {
                    response.sendRedirect("corporateweb.jsp");
                }

                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (referer != null && referer.contains("customerweb.jsp")) {
            int account = Integer.parseInt(request.getParameter("accno"));
            String password = request.getParameter("password");

            try {
                String query = "SELECT * FROM customer WHERE id = ? AND password = ?";
                Connection con = ConnectionManager.jdbcConnection();
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, account);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    request.setAttribute("account", rs.getInt("id"));
                    request.setAttribute("name", rs.getString("firstname") + " " + rs.getString("lastname"));
                    request.setAttribute("address", rs.getString("address"));
                    request.setAttribute("gender", rs.getString("gender"));
                    request.setAttribute("email", rs.getString("email"));
                    request.getRequestDispatcher("personalinfo.jsp").forward(request, response);
                } else {
                    response.sendRedirect("customerweb.jsp");
                }

                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request origin.");
        }
    }

    private void generatePdf(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"personal_info.pdf\"");

        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Retrieve data from request
            String account = request.getParameter("account");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");

            // Add content to PDF
            document.add(new Paragraph("-- Personal Information --"));
            document.add(new Paragraph("Account Number: " + account));
            document.add(new Paragraph("Name: " + name));
            document.add(new Paragraph("Address: " + address));
            document.add(new Paragraph("Gender: " + gender));
            document.add(new Paragraph("Email: " + email));

            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}
