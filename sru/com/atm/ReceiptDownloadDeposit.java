package com.atm;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class ReceiptDownloadDeposit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"deposit_receipt.pdf\"");

        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Retrieve data from request
            String account = request.getParameter("account");
            String amount = request.getParameter("amount");
            String timestamp = request.getParameter("timestamp");
            String avail = request.getParameter("avail");

            // Add content to PDF
            document.add(new Paragraph("Deposit Receipt"));
            document.add(new Paragraph("Account Number: " + account));
            document.add(new Paragraph("Amount Deposited: " + amount));
            document.add(new Paragraph("Date / Time: " + timestamp));
            document.add(new Paragraph("Available Balance: " + avail));

            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
            throw new ServletException("Error creating PDF document", e);
        }
    }
}
