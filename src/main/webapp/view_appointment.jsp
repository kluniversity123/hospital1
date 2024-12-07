<%@page import="com.org.dao.AppointmentDao"%>
<%@page import="com.org.entity.User"%>
<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }
        
        .table {
            margin-top: 20px;
            width: 100%;
            text-align: center;
        }
        .table th, .table td {
            vertical-align: middle; 
            padding: 10px;
        }
        .table thead th {
            background-color: #2c3e50;
            color: white;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        h3 {
            color: #333;
            font-size: 2rem;
            font-weight: bold;
            margin-top: 45px;
            margin-bottom: 50px;
            text-align: center;
        }
        .status-btn {
            font-size: 14px;
        }
        .status-text {
            font-weight: bold;
        }
        .feedback-btn{
        	background-color: #007BFF;
        	color: white;
        	padding: 8px 5px;
        	border-radius: 5px;
        	font-size: 14px;
        	text-decoration: none;
        	border: none;
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

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h3>Appointment List</h3>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Age</th>
                                <th scope="col">Appointment Date</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Medicine Suggested</th>
                                <th scope="col">Feed-Back</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                User user = (User) session.getAttribute("userObj");
                                AppointmentDao dao = new AppointmentDao();
                                DoctorDao dao2 = new DoctorDao();
                                List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                                for (Appointment ap : list) {
                                    Doctor d = dao2.getDoctorsById(ap.getDoctorId());
                            %>
                            <tr>
                                <td><%=ap.getFullName()%></td>
                                <td><%=ap.getGender()%></td>
                                <td><%=ap.getAge()%></td>
                                <td><%=ap.getAppoinDate()%></td>
                                <td><%=ap.getDiseases()%></td>
                                <td><%=d.getFullName()%></td>
                                <td>
                                    <%
                                        if ("Pending".equals(ap.getStatus())) {
                                    %>
                                        <a href="#" class="btn btn-sm btn-warning status-btn">Pending</a>
                                    <%
                                        } else {
                                    %>
                                        <span class="status-text"><%=ap.getStatus()%></span>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                	<a href="user_feedback.jsp">
                                		<button class="feedback-btn"><i class="fa fa-sign-out-alt"></i> FeedBack</button>
                                	</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
