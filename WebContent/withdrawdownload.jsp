<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdrawal Receipt</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            color: #343a40;
            text-align: center;
            font-family: 'Arial', sans-serif;
            padding-top: 50px;
        }
        .receipt-container {
            margin: 0 auto;
            max-width: 600px;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }
        .receipt-header {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: #0056b3;
        }
        .receipt-details {
            text-align: left;
            margin-bottom: 30px;
        }
        .btn-download, .btn-logout {
            margin: 15px;
            font-size: 1.1em;
            border-radius: 5px;
        }
        .btn-download {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
        }
        .btn-download:hover {
            background-color: #218838;
        }
        .btn-logout {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
        }
        .btn-logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <div class="receipt-container">
        <div class="receipt-header">-- Withdrawal Receipt --</div>
        <div class="receipt-details">
            <p><strong>Account Number:</strong> ${account}</p>
            <p><strong>Amount Withdrawn:</strong> ${amount}</p>
            <p><strong>Transaction Date/Time:</strong> ${time}</p>
            <p><strong>Available Balance:</strong> ${avail}</p>
        </div>
        <form action="downloadReceipt" method="post">
            <input type="hidden" name="account" value="${account}">
            <input type="hidden" name="amount" value="${amount}">
            <input type="hidden" name="time" value="${time}">
            <input type="hidden" name="avail" value="${avail}">
            <button type="submit" class="btn btn-download">Download Receipt</button>
        </form>
        <br>
        <form action="option.jsp" method="get">
            <button type="submit" class="btn btn-logout">Logout</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
