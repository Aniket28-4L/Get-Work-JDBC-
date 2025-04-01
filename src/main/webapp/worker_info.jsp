<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>getWork - Professionals</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #FF8514, #ffffff);
        }
    
        /* Header */
        .navbar-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 10px 0;
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
            background: #E8E6EC;
            padding: 8px 15px;
            border-radius: 20px;
            margin-right: -18%;
            width: 300px;
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

        .user-icon img {
            width: 30px;
            cursor: pointer;
        }

        /* Sorting Button */
        .sort-button {
            background: purple;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
            margin: 15px;
        }

        .sort-button img {
            width: 20px;
        }

        /* Grid Layout */
        .container {
            cursor: pointer;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }

        .card {
            background: white;
            width: 200px;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .card img {
            width: 80px;
            border-radius: 50%;
        }

        .card h3 {
            margin: 10px 0 5px;
            font-size: 18px;
        }

        .card p {
            color: gray;
            font-size: 14px;
            margin: 5px 0;
        }

        .rating {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        .rating img{
            height: 20px;
            width: 20px;
        }

        .rating span {
            font-size: 14px;
            font-weight: bold;
        }

        .badge {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 5px 8px;
            border-radius: 5px;
            color: white;
            font-size: 12px;
            font-weight: bold;
        }

        .available {
            background: green;
        }

        .unavailable {
            background: red;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 10px;
            }

            .nav-links {
                flex-direction: column;
                text-align: center;
            }

            .container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
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
                <span onclick="location.href='profile.jsp'" class="search-icon">🔍</span>
            </div>
            <span class="profile-icon" onclick="window.location.href='profile.jsp'">👤</span>
        </div>
    </div>

    <!-- Sort Button -->
    <button class="sort-button">
        <img src="https://img.icons8.com/ios-glyphs/30/ffffff/sorting-options.png" alt="Sort">
        Sort By
    </button>

    <!-- Grid Section -->
    <div class="container">
        <!-- Cards -->
        <div class="card" onclick="location.href='info.jsp'">
            <div class="badge available">A</div>
            <img src="images/boy.png" alt="Profile">
            <h3>Dr. Smit Dodiya</h3>
            <p>Physiotherapy</p>
            <div class="rating">
                <img src="https://img.icons8.com/emoji/30/000000/star-emoji.png" alt="Star">
                <span>4.5</span>
            </div>
        </div>
    
        <div class="card" onclick="location.href='info.jsp'">
            <div class="badge unavailable">UA</div>
            <img src="images/woman.png" alt="Profile">
            <h3>Dr. Smit Dodiya</h3>
            <p>Physiotherapy</p>
            <div class="rating">
                <img src="https://img.icons8.com/emoji/30/000000/star-emoji.png" alt="Star">
                <span>4.5</span>
            </div>
        </div>
    
        <div class="card" onclick="location.href='info.jsp'">
            <div class="badge available">A</div>
            <img src="images/boy.png" alt="Profile">
            <h3>Dr. Smit Dodiya</h3>
            <p>Physiotherapy</p>
            <div class="rating">
                <img src="https://img.icons8.com/emoji/30/000000/star-emoji.png" alt="Star">
                <span>4.5</span>
            </div>
        </div>
    
        <div class="card" onclick="location.href='info.jsp'">
            <div class="badge unavailable">UA</div>
            <img src="images/profile.png" alt="Profile">
            <h3>Dr. Smit Dodiya</h3>
            <p>Physiotherapy</p>
            <div class="rating">
                <img src="https://img.icons8.com/emoji/30/000000/star-emoji.png" alt="Star">
                <span>4.5</span>
            </div>
        </div>
    
        <div class="card" onclick="location.href='info.jsp'">
            <div class="badge unavailable">UA</div>
            <img src="images/woman.png" alt="Profile">
            <h3>Dr. Smit Dodiya</h3>
            <p>Physiotherapy</p>
            <div class="rating">
                <img src="https://img.icons8.com/emoji/30/000000/star-emoji.png" alt="Star">
                <span>4.5</span>
            </div>
        </div>
    </div>
    

</body>
</html>
