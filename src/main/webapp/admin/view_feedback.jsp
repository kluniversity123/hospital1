<%@ page import="java.util.List" %>
<%@ page import="com.org.dao.FeedbackDao" %>
<%@ page import="com.org.entity.Feedback" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Doctor's Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
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
        .sidebar ul li a:hover {
            background-color: #34495e;
            color: white;
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
            font-size: 1.7rem;
            font-weight: bold;
            margin-top: 45px;
            margin-bottom: 50px;
            text-align: center;
         }
         
        .container {
            margin-left: 270px; 
            padding: 20px;
            flex-grow: 1; 
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
            <li><a href="view_feedback.jsp"><i class="fa fa-comments"></i><span>View Feedback</span></a></li>
            <li><a href="../admin_login.jsp"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
        </ul>
    </div>

    <div class="container">
        <h3>View Doctor's Feedback</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Doctor</th>
                    <th>Feedback</th>
                    <th>Rating</th>
                    <th>Recommendation</th>
                    <th>Date Submitted</th>
                </tr>
            </thead>
            <tbody>
                <%
                    FeedbackDao feedbackDao = new FeedbackDao();
                    List<Feedback> feedbackList = feedbackDao.getAllFeedback(); // Assuming you have this method implemented
                    for (Feedback feedback : feedbackList) {
                %>
                <tr>
                    <td><%= feedback.getId() %></td>
                    <td><%= feedback.getDoctorId() %></td>
                    <td><%= feedback.getTreatmentFeedback() %></td>
                    <td><%= feedback.getRating() %></td>
                    <td><%= feedback.getRecommendation() %></td>
                    <td><%= feedback.getCreatedAt() %></td> 
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
