<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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

        .login-container {
            background: white;
            padding: 40px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: left;
        }

        h2 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        p {
            color: #666;
            font-size: 18px;
            margin-bottom: 25px;
        }

        input {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 18px;
        }

        input::placeholder {
            color: #aaa;
        }

        .forgot-password {
            text-align: left;
            font-size: 16px;
            color: #666;
            margin-bottom: 25px;
            cursor: pointer;
        }

        .forgot-password:hover {
            color: #FF8514;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background: #FF8514;
            border: none;
            color: white;
            font-size: 18px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #e67310;
        }

        .register {
            margin-top: 20px;
            font-size: 16px;
            text-align: center;
        }

        .register a {
            color: #FF8514;
            font-weight: bold;
            text-decoration: none;
        }

        .register a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <p>to get started</p>
        
        <!-- Corrected Form -->
        <form action="LoginServlet" method="post">
           <input type="email" name="Gmail" placeholder="Enter your Gmail" required>
			<input type="password" name="Password" placeholder="Password" required>

            <div class="forgot-password">Forgot Password?</div>
            <button type="submit" class="btn">Continue</button>
        </form>

        <div class="register">
            New User? <a href="registration.jsp">Register</a>
        </div>
    </div>
</body>
</html>
