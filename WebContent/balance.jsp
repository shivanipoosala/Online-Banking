<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Balance Information</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #0056b3;
            color: white;
            padding: 10px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #003d82;
        }
        .btn-download {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            width: 100%;
        }
        .btn-download:hover {
            background-color: #218838;
        }
        .btn-logout {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            width: 100%;
        }
        .btn-logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="text-center">Bank Balance Information</h1>
    <hr>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <div class="alert alert-danger" role="alert">
            <%= error %>
        </div>
    <% } else { %>
        <p><strong>Account Number:</strong> <%= request.getAttribute("account") %></p>
        <p><strong>Available Balance:</strong> <%= request.getAttribute("availableBalance") %></p>
        <p><strong>Date / Time:</strong> <%= request.getAttribute("timestamp") %></p>
        <a href="downloadBalanceReceipt?account=<%= request.getAttribute("account") %>&availableBalance=<%= request.getAttribute("availableBalance") %>&timestamp=<%= request.getAttribute("timestamp") %>" class="btn btn-download">Download as PDF</a>
    <% } %>
    <hr>
    <a href="option.jsp" class="btn btn-logout">Logout</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
