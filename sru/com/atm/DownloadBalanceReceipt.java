package com.atm;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;

public class DownloadBalanceReceipt extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int account = Integer.parseInt(request.getParameter("account"));
        int availableBalance = Integer.parseInt(request.getParameter("availableBalance"));
        String timestamp = request.getParameter("timestamp");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"balance_receipt.pdf\"");

        try {
            OutputStream out = response.getOutputStream();
            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();
            document.add(new Paragraph("Bank Balance Receipt"));
            document.add(new Paragraph("Account Number: " + account));
            document.add(new Paragraph("Available Balance: " + availableBalance));
            document.add(new Paragraph("Date / Time: " + timestamp));
            document.add(new Paragraph("Thanks for using our banking services."));
            document.close();

        } catch (DocumentException e) {
            throw new IOException(e.getMessage());
        }
    }
}
