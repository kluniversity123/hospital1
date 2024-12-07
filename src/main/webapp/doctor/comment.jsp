<%@page import="com.org.entity.Appointment"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%><!DOCTYPE html>
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

    <div class="container-fluid p-5" style="margin-left: 250px;">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <p class="text-center fs-4">Patient Comment</p>
                        
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AppointmentDao dao = new AppointmentDao();
                        Appointment ap = dao.getAppointmentById(id);
                        %>
                        
                        <form class="row g-3" action="../updateStatus" method="post">
                            <div class="col-md-6">
                                <label class="form-label">Patient Name</label>
                                <input type="text" readonly value="<%=ap.getFullName()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Age</label>
                                <input type="text" readonly value="<%=ap.getAge()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Mob No</label>
                                <input type="text" readonly value="<%=ap.getPhNo()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Diseases</label>
                                <input type="text" readonly value="<%=ap.getDiseases()%>" class="form-control">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Comment</label>
                                <textarea required name="comm" class="form-control" rows="3"></textarea>
                            </div>

                            <input type="hidden" name="id" value="<%=ap.getId()%>">
                            <input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

                            <div class="col-md-12 text-center">
                                <button class="btn btn-primary mt-3 col-md-6">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
