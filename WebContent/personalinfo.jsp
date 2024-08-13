<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Personal Information</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            padding-top: 50px;
        }
        .info-container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }
        .info-header {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: #0056b3;
            text-align: center;
        }
        .info-details {
            text-align: left;
            margin-bottom: 30px;
        }
        .btn-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }
        .btn-download, .btn-logout {
            padding: 10px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            width: 100%;
            margin-bottom: 10px;
            display: block;
            text-align: center;
            color: white;
        }
        .btn-download {
            background-color: #28a745;
        }
        .btn-download:hover {
            background-color: #218838;
        }
        .btn-logout {
            background-color: #dc3545;
        }
        .btn-logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="info-container">
    <div class="info-header">-- Personal Information --</div>
    <div class="info-details">
        <p><strong>Account Number:</strong> <%= request.getAttribute("account") %></p>
        <p><strong>Name:</strong> <%= request.getAttribute("name") %></p>
        <p><strong>Address:</strong> <%= request.getAttribute("address") %></p>
        <p><strong>Gender:</strong> <%= request.getAttribute("gender") %></p>
        <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
    </div>
    <div class="btn-container">
        <form action="PersonalInformation" method="post">
            <input type="hidden" name="account" value="<%= request.getAttribute("account") %>">
            <input type="hidden" name="name" value="<%= request.getAttribute("name") %>">
            <input type="hidden" name="address" value="<%= request.getAttribute("address") %>">
            <input type="hidden" name="gender" value="<%= request.getAttribute("gender") %>">
            <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
            <input type="hidden" name="action" value="download">
            <button type="submit" class="btn-download">Download PDF</button>
        </form>
        <form action="option.jsp" method="get">
            <button type="submit" class="btn-logout">Logout</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
