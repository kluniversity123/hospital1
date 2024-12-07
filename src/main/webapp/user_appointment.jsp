<%@page import="com.org.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.org.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        .sidebar ul li a span {
            flex: 1;
            text-align: left;
        }
        .sidebar ul li a:hover {
            background-color: #34495e;
            color: white;
        }
        .sidebar ul li a i {
            margin-right: 15px;
        }
        
        header {
            background-color: #ffffff;
            padding: 10px 0;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .container {
            width: 70%;
            margin: 0 auto;
        }

        .auth-buttons a {
            color: #ffffff;
            background-color: #007BFF;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            margin-left: 10px;
        }

        .auth-buttons a.sign-in {
            background-color: #555555;
        }

        .paint-card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 20px;
            background-color: #ffffff;
            margin-top: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: -45px;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .form-control {
            border-radius: 5px;
        }

        .form-control::placeholder {
            color: #888888;
        }

        .row.g-3 {
            margin-bottom: 25px;
        }

        .card-body {
            position: relative;
        }

        .form-control,
        select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
        }

        .img-fluid {
            border-radius: 10px;
        }

        .main-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 5px;
            margin-bottom: 10px;
        }

        .image-section {
            width: 50%;
        }

        .form-section {
            width: 45%;
        }

        .image-section img {
            width: 100%;
            height: auto;
            border-radius: 10px;
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
        <div class="main-content">
            <div class="image-section">
                <img src="images/appointment.png" alt="Hospital Image">
            </div>

            <div class="form-section">
                <div class="card paint-card">
                    <div class="card-body">
                        <h3 class="text-center" style="color:red">User Appointment</h3>
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <p class="fs-4 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>
                        <form class="row g-3" action="appAppointment" method="post">

                            <input type="hidden" name="userid" value="${userObj.id }">

                            <div class="col-md-6">
                                <label for="fullname" class="form-label">Full Name</label>
                                <input id="fullname" type="text" class="form-control" name="fullname" placeholder="Enter your full name" required>
                            </div>

                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender</label>
                                <select id="gender" class="form-control" name="gender" required>
                                    <option value="">-- Select --</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="age" class="form-label">Age</label>
                                <input id="age" type="number" class="form-control" name="age" placeholder="Enter your age" required>
                            </div>

                            <div class="col-md-6">
                                <label for="appoint_date" class="form-label">Appointment Date</label>
                                <input id="appoint_date" type="date" class="form-control" name="appoint_date" required>
                            </div>

                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" type="email" class="form-control" name="email" placeholder="Enter your email" required>
                            </div>

                            <div class="col-md-6">
                                <label for="phno" class="form-label">Phone No</label>
                                <input id="phno" type="tel" class="form-control" name="phno" placeholder="Enter your phone number" maxlength="10" required>
                            </div>

                            <div class="col-md-6">
                                <label for="diseases" class="form-label">Diseases</label>
                                <input id="diseases" type="text" class="form-control" name="diseases" placeholder="Enter your diseases" required>
                            </div>

                            <div class="col-md-6">
                                <label for="doct" class="form-label">Doctor</label>
                                <select id="doct" class="form-control" name="doct" required>
                                    <option value="">-- Select --</option>

                                    <%
                                    DoctorDao dao = new DoctorDao();
                                    List<Doctor> list = dao.getAllDoctors();
                                    for (Doctor d : list) {
                                    %>
                                    <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                                    <%
                                    }
                                    %>

                                </select>
                            </div>

                            <div class="col-md-12">
                                <label for="address" class="form-label">Full Address</label>
                                <textarea id="address" name="address" class="form-control" rows="3" placeholder="Enter your full address" required></textarea>
                            </div>

                            <div class="col-md-12 text-center">
                                <c:if test="${empty userObj }">
                                    <a href="user_login.jsp" class="btn btn-success">Submit</a>
                                </c:if>
                                <c:if test="${not empty userObj }">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
