<%@page import="com.org.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
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
            margin-top: 20px;
        }
        .card {
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-body {
            padding: 20px;
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

    <div class="container">
        <div class="row">
            <!-- Change Password Card -->
            <div class="col-md-5">
                <div class="card">
                    <p class="text-center fs-3 mt-3">Change Password</p>
                    <div class="card-body">
                        <c:if test="${not empty succMsg}">
                            <p class="text-center text-success fs-4">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsg}">
                            <p class="text-center text-danger fs-5">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <form action="../doctChangePassword" method="post">
                            <div class="mb-3">
                                <label>Enter New Password</label>
                                <input type="text" name="newPassword" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label>Enter Old Password</label>
                                <input type="text" name="oldPassword" class="form-control" required>
                            </div>

                            <input type="hidden" value="${doctObj.id}" name="uid">
                            <button class="btn btn-success col-md-12">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Profile Card -->
            <div class="col-md-6 offset-md-1">
                <div class="card">
                    <p class="text-center fs-3 mt-3">Edit Profile</p>
                    <div class="card-body">
                        <c:if test="${not empty succMsgd}">
                            <p class="text-center text-success fs-4">${succMsgd}</p>
                            <c:remove var="succMsgd" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsgd}">
                            <p class="text-center text-danger fs-5">${errorMsgd}</p>
                            <c:remove var="errorMsgd" scope="session" />
                        </c:if>

                        <form action="../doctorUpdateProfile" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control" value="${doctObj.fullName}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input type="date" required name="dob" class="form-control" value="${doctObj.dob}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input required name="qualification" type="text" class="form-control" value="${doctObj.qualification}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Specialist</label>
                                <select name="spec" required class="form-control">
                                    <option>${doctObj.specialist}</option>
                                    <%
                                    SpecialistDao dao = new SpecialistDao();
                                    List<Specalist> list = dao.getAllSpecialist();
                                    for (Specalist s : list) {
                                    %>
                                    <option><%= s.getSpecialistName() %></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" readonly required name="email" class="form-control" value="${doctObj.email}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mob No</label>
                                <input type="text" required name="mobno" class="form-control" value="${doctObj.mobNo}">
                            </div>

                            <input type="hidden" name="id" value="${doctObj.id}">
                            <button type="submit" class="btn btn-primary col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
