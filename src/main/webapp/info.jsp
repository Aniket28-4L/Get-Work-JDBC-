<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>getWork - Profile</title>
    <style>
         body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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
        .profile-container {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }
        .profile-card {
            background: white;
            padding: 50px;
            width: 60%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .profile-pic img {
            width: 120px; /* Set a smaller width */
            height: 120px; /* Set a smaller height */
            border-radius: 50%;
            display: block;
            /* margin: auto; */
        }
        .details p {
            margin: 5px 0;
        }
        .slider {
            width: 100%;
        }
        .sidebar {
            width: 25%;
        }
        .cart, .offer, .promise {
            background: white;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            text-align: center;
        }

        .promise-box{
            margin-bottom: 15%;
        }


        .book-now {
            position: relative;
            background: #ff8c00;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            display: flex;
            
            left: 40%;
            
            font-size: 16px;
            border-radius: 5px;
        }

        .cart-container {
            width: 350px;
            /* margin: auto; */
        }
        .cart-box {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .cart-header {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        .cart-item p {
            margin: 0;
        }
        .quantity {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .quantity button {
            background: #ff8c00;
            border: none;
            color: white;
            width: 25px;
            height: 25px;
            font-size: 18px;
            border-radius: 2px;
            cursor: pointer;
        }
        .cart-total {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }
        .view-cart {
            width: 94%;
            background: #0044cc;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            display: block;
            font-weight: bold;
        }
        .offer-box, .promise-box {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
            text-align: center;
        }
        .offer-box img, .promise-box img {
            width: 50px;
        }

        
    </style>
</head>
<body>
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

    <main class="profile-container">
        <section class="profile-card">
            <div class="profile-pic"><img src="images\profile.png"></div>
            <h1>Dr. Smit Dodiya</h1>
            <p class="specialty">Physiotherapy</p>
            <p class="rating">⭐ 4.5 (available)</p>
            <p class="experience"><strong>Experience:</strong> 9 Years</p>
            <div class="details">
                <p><strong>Languages:</strong> English, Hindi, Gujarati</p>
                <p><strong>Per Day Charge:</strong> INR 500</p>
                <p><strong>Duration Date Start:</strong> 15 DEC</p>
                <p><strong>Duration:</strong> 35 days</p>
                <label for="days">How Many Days:</label>
                <input type="range" id="days" class="slider" min="1" max="35" value="15">
                <p><strong>Total Amount:</strong> INR 7499</p>
            </div>
            <p class="info">Worker Info Exchange is a non-profit organization dedicated to helping workers access and gain insight from data collected from them at work.</p>
        </section>

        <div class="cart-container">
            <div class="cart-box">
                <div class="cart-header">Cart</div>
                <div class="cart-item">🛒 No items in your cart</div>
            </div>
        
            <div class="offer-box">
                <img src="images\8.png" alt="Special Offer">
                <p><strong>Get visitation free off</strong> <br> on orders above ₹200</p>
            </div>
        
            <div class="promise-box">
                <img src="images\9.png" alt="Verified">
                <p><strong>UC Promise</strong><br>✅ Verified Professionals <br>✅ Hassle-Free Booking <br>✅ Transparent Pricing</p>
            </div>
            <button onclick="location.href='payment.jsp'" class="book-now">Book Now</button>
        </div>

    </main>

        
</body>
</html>



