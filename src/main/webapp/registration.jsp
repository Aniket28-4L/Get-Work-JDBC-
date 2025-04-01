<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(0deg, #FFFFFF 0%, #FF8514 100%);
        }

        .signup-container {
            background: white;
            padding: 60px; /* More padding for a bigger layout */
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
            width: 600px; /* Wider container */
            text-align: left;
        }

        h2 {
            font-size: 36px; /* Bigger heading */
            font-weight: bold;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            font-size: 20px;
            margin-bottom: 30px;
        }

        input {
            width: 100%;
            padding: 18px; /* Larger inputs */
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 18px;
        }

        input::placeholder {
            color: #aaa;
        }

        .terms {
            display: flex;
            align-items: center;
            font-size: 18px;
            color: #666;
            margin: 25px 0;
        }

        .terms input {
            width: auto;
            margin-right: 12px;
            transform: scale(1.3);
        }

        .btn {
            width: 100%;
            padding: 18px;
            background: #FF8514;
            border: none;
            color: white;
            font-size: 20px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #e67310;
        }

        .login {
            margin-top: 25px;
            font-size: 18px;
            text-align: center;
        }

        .login a {
            color: #FF8514;
            font-weight: bold;
            text-decoration: none;
        }

        .login a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Signup</h2>
        <p>to get started</p>
        <form action="RegisterServlet" method="POST">
    <input type="text" name="username" placeholder="Username" required>
    <input type="email" name="email" placeholder="Enter your Gmail" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
    
    <div class="terms">
        <input type="radio" required>
        <label>Agree to our Terms and Conditions</label>
    </div>

    <button type="submit" class="btn">Continue</button>
</form>
        <div class="login">
            Already registered? <a href="login.jsp">Login</a>
        </div>
    </div>
</body>
</html>
