<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f8f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            display: flex;
            background: #fff;
            padding: 20px;
            width: 62%;
            border-radius: 7px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .left {
            background: orange;
            padding: 20px;
            border-radius: 10px;
        }
        .left h2 {
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
        .right img {
            margin-left: 20px;
            /* width: 400px; */
            height: 530px;
            /* align-items: center; */
            border-radius: 7px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left">
            <h2>What are you looking for?</h2>
            <div class="grid">
                <div class="option">
                    <img src="images\assisted-living.png" alt="Old Care">
                    <p>Old Care</p>
                </div>
                <div class="option">
                    <img src="images\broom.png" alt="House Cleaning">
                    <p>House Cleaning</p>
                </div>
                <div class="option">
                    <img src="images\cooking.png" alt="Cook">
                    <p>Cook</p>
                </div>
                <div class="option">
                    <img src="images\mother.png" alt="Baby Sitting">
                    <p>Baby Sitting</p>
                </div>
                <div class="option">
                    <img src="images\presentation.png" alt="Home Tuition">
                    <p>Home Tuition</p>
                </div>
                <div class="option">
                    <img src="images\physiotherapist.png" alt="Physiotherapist">
                    <p>Physiotherapist</p>
                </div>
            </div>
        </div>
        <div class="right">
            <img src="images\phy_2.png" alt="Healthcare Support">
        </div>
    </div>
</body>
</html>
