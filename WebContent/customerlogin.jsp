<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for eye icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #87CEEB;
            color: white;
        }
        .container {
            max-width: 400px;
            margin-top: 50px;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
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
        .forgot-password {
            display: block;
            text-align: center;
            margin-top: 10px;
        }
        hr {
            border-top: 1px solid white;
        }
        .password-wrapper {
            position: relative;
        }
        .input-group-append {
            cursor: pointer;
        }
        .input-group-text {
            background: transparent;
            border: none;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Texas e-Banking</h1>
        <h2>Customer Login</h2>
        <hr>
        <form action="customerlogin" method="get">
            <div class="form-group">
                <label for="username">Enter Username:</label>
                <input type="text" class="form-control" id="username" name="uname" placeholder="Username" required>
            </div>
            <div class="form-group">
                <label for="password">Enter Password:</label>
                <input type="password" class="form-control" id="password" name="pass" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <a href="forgotcustomerpass.jsp" class="forgot-password">Forgot Password?</a>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
