<%@page import="com.org.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Doctor</title>
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
            margin-left: 370px;
            padding: 20px;
            width: calc(80% - 250px);
            height: 100vh;
            overflow-y: auto;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
            font-size: 24px;
            text-align: center;
            padding: 15px;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group i {
            position: absolute;
            left: 28px;
            top: 70%;
            transform: translateY(-50%);
            color: #6c757d;
        }

        .form-control {
            padding-left: 40px;
            border-radius: 0.375rem;
        }

        .form-control::placeholder {
            color: #6c757d;
        }

        .btn-primary {
            width: 100%;
        }

        .alert {
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 0.375rem;
            font-size: 16px;
        }
        h3 {
            color: #333;
            font-size: 1.7rem;
            font-weight: bold;
            margin-top: 35px;
            margin-bottom: 48px;
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
    <h3>Add Doctor</h3>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body">
                            <c:if test="${not empty sucMsg}">
                				<p class="message text-success">${sucMsg}</p>
                				<c:remove var="sucMsg" scope="session" />
                			</c:if>
            				<c:if test="${not empty errorMsg}">
                				<p class="message text-danger">${errorMsg}</p>
                				<c:remove var="errorMsg" scope="session" />
                			</c:if>
                            <form action="../addDoctor" method="post">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <i class="fa fa-user"></i>
                                        <label for="fullname" class="form-label">Full Name</label>
                                        <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Enter Full Name" required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <i class="fa fa-calendar-alt"></i>
                                        <label for="dob" class="form-label">Date Of Birth</label>
                                        <input type="date" id="dob" name="dob" class="form-control" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <i class="fa fa-graduation-cap"></i>
                                        <label for="qualification" class="form-label">Qualification</label>
                                        <input type="text" id="qualification" name="qualification" class="form-control" placeholder="Enter Qualification" required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <i class="fa fa-briefcase-medical"></i>
                                        <label for="specialization" class="form-label">Specialization</label>
                                        <select id="specialization" name="spec" class="form-control" required>
                                            <option value="">-- Select --</option>
                                            <%
                                                SpecialistDao dao = new SpecialistDao();
                                                List<Specalist> list = dao.getAllSpecialist();
                                                for (Specalist s : list) {
                                            %>
                                            <option value="<%=s.getId()%>"><%=s.getSpecialistName()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <i class="fa fa-envelope"></i>
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter Email" required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <i class="fa fa-phone"></i>
                                        <label for="mobno" class="form-label">Mobile</label>
                                        <input type="text" id="mobno" name="mobno" class="form-control" placeholder="Enter Mobile Number" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <i class="fa fa-lock"></i>
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" required>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
