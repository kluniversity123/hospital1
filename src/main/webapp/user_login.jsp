<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User-Login - Online Medical System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f9ff;
        }

        header {
            background-color: #2c3e50;
            padding: 10px 0;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        .logo img {
            height: 65px;
            width: auto;
            display: block;
        }

        nav {
        	display: flex;
        	justify-content: space-between;
        	align-items: center;
    	}

    	nav a {
        	text-decoration: none;
        	color: #333333;
        	margin: 0 15px;
        	font-weight: bold;
    	}

    	nav .auth-buttons a {
        	color: #ffffff;
        	background-color: #007BFF;
        	padding: 8px 15px;
        	border-radius: 5px;
        	font-size: 14px;
    	}

    	nav .auth-buttons a.sign-in {
        	background-color: #555555;
        	margin-left: 10px;
    	}

        .dropbtn {
        	background-color: #555555;
        	color: white;
        	padding: 8px 15px;
        	border-radius: 5px;
        	font-size: 14px;
        	font-weight: bold;
        	text-decoration: none;
        	border: none;
    	}

    	.dropdown {
        	position: relative;
        	display: inline-block;
    	}

    	.dropdown-content {
        	display: none;
        	position: absolute;
        	background-color: #555555;
        	min-width: 150px;
        	margin-left: -35px;
        	border-radius: 5px;
        	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        	z-index: 1;
    	}

    	.dropdown-content a {
        	color: black;
        	padding: 12px 16px;
        	text-decoration: none;
        	display: block;
        	font-size: 14px;
        	font-weight: bold;
    	}

    	.dropdown-content a:hover {
        	background-color: none;
    	}

    	.dropdown:hover .dropdown-content {
        	display: block;
    	}

    	.dropdown:hover .dropbtn {
        	background-color: none;
    	}

        .login-container {
            width: 900px;
            background-color: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            display: flex;
            border-radius: 15px;
            overflow: hidden;
            margin: 50px auto;
        }

        .left-section {
            background-color: #2c3e50;
            color: white;
            padding: 40px;
            width: 45%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .left-section img {
            width: 170px;
            margin-bottom: -20px;
        }

        .left-section h2 {
            font-size: 32px;
            margin-bottom: 20px;
            text-align: center;
        }

        .left-section p {
            font-size: 16px;
            line-height: 1.5;
            text-align: center;
        }

        .right-section {
            padding: 40px;
            width: 55%;
            background-color: #fff;
        }

        .right-section h3 {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #007BFF;
            outline: none;
        }

        .btn-primary {
            width: 100%;
            background-color: #007BFF;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
        }

        .footer-text a {
            color: #007BFF;
            text-decoration: none;
        }

        .message {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }

        .text-success {
            color: #28a745;
        }

        .text-danger {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                    <img src="images/logo.png" alt="Online Medical System Logo">
                </div>
                
                <div class="auth-buttons">
                    <div class="dropdown">
                        <button class="dropbtn"><i class="fas fa-user"></i> Login</button>
                        <div class="dropdown-content"><br>
                            <a href="admin_login.jsp"><i class="fas fa-user-shield"></i> Admin</a><br>
                            <a href="doctor_login.jsp"><i class="fas fa-user-md"></i> Doctor</a><br>
                            <a href="user_login.jsp"><i class="fas fa-user"></i> User</a><br>
                        </div>
                    </div>
                    <a href="signup.jsp"><i class="fas fa-user-plus"></i> Sign-Up</a>
                </div>
            </nav>
        </div>
    </header>

    <div class="login-container">
        <div class="left-section">
            <img src="images/userlogin.webp" alt="Login">
            <h2>Online Medical System</h2>
            <p>Your Virtual Health Partner, Bringing HealthCare Closer to You</p>
        </div>

        <div class="right-section">
            <h3>User Login</h3>

            <c:if test="${not empty errorMsg}">
                <p class="message text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <form action="userLogin" method="post">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input required name="email" type="email" id="email">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input required name="password" type="password" id="password">
                </div>

                <button type="submit" class="btn-primary">Log In</button>
            </form>

            <div class="footer-text">
                Don't have an account? <a href="signup.jsp">Sign Up</a>
            </div>
        </div>
    </div>
</body>
</html>
