<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        }
        .content-wrapper {
            padding: 20px;
        }
        .card {
            display: flex;
            flex-direction: row;
            align-items: center;
            padding: 20px;
            transition: box-shadow 0.3s;
            justify-content: flex-start;
            gap: 15px;
        }
        .card img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .card:hover {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .chart-container {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }
        .chart-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 48%;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }
        .chart-box img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <h2 style="color: #ff7f00; margin: 0;">get<span style="color: black;">Work</span></h2>
        <h2 style="margin: 0;">Admin Panel</h2>
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
                <div class="container mt-4">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="card p-3">
                                <img src="images/user.png" alt="Users">
                                <div>
                                    <h4>746</h4>
                                    <p>Total Users</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card p-3">
                                <img src="images/worker.png" alt="Workers">
                                <div>
                                    <h4>357</h4>
                                    <p>Total Workers</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card p-3">
                                <img src="images/cancel.png" alt="Canceled">
                                <div>
                                    <h4>65</h4>
                                    <p>Total Canceled</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card p-3">
                                <img src="images/revenue.png" alt="Revenue">
                                <div>
                                    <h4>$128</h4>
                                    <p>Total Revenue</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chart-container mt-5">
                        <div class="chart-box">
                            <img src="images/graph.png" alt="Graph">
                            <h4>Workers</h4>
                            <canvas id="workersChart"></canvas>
                        </div>
                        <div class="chart-box">
                            <img src="images/graph.png" alt="Graph">
                            <h4>Users</h4>
                            <canvas id="usersChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
    <script>
        var ctx1 = document.getElementById('workersChart').getContext('2d');
        var workersChart = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ['Old Care', 'House Cleaning', 'Cook', 'Baby Sitting', 'Home Tuition', 'Physiotherapist'],
                datasets: [{
                    label: 'Workers',
                    data: [50, 70, 30, 60, 55, 20],
                    backgroundColor: 'orange'
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: { ticks: { font: { size: 12 } } },
                    y: { beginAtZero: true }
                }
            }
        });
        
        var ctx2 = document.getElementById('usersChart').getContext('2d');
        var usersChart = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['Old Care', 'House Cleaning', 'Cook', 'Baby Sitting', 'Home Tuition', 'Physiotherapist'],
                datasets: [{
                    label: 'Users',
                    data: [80, 60, 25, 40, 55, 30],
                    backgroundColor: 'red'
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: { ticks: { font: { size: 12 } } },
                    y: { beginAtZero: true }
                }
            }
        });
    </script>
</body>
</html>
