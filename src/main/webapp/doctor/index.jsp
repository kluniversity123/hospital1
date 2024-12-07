<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>
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
            transition: background-color 0.3s ease, color 0.3s ease;
            font-size: 16px;
        }
        .sidebar ul li a i {
            font-size: 20px;
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
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            height: 100vh;
            overflow-y: auto;
        }
        .card {
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: box-shadow 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        .card i {
            font-size: 40px;
            margin-bottom: 10px;
        }
        .card p {
            font-size: 18px;
            margin: 0;
        }
        h3 {
            color: #333;
            font-size: 2rem;
            font-weight: bold;
            margin-top: 35px;
            margin-bottom: 35px;
            text-align: center;
        }
        .modal-content {
            border-radius: 8px;
        }
        .modal-header, .modal-footer {
            border: none;
        }
        .modal-title {
            font-size: 18px;
            font-weight: bold;
        }
        .card .fas.fa-user-md {
            color: #3498db; 
        }
        .card .far.fa-calendar-check {
            color: #e67e22; 
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <h4>Doctor Dashboard</h4>
        <ul>
            <li><a href="index.jsp"><i class="fa fa-tachometer-alt"></i><span>Home</span></a></li>
            <li><a href="edit_profile.jsp"><i class="fa fa-user-md"></i><span>Edit Profile</span></a></li>
            <li><a href="patient.jsp"><i class="fa fa-user-injured"></i><span>View Patients</span></a></li>
            <li><a href="../doctor_login.jsp"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
        </ul>
    </div>

    <div class="content">
        <c:if test="${empty doctObj }">
            <c:redirect url="../doctor_login.jsp"></c:redirect>
        </c:if>

        <h3>Doctor Dashboard</h3>

        <%
        Doctor d = (Doctor) session.getAttribute("doctObj");
        DoctorDao dao = new DoctorDao();
        %>

        <div class="container p-5">
            <div class="row">
                <!-- Doctor Count Card -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card paint-card">
                        <div class="card-body text-center">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Doctor <br> <%=dao.countDoctor()%>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Appointment Count Card -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card paint-card">
                        <div class="card-body text-center">
                            <i class="far fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Appointments <br>
                                <%=dao.countAppointmentByDocotrId(d.getId())%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
