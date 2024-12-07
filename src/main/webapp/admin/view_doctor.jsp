<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
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
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            height: 100vh;
            overflow-y: auto;
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
        .text-success {
            color: #28a745;
        }
        .text-danger {
            color: #dc3545;
        }
        h3 {
            color: #333;
            font-size: 2rem;
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 55px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <h4>Admin Dashboard</h4>
        <ul>
            <li><a href="index.jsp"><i class="fa fa-tachometer-alt"></i><span>Home</span></a></li>
            <li><a href="doctor.jsp"><i class="fa fa-user-md"></i><span>Add Doctor</span></a></li>
            <li><a href="view_doctor.jsp"><i class="fa fa-user-md"></i><span>View Doctors</span></a></li>
            <li><a href="patient.jsp"><i class="fa fa-user-injured"></i><span>View Patients</span></a></li>
            <li><a href="view_feedback.jsp"><i class="fa fa-sign-out-alt"></i><span>View FeedBack</span></a></li>
            <li><a href="../admin_login.jsp"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
        </ul>
    </div>

    <div class="content">
        <div class="container-fluid p-3">
            <div>
                <div class="card-body">
                    <h3 class="fs-3 text-center">Doctor Details</h3>
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-3 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">DOB</th>
                                <th scope="col">Qualification</th>
                                <th scope="col">Specialist</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mob No</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            DoctorDao dao2 = new DoctorDao();
                            List<Doctor> list2 = dao2.getAllDoctors();
                            for (Doctor d : list2) {
                            %>
                            <tr>
                                <td><%=d.getFullName()%></td>
                                <td><%=d.getDob()%></td>
                                <td><%=d.getQualification()%></td>
                                <td><%=d.getSpecialist()%></td>
                                <td><%=d.getEmail()%></td>
                                <td><%=d.getMobNo()%></td>
                                <td>
                                    <a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                    <a href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
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
