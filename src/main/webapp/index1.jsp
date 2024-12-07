<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
        .sidebar ul li a:hover {
            background-color: #1abc9c;
        }
        .sidebar ul li a i {
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
            width: 100%;
        }
        .carousel img {
            height: 500px;
            object-fit: cover;
        }
        .key-features .card, .our-team .card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .key-features .card:hover, .our-team .card:hover {
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        .key-features .card-body p {
            margin: 0;
        }
        .key-features .card-body {
            text-align: center;
        }
        .our-team img {
            object-fit: cover;
        }
        .our-team .card-body p {
            margin: 5px 0;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
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

    <!-- Content Area -->
    <div class="content">
        <!-- Carousel -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/hos.jpg" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="img/hos2.jpg" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="img/hos3.jpg" class="d-block w-100" alt="..." height="500px">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Key Features Section -->
        <div class="container key-features mt-4">
            <p class="text-center fs-2">Key Features of our Hospital</p>
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <p class="fs-5">100% Safety</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <p class="fs-5">Clean Environment</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <p class="fs-5">Friendly Doctors</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <p class="fs-5">Medical Research</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <img alt="" src="img/doct.jpg" class="img-fluid">
                </div>
            </div>
        </div>

        <!-- Our Team Section -->
        <!-- <div class="container our-team mt-4">
            <p class="text-center fs-2">Our Team</p>
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="img/doc1.jpg" width="100%" height="300px" class="mb-3">
                            <p class="fw-bold fs-5">Samuani Simi</p>
                            <p>(CEO & Chairman)</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="img/doc2.jpg" width="100%" height="300px" class="mb-3">
                            <p class="fw-bold fs-5">Dr. Siva Kumar</p>
                            <p>(Chief Doctor)</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="img/doc3.jpg" width="100%" height="300px" class="mb-3">
                            <p class="fw-bold fs-5">Dr. Niuise Paule</p>
                            <p>(Chief Doctor)</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="img/doc4.jpg" width="100%" height="300px" class="mb-3">
                            <p class="fw-bold fs-5">Dr. Samuel Paul</p>
                            <p>(Chief Doctor)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 -->
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
