<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deposit Receipt</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            padding-top: 50px;
        }
        .receipt-container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }
        .receipt-header {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: #0056b3;
            text-align: center;
        }
        .receipt-details {
            text-align: left;
            margin-bottom: 30px;
        }
        .btn-container {
            display: flex;
            flex-direction: column;
            gap: 10px; /* Adds space between the buttons */
        }
        .btn-download, .btn-logout {
            padding: 10px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            width: 100%; /* Ensures buttons fill container width */
            text-align: center;
        }
        .btn-download {
            background-color: #28a745;
            color: white;
        }
        .btn-download:hover {
            background-color: #218838;
        }
        .btn-logout {
            background-color: #dc3545;
            color: white;
        }
        .btn-logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="receipt-container">
    <div class="receipt-header">-- Deposit Receipt --</div>
    <div class="receipt-details">
        <p><strong>Account Number:</strong> <%= request.getAttribute("account") %></p>
        <p><strong>Amount Deposited:</strong> <%= request.getAttribute("amount") %></p>
        <p><strong>Date / Time:</strong> <%= request.getAttribute("timestamp") %></p>
        <p><strong>Available Balance:</strong> <%= request.getAttribute("availableBalance") %></p>
    </div>
    <div class="btn-container">
        <form action="ReceiptDownloadDeposit" method="post">
            <input type="hidden" name="account" value="<%= request.getAttribute("account") %>">
            <input type="hidden" name="amount" value="<%= request.getAttribute("amount") %>">
            <input type="hidden" name="timestamp" value="<%= request.getAttribute("timestamp") %>">
            <input type="hidden" name="avail" value="<%= request.getAttribute("availableBalance") %>">
            <button type="submit" class="btn-download">Download Receipt</button>
        </form>
        <a href="option.jsp" class="btn-logout">Logout</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
