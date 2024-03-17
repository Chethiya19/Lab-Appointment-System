<%-- 
    Document   : p-dashboard
    Created on : Mar 11, 2024, 3:32:08 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Patient Dashboard</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #D4DEE8;
            }
            .header {
                background-color: #3b5998;
                color: #fff;
                padding: 10px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 50px;
            }
            .fixed-header {
                position: fixed;
                top: 0;
                left: 0;
                width: 97.5%;
                z-index: 1000; /* Ensure it's above other content */
            }
            .menu-icon {
                cursor: pointer;
            }
            .container {
                position: relative;
                left: 250px;
                top: 60px;
                width: 83%;
                display: flex;
                height: calc(96vh - 46px); /* Adjusting for header height */

            }
            .side-menu {
                width: 200px;
                background-color: #4a90e2;
                color: #fff;
                padding: 20px;
                display: block; /* Initially displayed */
                transition: transform 0.5s ease; /* Add transition for transform property */
                transform: translateX(0);
            }
            .fixed-side-menu {
                position: fixed;
                top: 70px;
                left: 0;
                bottom: 0;
                width: 200px;
                z-index: 1000; /* Ensure it's above other content */
                overflow-y: auto; /* Enable scrolling if content exceeds menu height */
            }
            .menu-hidden {
                transform: translateX(-100%);
            }
            .menu-item {
                margin-bottom: 15px;
            }
            .menu-item a {
                color: #fff;
                text-decoration: none;
                font-size: 18px;
                transition: all 0.3s ease;
            }
            .menu-item a:hover {
                color: #ffd700; /* Change color on hover */
            }
            .logout-btn button {
                background-color: #ff6347; /* Red */
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                border-radius: 5px;
                transition: all 0.3s ease;
            }
            .logout-btn button:hover {
                background-color: #d9534f; /* Darker Red on hover */
            }
            .content {
                flex: 1;
                padding: 20px;
            }
            .centered-content {
                display: flex;
                justify-content: center;
                align-items: center;
                height: calc(100vh - 100px); /* Adjusting for header height */
            }
            .dashboard-heading {
                font-size: 24px;
                text-align: center;
                margin-bottom: 20px;
            }
            form {
                max-width: 400px;
                margin: 0 auto;
            }
            input[type="text"],
            input[type="date"],
            input[type="time"],
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
            }
            #btnmakeAppointment {
                width: 100%;
                background-color: #4caf50;
                color: white;
                border: none;
                cursor: pointer;
            }
            #btnmakeAppointment:hover{
                background-color: #45a049;
            }
            input[type="submit"] {
                background-color: #4caf50; /* Green */
                color: white;
                border: none;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049; /* Darker Green on hover */
            }
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
                appearance: none;
                background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23000000"><path d="M7 10l5 5 5-5z"/></svg>');
                background-repeat: no-repeat;
                background-position: right 10px center;
                background-size: 20px;
                cursor: pointer;
            }

            select:focus {
                border-color: #4a90e2;
                box-shadow: 0 0 5px #4a90e2;
            }
            #makeAppointmentContent,
            #viewAppointmentsContent,
            #downloadReportsContent {
                margin-top: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 20px;
                display: none;
                background-color: #f4f4f4;
            }

            button {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #0056b3;
            }

        </style>
        
    </head>
    <body>
        <div class="header fixed-header">
            <div class="menu-icon" onclick="toggleSideMenu()">
                <!-- Menu Icon (You can replace this with an actual menu icon image) -->
                &#9776;
            </div>
            <div>
                <h1>Patient Dashboard</h1>
            </div>
            <div>
                <p>User ID: <span id="userId"></span></p>
                <p>User Name: <span id="userName"></span></p>
            </div>

            <div class="logout-btn">
                <button onclick="logout()">Logout</button>
            </div>
        </div>
        <div class="container">
            <div class="side-menu fixed-side-menu" id="sideMenu">
                <div class="menu-item">
                    <a href="#" onclick="showMakeAppointment()">Make an Appointment</a>
                </div><hr>
                <div class="menu-item">
                    <a href="#" onclick="showViewAppointments()">View Appointments</a>
                </div><hr>
                <div class="menu-item">
                    <a href="#" onclick="showDownloadReports()">Download Reports</a>
                </div><hr>
            </div>
            <div class="content">
                <div id="makeAppointmentContent">
                    <!-- Appointment Form -->
                    <h2 class="dashboard-heading">Make an Appointment</h2>
                    <form action="#" method="post">
                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>
                        <label for="appointmentDate">Appointment Date:</label>
                        <input type="date" id="appointmentDate" name="appointmentDate" min="<%=java.time.LocalDate.now()%>" required>
                        <label for="appointmentTime">Appointment Time:</label>
                        <input type="time" id="appointmentTime" name="appointmentTime" required>
                        <label for="testType">Test Type:</label>
                        <select id="testType" name="testType" required>
                            <option value="">Select Test Type</option>
                            <option value="Blood Test">Blood Test</option>
                            <option value="Microbiological Tests">Microbiological Tests</option>
                            <option value="Thyroid Function Tests">Thyroid Function Tests</option>
                            <option value="Dengue Antigen">Dengue Antigen</option>
                            <option value="Cancer Marker Tests">Cancer Marker Tests</option>
                            <option value="BMP & CMP Tests">BMP & CMP Tests</option>
                            <option value="Genetic Test">Genetic Test</option>
                            <option value="Lipid Panel">Lipid Panel</option>
                            <option value="Urine Tests">Urine Tests</option>
                        </select><br><br>
                        <button id="btnmakeAppointment" onclick="makeAppointment()">Submit</button><br><br><br><br>
                    </form>
                </div>


                <div id="viewAppointmentsContent">
                    <!-- View Appointments Section -->
                    <h2 class="dashboard-heading">View Appointments</h2>
                    <input type="text" id="appointmentNumberInput" placeholder="Enter Appointment Number">
                    <button onclick="searchAppointment()">Search</button>
                    <div id="appointmentView"></div>
                </div>
                <div id="downloadReportsContent" style="display: none;">
                    <!-- Download Reports Section -->
                    <h2 class="dashboard-heading">Download Reports</h2>
                    <input type="text" id="reportNumberInput" placeholder="Enter Report Number">
                    <button onclick="searchReport()">Search</button>
                    <div id="reportView"></div>
                </div>
            </div>
        </div>

        <script>
            const url = "http://localhost:8080/Rest-Service/resources/appointments/";
            function makeAppointment() {
                const person = {
                    "p_name": document.getElementById("patientName").value,
                    "date": document.getElementById("appointmentDate").value,
                    "time": document.getElementById("appointmentTime").value,
                    "test_Type": document.getElementById("testType").value
                };

                const options = {
                    method: "POST",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(person)
                };

                fetch(url, options);

            }


            window.onload = function () {
                // Ensure the side menu is displayed when the page loads
                var menu = document.getElementById("sideMenu");
                menu.style.display = "block";

                // Display the View Appointments section by default
                showMakeAppointment();
            };

            function toggleSideMenu() {
                var menu = document.getElementById("sideMenu");
                if (menu.classList.contains("menu-hidden")) {
                    menu.classList.remove("menu-hidden");
                } else {
                    menu.classList.add("menu-hidden");
                }
            }

            function logout() {
                window.location.href = "http://localhost:8080/Rest-Lab-Appointment/";
                alert("Logging out...");
            }

            function showMakeAppointment() {
                document.getElementById("makeAppointmentContent").style.display = "block";
                document.getElementById("viewAppointmentsContent").style.display = "none";
                document.getElementById("downloadReportsContent").style.display = "none";
            }

            function showViewAppointments() {
                document.getElementById("makeAppointmentContent").style.display = "none";
                document.getElementById("viewAppointmentsContent").style.display = "block";
                document.getElementById("downloadReportsContent").style.display = "none";
            }

            function showDownloadReports() {
                document.getElementById("makeAppointmentContent").style.display = "none";
                document.getElementById("viewAppointmentsContent").style.display = "none";
                document.getElementById("downloadReportsContent").style.display = "block";
            }

            document.getElementById("toggleButton").addEventListener("click", function () {
                var content = document.getElementById("viewAppointmentsContent");
                if (content.style.display === "none") {
                    content.style.display = "block";
                } else {
                    content.style.display = "none";
                }
            });
        </script>
        <script>
        // Retrieve user ID and name from session storage
        var userId = sessionStorage.getItem("userId");
        var userName = sessionStorage.getItem("userName");
        // Display user ID and name
        document.getElementById("userId").textContent = userId;
        document.getElementById("userName").textContent = userName;
    </script>
    </body>
</html>
