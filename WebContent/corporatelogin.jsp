<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #87CEEB;
        }
        .alert-custom {
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            position: relative;
            margin-bottom: 20px;
        }
        .alert-custom .closebtn {
            position: absolute;
            top: 0;
            right: 10px;
            color: white;
            font-size: 24px;
            cursor: pointer;
        }
        .alert-custom .closebtn:hover {
            color: black;
        }
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="alert alert-custom">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>Congratulations!</strong> You have successfully created your account.
        </div>
        <div class="login-container">
            <h2 class="text-center">Corporate Login</h2>
            <hr>
            <form action="corporatelog" method="get">
                <div class="form-group">
                    <label for="username">Enter username:</label>
                    <input type="text" class="form-control" id="username" name="uname" required>
                </div>
                <div class="form-group">
                    <label for="password">Enter password:</label>
                    <input type="password" class="form-control" id="password" name="pass" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
            <br>
            <a href="forgotpassword.jsp" class="btn btn-link">Forgot Password?</a>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
