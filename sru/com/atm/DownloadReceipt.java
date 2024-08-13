package com.atm;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class DownloadReceipt extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String amount = request.getParameter("amount");
        String time = request.getParameter("time");
        String avail = request.getParameter("avail");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment;filename=withdrawal_receipt.pdf");

        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Add a title
            document.add(new Paragraph("Withdrawal Receipt"));
            document.add(new Paragraph(" ")); // Blank space for formatting

            // Create a table with two columns
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);

            // Add cells to the table
            table.addCell("Account Number:");
            table.addCell(account);

            table.addCell("Amount Withdrawn:");
            table.addCell(amount);

            table.addCell("Transaction Date/Time:");
            table.addCell(time);

            table.addCell("Available Balance:");
            table.addCell(avail);

            // Add table to the document
            document.add(table);

            document.add(new Paragraph(" "));
            document.add(new Paragraph("Thank you for using Texas e-Banking."));

        } catch (DocumentException e) {
            throw new IOException("Error generating PDF", e);
        } finally {
            document.close();
        }
    }
}
