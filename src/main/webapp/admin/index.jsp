<%@ page import="com.org.dao.DoctorDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
        .dashboard-content {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }
        .card {
            flex: 1 1 calc(33.333% - 30px);
            max-width: calc(33.333% - 30px);
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
            font-size: 1.7rem;
            font-weight: bold;
            margin-top: 35px;
            margin-bottom: 48px;
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
        <c:if test="${empty adminObj}">
            <c:redirect url="../admin_login.jsp"/>
        </c:if>

        <div class="container">
            <h3>Admin Dashboard</h3>

            <c:if test="${not empty errorMsg}">
                <p class="text-danger text-center">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty succMsg}">
                <div class="alert alert-success text-center">${succMsg}</div>
                <c:remove var="succMsg" scope="session"/>
            </c:if>

            <%
                DoctorDao dao = new DoctorDao();
            %>

            <div class="dashboard-content">
                <div class="card">
                    <i class="fas fa-user-md" style="color: #007bff;"></i>
                    <p>Doctors<br><%= dao.countDoctor() %></p>
                </div>
                <div class="card">
                    <i class="fas fa-users" style="color: #28a745;"></i>
                    <p>Users<br><%= dao.countUSer() %></p>
                </div>
                <div class="card">
                    <i class="far fa-calendar-check" style="color: #ffc107;"></i>
                    <p>Total Appointments<br><%= dao.countAppointment() %></p>
                </div>
                <div class="card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fas fa-stethoscope" style="color: #dc3545;"></i>
                    <p>Specialists<br><%= dao.countSpecialist() %></p>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../addSpecialist" method="post">
                            <div class="form-group">
                                <label for="specName">Enter Specialist Name</label>
                                <input type="text" id="specName" name="specName" class="form-control">
                            </div>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
