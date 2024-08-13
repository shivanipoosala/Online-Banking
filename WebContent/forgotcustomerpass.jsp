<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
            max-width: 600px;
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
        .btn-secondary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-secondary:hover {
            background-color: #0056b3;
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
        <h1>Forgot Password</h1>
        <hr>
        <form action="forgotcustomerservlet" method="post">
            <div class="form-group">
                <label for="firstname">Enter First Name:</label>
                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name" required>
            </div>
            <div class="form-group">
                <label for="accountNo">Enter Account Number:</label>
                <input type="text" class="form-control" id="accountNo" name="accountNo" placeholder="Account Number" required>
            </div>
            <div class="form-group">
                <label for="email">Enter Your Email:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="form-group password-wrapper">
                <label for="newPassword">Enter New Password:</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required>
                    <div class="input-group-append">
                        <span class="input-group-text" id="show-password" onclick="togglePassword()">
                            <i id="password-icon" class="fa fa-eye"></i>
                        </span>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Update Password</button>
        </form>
        <br>
        <div>
            <% 
                String status = request.getParameter("status");
                if ("success".equals(status)) {
                    out.println("<div class='alert alert-success'>Password updated successfully!</div>");
                } else if ("error".equals(status)) {
                    out.println("<div class='alert alert-danger'>An error occurred. Please try again.</div>");
                } else if ("invalid".equals(status)) {
                    out.println("<div class='alert alert-warning'>Invalid details provided. Please check and try again.</div>");
                }
            %>
        </div>
        <br>
        <a href="customerlogin.jsp" class="btn btn-secondary btn-block">Login</a>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById('newPassword');
            var passwordIcon = document.getElementById('password-icon');
            
            if (passwordField.type === "password") {
                passwordField.type = "text";
                passwordIcon.className = "fa fa-eye-slash";
            } else {
                passwordField.type = "password";
                passwordIcon.className = "fa fa-eye";
            }
        }
    </script>
</body>
</html>
