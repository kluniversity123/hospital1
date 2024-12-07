<%@ page import="com.org.entity.Doctor" %>
<%@ page import="com.org.dao.DoctorDao" %>
<%@ page import="com.org.entity.Specalist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.org.dao.SpecialistDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Doctor Details</title>
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
            overflow-x: hidden;
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
        .container-fluid {
            margin-left: 140px;
            padding: 20px;
            
        }
        h3 {
            color: #333;
            font-size: 1.7rem;
            font-weight: bold;
            margin-top: 35px;
            margin-bottom: 45px;
            text-align: center;
        }
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            
        }
        .form-card {
            width: 100%;
            max-width: 600px;
            background: white;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            
        }
        .form-control-icon {
            position: relative;
        }
        .form-control-icon i {
            position: absolute;
            top: 70%;
            left: 10px;
            transform: translateY(-50%);
            color: #333;
        }
        .form-control {
            padding-left: 40px;
        }
        .form-label {
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

    <div class="container-fluid">
    <!-- <h3>Edit Doctor Details</h3> -->
        <div class="form-container">
            <div class="form-card card">
                <div class="card-body">
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-3 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    DoctorDao dao2 = new DoctorDao();
                    Doctor d = dao2.getDoctorsById(id);
                    %>

                    <form action="../updateDoctor" method="post">
                        <div class="mb-3 form-control-icon">
                            <label class="form-label">Full Name</label>
                            <i class="fa fa-user"></i>
                            <input type="text" required name="fullname" class="form-control" value="<%=d.getFullName()%>">
                        </div>
                        <div class="mb-3 form-control-icon">
                            <label class="form-label">DOB</label>
                            <i class="fa fa-calendar"></i>
                            <input type="date" value="<%=d.getDob()%>" required name="dob" class="form-control">
                        </div>
                        <div class="mb-3 form-control-icon">
                            <label class="form-label">Qualification</label>
                            <i class="fa fa-graduation-cap"></i>
                            <input type="text" required name="qualification" class="form-control" value="<%=d.getQualification()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" required class="form-control">
                                <option value="<%=d.getSpecialist()%>" selected><%=d.getSpecialist()%></option>
                                <%
                                SpecialistDao dao = new SpecialistDao();
                                List<Specalist> list = dao.getAllSpecialist();
                                for (Specalist s : list) {
                                %>
                                <option value="<%=s.getSpecialistName()%>"><%=s.getSpecialistName()%></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                        <div class="mb-3 form-control-icon">
                            <label class="form-label">Email</label>
                            <i class="fa fa-envelope"></i>
                            <input type="email" required name="email" class="form-control" value="<%=d.getEmail()%>">
                        </div>
                        <div class="mb-3 form-control-icon">
                            <label class="form-label">Mobile No</label>
                            <i class="fa fa-phone"></i>
                            <input type="text" required name="mobno" class="form-control" value="<%=d.getMobNo()%>">
                        </div>
                        <div class="mb-3 form-control-icon">
                            <label class="form-label">Password</label>
                            <i class="fa fa-lock"></i>
                            <input type="password" required name="password" class="form-control" value="<%=d.getPassword()%>">
                        </div>
                        <input type="hidden" name="id" value="<%=d.getId()%>">
                        <button type="submit" class="btn btn-primary col-md-12">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
