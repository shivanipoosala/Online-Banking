<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
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
            max-width: 500px;
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
        .form-check-label {
            margin-right: 10px;
        }
        .input-group-text {
            background: transparent;
            border: none;
            color: white;
            cursor: pointer;
        }
        .text-danger {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>WELCOME TO TEXAS e-BANKING</h1>
        <br>
        <h2>Corporate Login</h2>
        <form action="corporatelogin" method="get">
            <div class="form-group">
                <label for="username">Enter username:</label>
                <input type="text" class="form-control" id="username" name="uname" placeholder="Username" required>
            </div>
            <div class="form-group">
                <label for="password">Enter password:</label>
                <input type="password" class="form-control" id="password" name="pass" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
        <br>
        <a href="forgotpassword.jsp" class="btn btn-link">Forgot Password?</a>
        <br>
        <hr>
        <br>
        <h2>Corporate SignUp</h2>
        <form action="corporatesignup" method="get" onsubmit="return validatePassword()">
            <div class="form-group">
                <label for="firstname">Enter First name:</label>
                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name" required>
            </div>
            <div class="form-group">
                <label for="lastname">Enter Last name:</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name" required>
            </div>
            <div class="form-group">
                <label for="post">Enter your Post:</label>
                <input type="text" class="form-control" id="post" name="post" placeholder="Post" required>
            </div>
            <div class="form-group">
                <label for="id">Enter the BankID:</label>
                <input type="number" class="form-control" id="id" name="id" placeholder="Bank ID" required>
            </div>
            <div class="form-group">
                <label for="password-signup">Create password:</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="password-signup" name="pass" placeholder="Password" required>
                    <div class="input-group-append">
                        <span class="input-group-text" id="show-password" onclick="togglePassword()">
                            <i id="password-icon" class="fa fa-eye"></i>
                        </span>
                    </div>
                </div>
                <small id="password-error" class="text-danger"></small>
            </div>
            <div class="form-group">
                <label>Enter gender:</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="genderMale" value="Male" checked>
                    <label class="form-check-label" for="genderMale">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="Female">
                    <label class="form-check-label" for="genderFemale">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="genderOther" value="Other">
                    <label class="form-check-label" for="genderOther">Other</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">SignUp</button>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function validatePassword() {
            var password = document.getElementById('password-signup').value;
            var passwordError = document.getElementById('password-error');
            var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=]).{5,10}$/;

            if (!passwordPattern.test(password)) {
                passwordError.textContent = 'Password must be 5-10 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.';
                return false;
            } else {
                passwordError.textContent = '';
                return true;
            }
        }

        function togglePassword() {
            var passwordField = document.getElementById('password-signup');
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
