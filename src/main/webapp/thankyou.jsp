<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #fff;
            background: linear-gradient(0deg, #FFFFFF 0%, #FF8514 100%);
        }
        .navbar-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 12px 0;
        }
        .navbar {
            width: 100%;
            max-width: 1200px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: white;
            padding: 12px 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }
        .logo {
            cursor: pointer;
            /* display: flex; */
            flex-direction: column;
            font-size: 1.8rem;
            font-weight: bold;
            color: #4C2885;
        }
        .logo span {
            color: #FF8514;
        }
        .logo spana {
            color: #4C2885;
        }
        .location {
            font-size: 0.8rem;
            color: black;
            margin-top: -3px;
            margin-left: 10px;
        }
        .nav-links {
            display: flex;
            gap: 30px;
            /* margin-left: -30%; */
        }
        .nav-links button {
            background: none;
            border: none;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            color: black;
            transition: color 0.3s ease;
        }
        .nav-links button:hover {
            color: #FF8514;
        }
        .search-section {
            display: flex;
            align-items: center;
            /* background: #E8E6EC; */
            padding: 8px 15px;
            border-radius: 5px;
            margin-right: -18%;
            border: 1px solid #ccc;
            width: 300px;
            /* outline: none; */
        }
        .search-section input {
            border: none;
            background: none;
            outline: none;
            font-size: 1rem;
            flex: 1;
        }
        .search-icon {
            font-size: 1rem;
            color: black;
        }
        .profile-icon {
            font-size: 1.8rem;
            cursor: pointer;
            border: 2px solid black;
            border-radius: 50%;
            padding: 5px;
        }
        .profile-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 1px solid #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
        }
        .thank-you-container {
            text-align: center;
            background: #fde9d8;
            padding: 50px 20px;
            border-radius: 0 0 30px 30px;
            margin: 20px;
        }
        .thank-you-container h1 {
            font-size: 28px;
            font-weight: bold;
            margin-top: 10px;
        }
        .thank-you-logo {
            width: 100px;
            margin-bottom: 10px;
        }
        .payment-icon {
            width: 120px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="navbar-container">
        <div class="navbar">
            <div>
                <div onclick="location.href='home.jsp'"  class="logo">get<span>W</span><spana>ork</spana></div>
                <div class="location">📍 Rk, Tramba-Rajkot</div>
            </div>
            <div class="nav-links">
                <button>Categories</button>
                <button>Contact Us</button>
            </div>
            <div class="search-section">
                <input type="text" placeholder="Search services...">
                <span class="search-icon">🔍</span>
            </div>
            <span onclick="location.href='profile.jsp'" class="profile-icon">👤</span>
        </div>
    </div>

<div class="thank-you-container">
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="thank-you-logo" alt="Thank You Logo">
    <h1>Thank you for trusting Us</h1>
    <img src="images\mobile-payment.png" class="payment-icon" alt="Payment Successful">
</div>

</body>
</html>
