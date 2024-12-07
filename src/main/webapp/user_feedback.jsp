<%@page import="com.org.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.org.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Feedback</title>
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
            height: 100vh;
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
            width: calc(100% - 250px);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        h3 {
            color: #333;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }
        .form-container {
            padding: 50px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            max-width: 600px;
            width: 100%;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 18px;
            margin-bottom: 10px;
            display: block;
        }
        .form-control {
            padding: 10px;
            font-size: 16px;
            width: 100%;
        }
        .form-control:focus {
            outline: none;
            box-shadow: none;
            border-color: #2c3e50;
        }
        .btn-primary {
            background-color: #2c3e50;
            border-color: #2c3e50;
            font-size: 18px;
            padding: 10px 20px;
            width: 100%;
        }
        .rating i {
            font-size: 30px;
            color: gray;
            cursor: pointer;
        }
        .rating i:hover {
            color: #f1c40f;
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
        <div class="form-container">
            <h3>Doctor Feedback Form</h3>
            <form action="view_feedback.jsp" method="POST">
                <div class="form-group">
                    <label for="doctorName"><i class="fas fa-user-md"></i> Doctor's Name</label>
                    <select id="doct" class="form-control" name="doct" required>
                    	<option value="">-- Select --</option>
						<%
                        DoctorDao dao = new DoctorDao();
                        List<Doctor> list = dao.getAllDoctors();
                        for (Doctor d : list) {
                        %>
                        <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                        <%
                        }
                        %>
                   </select>
                </div>
                <div class="form-group">
                    <label for="treatmentFeedback"><i class="fas fa-comments"></i> Feedback on Treatment</label>
                    <textarea id="treatmentFeedback" name="treatmentFeedback" class="form-control" rows="5" placeholder="Write your feedback..." required></textarea>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-star"></i> Rate Your Experience</label>
                    <div class="rating">
                        <i class="fas fa-star" data-rate="1"></i>
                        <i class="fas fa-star" data-rate="2"></i>
                        <i class="fas fa-star" data-rate="3"></i>
                        <i class="fas fa-star" data-rate="4"></i>
                        <i class="fas fa-star" data-rate="5"></i>
                    </div>
                    <input type="hidden" id="ratingValue" name="rating" value="0">
                </div>
                <div class="form-group">
                    <label for="recommend"><i class="fas fa-thumbs-up"></i> Would you recommend this doctor?</label>
                    <select id="recommend" name="recommend" class="form-control" required>
                        <option value="" disabled selected>Select an option</option>
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> Submit Feedback</button>
            </form>
        </div>
    </div>

    <script>
        // Rating system
        const stars = document.querySelectorAll('.rating i');
        const ratingInput = document.getElementById('ratingValue');
        stars.forEach(star => {
            star.addEventListener('click', function() {
                const rate = this.getAttribute('data-rate');
                ratingInput.value = rate;
                stars.forEach(s => s.style.color = 'gray');
                for (let i = 0; i < rate; i++) {
                    stars[i].style.color = '#f1c40f';
                }
            });
        });
    </script>
</body>
</html>
