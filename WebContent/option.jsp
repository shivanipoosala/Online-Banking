<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Choose</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #87CEEB;
            color: white;
            text-align: center;
            padding-top: 50px;
        }
        h1 {
            font-size: 3em;
            font-weight: bold;
            margin-bottom: 20px;
        }
        h2 {
            margin-top: 30px;
        }
        .form-container {
            margin: 0 auto;
            max-width: 500px;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }
        .btn-custom {
            background-color: #0056b3;
            color: white;
            padding: 15px 30px;
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #003d82;
        }
    </style>
</head>
<body>

    <h1>WELCOME TO TEXAS e-BANKING</h1>
    <h2>Are you bank staff or a customer?</h2>

    <div class="form-container">
        <form action="corporate" method="get">
<h3>If you are Bank Staff ,Click here : <input type="submit" name="staff" value="Coporate SignUp/ Login" class="btn btn-custom"><br>
</form>
        <hr style="background-color: white;">

        <form action="customer" method="get">
            <h3>If you are a Customer, Click here:</h3>
            <input type="submit" name="customer" value="Customer e-Banking" class="btn btn-custom">
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
