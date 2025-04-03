
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>getWork - Home Services</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            /* align-items: center; */
        }
        body {
            background: linear-gradient(0deg, #FFFFFF 0%, #FF8514 100%);
        }
        /* Navbar Styling */
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
        .logo span {
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
        
        /* Content Section */
        .content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 90%;
            margin: 50px auto;
        }
        .left {
            width: 45%;
        }
        .left h1 {
            font-size: 4rem;
            font-weight: bold;
            color: black;
        }
        .left h1 span {
            color: white;
        }
        .left p {
            font-size: 2.5rem;
            color: black;
            margin-top: -10px;
        }
        .right {
            width: 60%;
            margin-right: 90px;
            display: flex;
            justify-content: flex-end;
        }
        .grid-container img {
            width: 100%;
            height: auto;
            border-radius: 7px;
            margin-left: 20%;
        }


        .container {
            display: flex;
            background: #fff;
            padding: 20px;
            width: 60%;
            margin: 0% 21% 5% 21%;
            /* align-items: center; */
            border-radius: 7px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .left3 {
            background: orange;
            padding: 30px;
            border-radius: 10px;
            /* width: 50%;
            height: 50%; */
        }
        .left3 h2 {
            color: white;
        }
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }
        .option {
            background: white;
            padding: 15px;
            text-align: center;
            border-radius: 7px;
            cursor: pointer;
        }
        .option img {
            width: 50px;
            height: 50px;
        }
        .right2 img {
            margin-left: 20px;
            /* width: 400px; */
            height: 420px;
            /* align-items: center; */
            border-radius: 7px;
        }




        .slider {
            position: relative;
            width: 100vw;
            overflow: hidden;
            border-radius: 0;
        }

        .slides {
            display: flex;
            width: 300vw; /* Adjust based on number of slides (5 images * 100vw each) */
            animation: slide 15s infinite ease-in-out;
        }

        .slide {
            width: 100vw;
            flex-shrink: 0;
            position: relative;
        }

        .slide img {
            width: 100vw;
            height: 100%;
            display: block;
        }

        @keyframes slide {
    0% { transform: translateX(0); }
    20% { transform: translateX(0); }
    25% { transform: translateX(-100vw); }
    45% { transform: translateX(-100vw); }
    50% { transform: translateX(-200vw); }
    70% { transform: translateX(-200vw); }
    100% { transform: translateX(0); } /* Loop back after the 3rd slide */
}


        .services {
            text-align: center;
            margin: 30px 0;
            color: purple;
            font-size: 28px;
        }

        .product-grid {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .product {
            width: 300px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product img {
        	height: 60%;
            width: 100%;
            border-radius: 10px;
            
        }

        .product h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .product p {
            font-size: 14px;
            color: gray;
        }

        .product button {
            background: #6a0dad;
            margin-top: 10px;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }

        .footer {
            /* background: white; */
            padding: 5%;
            padding-top: 15%;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            /* box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1); */
        }
        .footer-logo {
            text-align: center;

        }
        .footer-logo img {
            width: 100px;
            overflow: hidden;
        }
        .footer-section {
            max-width: 250px;
        }
        .footer-section h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .footer-section ul {
            list-style: none;
            padding: 0;
        }
        .footer-section ul li {
            margin: 5px 0;
        }
        .footer-section ul li a {
            text-decoration: none;
            color: black;
            font-size: 14px;
        }
        .social-links {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .social-links img {
            width: 30px;
            margin: 5px;
        }
        .app-links img {
            width: 120px;
            margin-top: 10px;
        }
        @media (max-width: 768px) {
            .footer {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .footer-section {
                margin-bottom: 20px;
            }
        }

        

        
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar-container">
        <div class="navbar">
            <div>
                <div class="logo">get<span>W</span><span>ork</span></div>
                <div class="location">📍 Rk, Tramba-Rajkot</div>
            </div>
            <div class="nav-links">
                <button onclick="window.location.href='worker_card.jsp'">Categories</button>
                <button onclick="window.location.href='footer.jsp'">Contact Us</button>
            </div>
            <div class="search-section">
                <input type="text" placeholder="Search services...">
                <span class="search-icon">🔍</span>
            </div>
            <span onclick="location.href='profile.jsp'" class="profile-icon">👤</span>
        </div>
    </div>
 <%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
// Initialize empty lists
List<String> homeImages = new ArrayList<>();
List<String> adImages = new ArrayList<>();

try {
    // Load database driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    // Establish connection
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/getWork", "root", "");
    
    // 1. Load ACTIVE home images (is_active=1)
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(
        "SELECT image_path FROM home_carousel " +
        "WHERE image_type='home' AND is_active=1 " +
        "ORDER BY display_order");
    
    while(rs.next()) {
        String path = rs.getString("image_path");
        if (path != null && !path.trim().isEmpty()) {
            path = path.startsWith("images/") ? path : "images/" + path;
            homeImages.add(path);
        }
    }
    
    // 2. Load ACTIVE ad images (is_active=1)
    rs = stmt.executeQuery(
        "SELECT image_path FROM home_carousel " +
        "WHERE image_type='ad' AND is_active=1 " +
        "ORDER BY display_order");
    
    while(rs.next()) {
        String path = rs.getString("image_path");
        if (path != null && !path.trim().isEmpty()) {
            path = path.startsWith("images/") ? path : "images/" + path;
            adImages.add(path);
        }
    }
    
    // Close resources
    rs.close();
    stmt.close();
    con.close();
    
} catch(Exception e) {
    e.printStackTrace();
    
    // Fallback images if database connection fails
    if (homeImages.isEmpty()) {
        homeImages.add("images/home.png");
        homeImages.add("images/phy.png");
        homeImages.add("images/phy_2.png");
    }
    if (adImages.isEmpty()) {
        adImages.add("images/ad1.png");
        adImages.add("images/ad2.png");
        adImages.add("images/ad3.png");
        adImages.add("images/ad4.png");
        adImages.add("images/ad5.png");
        adImages.add("images/1734687235149-cd2754.webp");
    }
}
%>

<!-- Your original container structure preserved exactly as you had it -->
<div class="content">
    <div class="left">
        <h1>Hello, <span>${userName}</span></h1>
        <p>Get your services at <br> your doorstep</p>
    </div>
    <div class="right">
        <div class="grid-container">
            <img src="<%= !homeImages.isEmpty() ? homeImages.get(0) : "images/home.png" %>" alt="Service Image">
        </div>
    </div>
</div>

<!-- Your original container exactly as you had it -->
<div class="container">
    <div class="left3">
        <h2>What are you looking for?</h2>
        <div class="grid">
            <div onclick="location.href='worker_info.jsp'" class="option">
                <img src="images/assisted-living.png" alt="Old Care">
                <p>Old Care</p>
            </div>
            <div onclick="location.href='worker_info.jsp'" class="option">
                <img src="images/broom.png" alt="House Cleaning">
                <p>House Cleaning</p>
            </div>
            <div onclick="location.href='worker_info.jsp'" class="option">
                <img src="images/cooking.png" alt="Cook">
                <p>Cook</p>
            </div>
            <div onclick="location.href='worker_info.jsp'" class="option">
                <img src="images/mother.png" alt="Baby Sitting">
                <p>Baby Sitting</p>
            </div>
            <div onclick="location.href='worker_info.jsp'" class="option">
                <img src="images/presentation.png" alt="Home Tuition">
                <p>Home Tuition</p>
            </div>
            <div onclick="location.href='worker_info.jsp'" class="option">
                <img src="images/physiotherapist.png" alt="Physiotherapist">
                <p>Physiotherapist</p>
            </div>
        </div>
    </div>
    <div class="right2">
        <img src="<%= homeImages.size() > 1 ? homeImages.get(1) : "images/phy_2.png" %>" alt="Healthcare Support">
    </div>
</div>

<!-- Rest of your original HTML remains exactly the same -->
<div class="slider">
    <div class="slides">
        <div class="slide">
            <img src="<%= adImages.get(0) %>" alt="Water Purifier">
        </div>
        <div class="slide">
            <img src="<%= adImages.get(1) %>" alt="Cleaning Service">
        </div>
        <div class="slide">
            <img src="<%= adImages.get(2) %>" alt="AC Service">
        </div>
    </div>
</div>

<!-- Service Product Section -->
<h2 class="services">Services Product</h2>

<div class="product-grid">
    <div class="product">
        <img src="<%= adImages.size() > 3 ? adImages.get(3) : "images/ad2.png" %>" alt="AC Service">
        <h3>Power Saver AC Service</h3>
        <p>Save on electricity bills</p>
        <button>Book Now</button>
    </div>
    <div class="product">
        <img src="<%= adImages.size() > 4 ? adImages.get(4) : "images/ad3.png" %>" alt="Home Painting">
        <h3>Home Painting</h3>
        <p>Walls painted to inspire spaces</p>
        <button>Book Now</button>
    </div>
    <div class="product">
        <img src="<%= adImages.size() > 5 ? adImages.get(5) : "images/ad5.png" %>" alt="Water Purifier">
        <h3>RO Water Purifiers</h3>
        <p>Sale live</p>
        <button>Buy Now</button>
    </div>
</div>
    <footer class="footer">
        <!-- Logo Section -->
        <div class="footer-logo">
            <img src="images\incon.png" alt="Company Logo">
            <h2 style="color: purple;">getWork</h2>
        </div>

        <!-- Company Section -->
        <div class="footer-section">
            <h3>Company</h3>
            <ul>
                <li><a href="#">About us</a></li>
                <li><a href="#">Terms & Conditions</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Anti-discrimination Policy</a></li>
                <li><a href="#">UC impact</a></li>
                <li><a href="#">Careers</a></li>
            </ul>
        </div>

        <!-- For Customers -->
        <div class="footer-section">
            <h3>For customers</h3>
            <ul>
                <li><a href="#">UC reviews</a></li>
                <li><a href="#">Categories near you</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>

        <!-- For Partners -->
        <div class="footer-section">
            <h3>For partners</h3>
            <ul>
                <li><a href="#">Register as a professional</a></li>
            </ul>
        </div>

        <!-- Social Links & App Downloads -->
        <div class="footer-section social-links">
            <h3>Social links</h3>
            <div>
                <a href="#"><img src="images\google.png" alt="Google"></a>
                <a href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png" alt="LinkedIn"></a>
            </div>
            <div class="app-links">
                <a href="#"><img src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" alt="App Store"></a>
                <a href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/256px-Google_Play_Store_badge_EN.svg.png" alt="Google Play"></a>
            </div>
        </div>
    </footer>

</body>
</html>