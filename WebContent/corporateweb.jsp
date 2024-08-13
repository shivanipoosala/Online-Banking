<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corporate Controls</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #87CEEB;
            color: white;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            position: relative;
        }
        h1, h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border: none;
        }
        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            box-shadow: none;
            border: 1px solid #4CAF50;
        }
        .btn-primary {
            background-color: #4CAF50;
            border-color: #4CAF50;
        }
        .btn-primary:hover {
            background-color: #45a049;
        }
        .btn-logout {
            background-color: #dc3545;
            border-color: #dc3545;
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 5px 10px;
        }
        .btn-logout:hover {
            background-color: #c82333;
        }
        hr {
            border-top: 1px solid white;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Logout Button -->
        <form action="option.jsp" method="get">
            <button type="submit" class="btn btn-logout">Logout</button>
        </form>
        <h1>-- TEXAS e-BANKING --</h1>
        <br>
        <h2>Corporate Control Page</h2>
        <hr>
        <h2>General Information of Customer</h2>
        <form action="accinfo" method="get">
            <div class="form-group">
                <label for="accno">Enter customer's Account Number:</label>
                <input type="number" class="form-control" id="accno" name="accno" placeholder="Account Number" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Click here to know your general account information</button>
        </form>
        <hr>
        <h2>Available Bank Balance</h2>
        <form action="available" method="get">
            <div class="form-group">
                <label for="accno-balance">Enter customer's Account Number:</label>
                <input type="number" class="form-control" id="accno-balance" name="accno" placeholder="Account Number" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Click here to know your available bank balance</button>
        </form>
        <hr>
        <h2>Deposit Balance</h2>
        <form action="deposit" method="get">
            <div class="form-group">
                <label for="accno-deposit">Enter customer's Account Number:</label>
                <input type="number" class="form-control" id="accno-deposit" name="accno" placeholder="Account Number" required>
            </div>
            <div class="form-group">
                <label for="deposit">Enter amount to deposit:</label>
                <input type="number" class="form-control" id="deposit" name="deposit" placeholder="Deposit" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Click here to deposit balance to the specified A/C Number</button>
        </form>
        <hr>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
