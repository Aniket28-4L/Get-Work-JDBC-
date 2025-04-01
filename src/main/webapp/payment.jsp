<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
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
        .payment-container {
            text-align: center;
            background: #fde9d8;
            padding: 50px 20px;
            border-radius: 0 0 30px 30px;
            margin: 20px;
        }
        .payment-container h1 {
            font-size: 28px;
            font-weight: bold;
        }
        .total-amount {
            font-size: 18px;
            margin: 15px 0;
        }
        .amount-box {
            display: inline-block;
            background: #ff8c00;
            color: white;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
        }
        .payment-methods {
            cursor: pointer;
            display: flex;
            justify-content: center;
            gap: 40px;
            margin-top: 30px;
        }
        .method {
            text-align: center;
        }
        .method img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: white;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .method p {
            font-size: 16px;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>

  <!-- Navbar -->
  <div class="navbar-container">
    <div class="navbar">
        <div>
            <div onclick="location.href='home.jsp'"  class="logo">get<span>W</span><span>ork</span></div>
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

<div class="payment-container">
    <h1>Make Your Payment here</h1>
    <p class="total-amount">Total Amount you have to pay :</p>
    <div class="amount-box">INR 7499</div>

    <p class="total-amount">Choose your payment method</p>
    
    <div class="payment-methods">
        <div class="method" onclick="location.href='thankyou.jsp'">
            <img src="images\credit.png" alt="Card">
            <p>Card</p>
        </div>
        <div class="method" onclick="location.href='thankyou.jsp'">
            <img src="images\cashless-payment.png" alt="UPI">
            <p>UPI</p>
        </div>
        <div class="method" onclick="location.href='thankyou.jsp'">
            <img src="images\payment-method.png" alt="Cash">
            <p>Cash</p>
        </div>
    </div>
</div>

</body>
</html>
