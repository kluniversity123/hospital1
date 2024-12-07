<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Medical Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f9ff;
    }

    header {
        background-color: #2c3e50;
        padding: 10px 0;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .container {
        width: 80%;
        margin: 0 auto;
        text-align: center;
    }

    .dropbtn {
        background-color: #555555;
        color: white;
        padding: 8px 15px;
        border-radius: 5px;
        font-size: 14px;
        font-weight: bold;
        text-decoration: none;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #555555;
        min-width: 150px;
        margin-left: -35px;
        border-radius: 5px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        font-size: 14px;
        font-weight: bold;
    }

    .dropdown-content a:hover {
        background-color: none;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .dropdown:hover .dropbtn {
        background-color: none;
    }

    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    nav a {
        text-decoration: none;
        color: white;
        margin: 0 15px;
        font-weight: bold;
    }

    nav .auth-buttons a {
        color: #ffffff;
        background-color: #007BFF;
        padding: 8px 15px;
        border-radius: 5px;
        font-size: 14px;
    }

    nav .auth-buttons a.sign-in {
        background-color: #555555;
        margin-left: 10px;
    }

    .section {
        padding: 50px 0;
        text-align: left;
        display: none;
    }

    .hero {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 50px;
        padding: 50px 0;
    }

    .hero-text {
        max-width: 45%;
        text-align: left;
    }

    .hero-text h1 {
        color: lightblue;
        font-size: 50px;
        margin-bottom: 25px;
        margin-top: -90px;
    }

    .hero-text p {
        color: #666666;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    .hero-text a {
        display: inline-block;
        text-decoration: none;
        background-color: #007BFF;
        color: #ffffff;
        padding: 12px 20px;
        border-radius: 5px;
        font-weight: bold;
    }

    .hero-image {
        max-width: 45%;
        margin-top: -90px;
    }

    .logo img {
        height: 65px;
        width: auto;
        display: block;
    }

    .hero-image img {
        width: 100%;
        height: auto;
    }

    .content {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
    }

    .content-text {
        max-width: 100%;
        color: #666666;
        line-height: 2.6;
        font-size: 19px;
        margin-bottom: 30px;
        text-align: center;
    }

    .content-text h1 {
        color: #1a73e8;
        font-size: 36px;
        margin-bottom: 20px;
    }

    .icons {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        gap: 20px;
        margin-top: 30px;
    }

    .icon-box {
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 250px;
        text-align: center;
    }

    .icon-box i {
        font-size: 50px;
        margin-bottom: 15px;
    }

    .icon-box:nth-child(1) i {
        color: #1a73e8;
    }

    .icon-box:nth-child(2) i {
        color: #FF6347;
    }

    .icon-box:nth-child(3) i {
        color: #32CD32;
    }

    .icon-box p {
        color: #333333;
        font-size: 16px;
        margin: 0;
    }

    footer {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        text-align: center;
        padding: 1px 0;
        background-color: #2c3e50;
        box-shadow: 0px -2px 5px rgba(0, 0, 0, 0.1);
        margin-top: 0;
    }

    footer p {
        color: white;
        font-size: 14px;
    }

    .circular-image {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        overflow: hidden;
        margin: 0 auto;
        border: 2px solid #1a73e8;
    }

    .circular-image img {
        width: 90%;
        height: 100%;
        align: center;
        margin-top: 10px;
    }

    html {
        scroll-behavior: smooth;
    }

    .card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        max-width: 600px;
        width: 100%;
        margin-left: 22.5%;
    }

    .contentt-text p {
        margin: 10px 0;
    }

    .contentt-text a {
        color: #007bff;
        text-decoration: none;
    }

    .contentt-text a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                    <img src="images/logo.png" alt="Online Medical System Logo">
                </div>
                <div class="nav-links">
                    <a href="javascript:void(0);" onclick="showSection('home')">Home</a>
                    <a href="javascript:void(0);" onclick="showSection('about')">About</a>
                    <a href="javascript:void(0);" onclick="showSection('products')">Products</a>
                    <a href="javascript:void(0);" onclick="showSection('service')">Service</a>
                    <a href="javascript:void(0);" onclick="showSection('contact')">Contact</a>
                </div>
                <div class="auth-buttons">
                	<div class="dropdown">
                		<button class="dropbtn"><i class="fas fa-user"></i> Login</button>
                		<div class="dropdown-content"><br>
                			<a href="admin_login.jsp"><i class="fas fa-user-shield"></i> Admin</a><br>
                			<a href="doctor_login.jsp"><i class="fas fa-user-md"></i> Doctor</a><br>
            				<a href="user_login.jsp"><i class="fas fa-user"></i> User</a><br>
        				</div>
    				</div>
					<a href="signup.jsp"><i class="fas fa-user-plus"></i> Sign-Up</a>
				</div>
            </nav>
        </div>
    </header>

    <div id="home" class="container section">
        <section class="hero">
            <div class="hero-text">
                <h1 id="changing-text">Medical Service Online For Patients</h1>
                <p>Access our medical services online, anywhere and anytime. Our platform provides comprehensive health solutions tailored to your needs.</p>
                <a style="background-color: red;" href="user_login.jsp">Book Appointment</a>
            </div>
            <div class="hero-image">
                <img src="images/indexhome.png" alt="Medical Service">
            </div>
        </section>
    </div>

    <div id="about" class="container section">
        <h1 align="center">About Us</h1>
        <section class="content">
            <div class="content-image">
                <img src="images/about.jpg" alt="About Us Image" style="width: 400px; height: 200px;">
            </div>
            <div class="content-text">
                <p>Our mission is to provide quality medical services online, ensuring accessibility to everyone. We believe in the power of technology to bring healthcare closer to patients and streamline medical processes.</p>
                <p>With a team of experienced professionals and cutting-edge technology, we strive to offer reliable and efficient healthcare services, anytime and anywhere.</p>
            </div>
        </section>
    </div>

    <div id="products" class="container section">
        <h1 align="center">Our Products</h1>
        <section class="content">
            <div class="content-text">
                <p>We offer a range of healthcare products that are designed to meet the needs of our patients. From medical devices to healthcare software, our products are crafted with precision and care.</p>
                <p>Explore our product line to find the perfect solution for your medical needs.</p>
            </div>
            <div class="icons">
                <div class="icon-box">
                    <i class="fas fa-stethoscope"></i>
                    <p>Medical Devices</p>
                </div>
                <div class="icon-box">
                    <i class="fas fa-tablet-alt"></i>
                    <p>Healthcare Software</p>
                </div>
                <div class="icon-box">
                    <i class="fas fa-prescription-bottle-alt"></i>
                    <p>Pharmaceuticals</p>
                </div>
            </div>
        </section>
    </div>

    <div id="service" class="container section">
        <h1 align="center">Our Services</h1>
        <section class="content">
            <div class="content-text">
                <p>Our services are designed to make healthcare accessible to everyone. We provide a variety of online medical services that you can access from the comfort of your home.</p>
                <p>From online consultations to home delivery of medications, we are here to meet all your healthcare needs.</p>
            </div>
            <div class="icons">
                <div class="icon-box">
                    <i class="fas fa-laptop-medical"></i>
                    <p>Online Consultations</p>
                </div>
                <div class="icon-box">
                    <i class="fas fa-shipping-fast"></i>
                    <p>Home Delivery</p>
                </div>
                <div class="icon-box">
                    <i class="fas fa-heartbeat"></i>
                    <p>Health Monitoring</p>
                </div>
            </div>
        </section>
    </div>

    <div id="contact" class="container section">
        <h1 align="center">Contact Us</h1>
        <section class="content">
        	<div class="circular-image">
                <img src="images/logo.png" alt="Contact Image">
            </div>
            <div class="content-text">
            	<p>You can reach us through our customer support or visit our office at the given address.</p>
                <p>Email: contact@onlinemedicalservice.com</p>
                <p>Phone: +1 234 567 8900</p>
                <p>Address: 123 Medical Street, Health City, Wellness Country</p>
            </div>
        </section>
    </div>

    <footer>
        <p>&copy; 2024 Online Medical Service. All rights reserved.</p>
    </footer>

    <script>
        function showSection(sectionId) {
            var sections = document.querySelectorAll('.section');
            sections.forEach(function (section) {
                section.style.display = 'none';
            });

            var selectedSection = document.getElementById(sectionId);
            if (selectedSection) {
                selectedSection.style.display = 'block';
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            showSection('home');
        });
        
  
        //Change the Text Color
        const colors = ['blue', 'green', 'orange']; 
        let currentColorIndex = 0;
        
        function changeTextColor() {
            const h1Element = document.getElementById('changing-text');
            h1Element.style.color = colors[currentColorIndex];
            currentColorIndex = (currentColorIndex + 1) % colors.length; 
        }

        setInterval(changeTextColor, 2000); 
        
    </script>
</body>

</html>
