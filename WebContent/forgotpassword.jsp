<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-bottom: 30px;
        }
        .btn-custom {
            width: 100%;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .signup-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Reset Your Password</h2>
    <form action="forgotpassword" method="post">
        <div class="form-group">
            <label for="id">Account ID:</label>
            <input type="text" class="form-control" id="id" name="id" required>
        </div>

        <div class="form-group">
            <label for="firstname">First Name:</label>
            <input type="text" class="form-control" id="firstname" name="firstname" required>
        </div>

        <div class="form-group">
            <label for="post">Post:</label>
            <input type="text" class="form-control" id="post" name="post" required>
        </div>

        <div class="form-group">
            <label for="password">New Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <button type="submit" class="btn btn-primary btn-custom">Reset Password</button>

        <a href="corporatelogin.jsp" class="btn btn-link signup-btn">Back to Corporate Login</a>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.11/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        // Get the status parameter from the URL
        const urlParams = new URLSearchParams(window.location.search);
        const status = urlParams.get('status');

        // Display appropriate alert based on the status parameter
        if (status === 'success') {
            alert('Password updated successfully.');
        } else if (status === 'failure') {
            alert('No record found. Please check your Account ID, First Name, and Post.');
        }
    });
</script>

</body>
</html>