<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews</title>
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
        .container-wrapper h3{
            
            margin-bottom: 20px;
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
        }
        .content-wrapper {
            padding: 20px;
        }
        .reviews-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
        }
        .review-card {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .review-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 10px;
        }
        .review-header img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        .review-header h5 {
            margin: 0;
            font-size: 16px;
            font-weight: bold;
        }
        .review-header span {
            font-size: 12px;
            color: gray;
        }
        .review-text {
            font-size: 14px;
            color: #333;
        }
        .review-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 10px;
        }
        .star-rating {
            color: gold;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <h2 style="color: #ff7f00; margin: 0;">get<span style="color: black;">Work</span></h2>
        <h2 style="margin: 0;">Admin Panel - Reviews</h2>
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
            <div class="content-wrapper">
                <h3>Customer Reviews</h3>
                <div class="reviews-container">
                    <!-- Review 1 -->
                    <div class="review-card">
                        <div class="review-header">
                            <img src="images/review.png" alt="User">
                            <div>
                                <h5>Jons Sena</h5>
                                <span>2 days ago</span>
                            </div>
                        </div>
                        <p class="review-text">"Excellent service! The professionalism and attention to detail were outstanding. Highly recommended!"</p>
                        <div class="review-footer">
                            <div class="star-rating">⭐ ⭐ ⭐ ⭐ ⭐</div>
                            <span>4.5</span>
                        </div>
                    </div>
                    <!-- Review 2 -->
                    <div class="review-card">
                        <div class="review-header">
                            <img src="images/review.png" alt="User">
                            <div>
                                <h5>Sofia</h5>
                                <span>2 days ago</span>
                            </div>
                        </div>
                        <p class="review-text">"Great experience! The service was prompt, and the quality exceeded my expectations."</p>
                        <div class="review-footer">
                            <div class="star-rating">⭐ ⭐ ⭐ ⭐</div>
                            <span>4.0</span>
                        </div>
                    </div>
                    <!-- Review 3 -->
                    <div class="review-card">
                        <div class="review-header">
                            <img src="images/review.png" alt="User">
                            <div>
                                <h5>Anandreansyah</h5>
                                <span>2 days ago</span>
                            </div>
                        </div>
                        <p class="review-text">"Reliable and efficient! I appreciate the professionalism and dedication of the team."</p>
                        <div class="review-footer">
                            <div class="star-rating">⭐ ⭐ ⭐ ⭐ ⭐</div>
                            <span>4.5</span>
                        </div>
                    </div>
                    <!-- Review 4 -->
                    <div class="review-card">
                        <div class="review-header">
                            <img src="images/review.png" alt="User">
                            <div>
                                <h5>Jons Sena</h5>
                                <span>2 days ago</span>
                            </div>
                        </div>
                        <p class="review-text">"Outstanding customer support and seamless service. Will definitely use again!"</p>
                        <div class="review-footer">
                            <div class="star-rating">⭐ ⭐ ⭐ ⭐ ⭐</div>
                            <span>4.5</span>
                        </div>
                    </div>
                    <!-- Review 5 -->
                    <div class="review-card">
                        <div class="review-header">
                            <img src="images/review.png" alt="User">
                            <div>
                                <h5>Sofia</h5>
                                <span>2 days ago</span>
                            </div>
                        </div>
                        <p class="review-text">"Very satisfied with the service. The process was smooth and efficient."</p>
                        <div class="review-footer">
                            <div class="star-rating">⭐ ⭐ ⭐ ⭐</div>
                            <span>4.0</span>
                        </div>
                    </div>
                    <!-- Review 6 -->
                    <div class="review-card">
                        <div class="review-header">
                            <img src="images/review.png" alt="User">
                            <div>
                                <h5>Anandreansyah</h5>
                                <span>2 days ago</span>
                            </div>
                        </div>
                        <p class="review-text">"Great experience overall. The team was courteous and highly skilled."</p>
                        <div class="review-footer">
                            <div class="star-rating">⭐ ⭐ ⭐ ⭐ ⭐</div>
                            <span>4.5</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
