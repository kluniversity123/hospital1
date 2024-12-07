<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
            overflow-y: auto;
        }
        .logo img {
            height: 75px;
            width: auto;
            margin-left: -25px;
            margin-bottom: 30px;
        }
        .sidebar h4 {
            margin: 20px 0; 
            margin-top: -35px;
            text-align: center; 
            width: 100%; 
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            width: 100%;
        }
        .sidebar ul li {
            border-top: 1px solid #34495e;
            border-bottom: 1px solid #34495e;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }
        .sidebar ul li a i {
            margin-right: 15px;
        }
        
        .sidebar ul li a span {
            flex: 1;
            text-align: left;
        }
        .sidebar ul li a:hover {
            background-color: #34495e;
            color: white;
        }

        .container {
            margin-left: 270px; 
            width: calc(100% - 270px); 
            padding: 20px;
        }

        .form-container {
            width: 100%;
            max-width: 450px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-container h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
            position: relative;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            text-align: left;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            padding-left: 40px;
            font-size: 14px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #007BFF;
            outline: none;
        }

        .form-group i {
            position: absolute;
            left: 10px;
            top: 70%;
            transform: translateY(-50%);
            color: #007BFF;
            font-size: 18px;
        }

        .btn {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            
        }

        .btn:hover {
            background-color: #218838;
        }

        .message {
            text-align: center;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .message.text-success {
            color: #28a745;
        }

        .message.text-danger {
            color: #dc3545;
        }

    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <h4>User Dashboard</h4>
        <ul>
            <li><a href="index1.jsp"><i class="fa fa-tachometer-alt"></i><span>Home</span></a></li>
            <li><a href="change_password.jsp"><i class="fa fa-key"></i><span>Change Password</span></a></li>
            <li><a href="user_appointment.jsp"><i class="fa fa-calendar-check"></i><span>Book Appointment</span></a></li>
            <li><a href="view_appointment.jsp"><i class="fa fa-eye"></i><span>View Appointment</span></a></li>
            <li><a href="user_login.jsp"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
        </ul>
    </div>
	<div class="container">
        <div class="form-container">
            <h3>Change Password</h3>

            <c:if test="${not empty succMsg}">
                <p class="message text-success">${succMsg}</p>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <c:if test="${not empty errorMsg}">
                <p class="message text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <form action="userChangePassword" method="post">
                <div class="form-group">
                    <label for="currentPassword">Current Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="password" name="currentPassword" required class="form-control" placeholder="Enter your Current Password">
                </div>

                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <i class="fa fa-key"></i>
                    <input type="password" name="newPassword" required class="form-control" placeholder="Enter your New Password">
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <i class="fa fa-check"></i>
                    <input type="password" name="confirmPassword" required class="form-control" placeholder="Confirm your New Password">
                </div>

                <button type="submit" class="btn">Change Password</button>
            </form>
        </div>
    </div>
</body>
</html>
