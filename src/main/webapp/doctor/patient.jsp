<%@page import="com.org.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@page import="com.org.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            min-height: 100vh;
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

        .container {
            margin-left: 270px;
            padding: 20px;
            width: 100%;
        }

        .table {
            margin-top: 20px;
            width: 100%;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle; 
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

        .btn-success {
            background-color: #1abc9c;
            border-color: #16a085;
        }

        .btn-success:hover {
            background-color: #16a085;
            border-color: #149174;
        }
        
        .btn.disabled, .btn:disabled {
            cursor: not-allowed;
        }

        .fs-3 {
            font-size: 24px;
        }

        .fs-4 {
            font-size: 20px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
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

    <!-- Main Content -->
    <div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div>
                    <div class="card-body">
                        <h3 class="fs-3 text-center">Patient Details</h3>

                        <c:if test="${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <p class="fs-4 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mob No</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Doctor d = (Doctor) session.getAttribute("doctObj");
                                AppointmentDao dao = new AppointmentDao();
                                List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                                for (Appointment ap : list) {
                                %>
                                <tr>
                                    <td><%=ap.getFullName()%></td>
                                    <td><%=ap.getGender()%></td>
                                    <td><%=ap.getAge()%></td>
                                    <td><%=ap.getAppoinDate()%></td>
                                    <td><%=ap.getEmail()%></td>
                                    <td><%=ap.getPhNo()%></td>
                                    <td><%=ap.getDiseases()%></td>
                                    <td><%=ap.getStatus()%></td>
                                    <td>
                                        <%
                                        if ("Pending".equals(ap.getStatus())) {
                                        %> 
                                        <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">Comment</a>
                                        <% } else { %> 
                                        <a href="#" class="btn btn-success btn-sm disabled">Comment</a>
                                        <% } %>
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
    </div>

</body>
</html>
