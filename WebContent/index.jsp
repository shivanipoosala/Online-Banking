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
            background-color: powderblue;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            max-width: 400px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        .form-control {
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,.075);
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }
        .btn-primary {
            width: 100%;
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004080;
        }
        .forgot-password {
            margin-top: 10px;
            text-align: center;
        }
        .forgot-password button {
            background-color: transparent;
            border: none;
            color: #007bff;
            cursor: pointer;
            font-size: 16px;
        }
        .forgot-password button:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>e-Banking</h1>
        <form action="login" method="post">
            <div class="form-group">
                <label for="uname">Enter your username:</label>
                <input type="text" class="form-control" id="uname" name="uname" placeholder="Username" required>
            </div>
            <div class="form-group">
                <label for="pass">Enter your password:</label>
                <input type="password" class="form-control" id="pass" name="pass" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <div class="forgot-password">
            <button onclick="myFunction()">Forgot Password?</button>
        </div>
    </div>
    
    <script>
        function myFunction() {
            alert("You are admin, You can't say that!!");
        }
    </script>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
