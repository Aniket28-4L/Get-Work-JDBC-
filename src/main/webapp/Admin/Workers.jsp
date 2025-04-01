<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .top-bar {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            border-bottom: 2px solid black;
            height: 50px;
            position: fixed;
            top: 0;
            width: 100%;
            left: 0;
            z-index: 1000;
        }
        .container-wrapper {
            display: flex;
            margin-top: 50px;
        }
        .sidebar {
            width: 160px;
            height: calc(100vh - 50px);
            background-color: #1a1a1a;
            color: white;
            position: fixed;
            top: 50px;
            left: 0;
            overflow-y: auto;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin: 5px 10px;
            border-radius: 5px;
            transition: background 0.3s;
            font-size: 15px;
            font-weight: bold;
        }
        .sidebar a:hover {
            background: #ff7f00;
        }
        .main-content {
            margin-left: 160px;
            width: calc(100% - 160px);
            padding: 20px;
        }
        /* Worker Cards */
        .worker-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .worker-card {
            display: flex;
            align-items: center;
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .worker-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }
        .worker-details {
            flex-grow: 1;
        }
        .designation {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        .rating {
            display: flex;
            align-items: center;
        }
        .star-icon {
            width: 16px;
            height: 16px;
            margin-right: 5px;
        }
        .available {
            color: blue;
            text-decoration: none;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <h2 style="color: #ff7f00; margin: 0;">get<span style="color: black;">Work</span></h2>
        <h2 style="margin: 0;">Workers</h2>
        <button class="btn btn-primary">Home</button>
    </div>
    
    <div class="container-wrapper">
        <div class="sidebar">
            <a href="AdminHome.jsp">Dashboard</a>
            <a href="Carousel.jsp">Carousel</a>
            <a href="Reviews.jsp">Reviews</a>
            <a href="Workers.jsp">Workers</a>
        </div>

        <div class="main-content">
            <h3 style="margin-bottom: 20px;">Workers Page</h3>
            <p>Configure your application Workers here.</p>

            <div class="worker-list">
                <!-- Worker Card 1 -->
                <div class="worker-card">
                    <img src="images/doctor.jpg" alt="Worker Image" class="worker-img">
                    <div class="worker-details">
                        <h4>Dr. Smit Dodiya</h4>
                        <p class="designation">Consultant - Physiotherapy</p>
                        <p class="rating">
                            <img src="images/star.png" alt="Star Icon" class="star-icon">
                            <span>4.5 <a href="#" class="available"> (available) </a></span>
                        </p>
                        <p>Experience: 9 Years</p>
                        <p>Languages: English, Hindi, Gujarati</p>
                    </div>
                    <div class="action-buttons">
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Remove</button>
                    </div>
                </div>

                <!-- Worker Card 2 -->
                <div class="worker-card">
                    <img src="images/man.jpg" alt="Worker Image" class="worker-img">
                    <div class="worker-details">
                        <h4>Dr. Smit Dodiya</h4>
                        <p class="designation">Consultant - Physiotherapy</p>
                        <p class="rating">
                            <img src="images/star.png" alt="Star Icon" class="star-icon">
                            <span>4.5 <a href="#" class="available"> (available) </a></span>
                        </p>
                        <p>Experience: 9 Years</p>
                        <p>Languages: English, Hindi, Gujarati</p>
                    </div>
                    <div class="action-buttons">
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Remove</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
