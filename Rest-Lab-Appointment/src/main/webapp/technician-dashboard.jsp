<%-- 
    Document   : technician-dashboard
    Created on : Mar 11, 2024, 3:38:00 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Technician Dashboard</title>
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
                transition: transform 0.3s ease; /* Add transition for transform property */
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
                transition: all 0.5s ease;
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
            #viewAppointmentsContent,
            #testDetailsContent,
            #uploadReportsContent,
            #viewPaymentsContent,
            #patientDetailsContent {
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
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
            }

            #uploadForm {
                width: 300px; /* Adjust width as needed */
                margin: 0 auto; /* Center the form horizontally */
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            #uploadForm label {
                display: block;
                margin-bottom: 5px;
            }

            #uploadForm input[type="text"],
            #uploadForm input[type="file"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            #uploadForm button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            #uploadForm button:hover {
                background-color: #0056b3;
            }

        </style>
        
        <script>
            const url = "http://localhost:8080/Rest-lab-Appointment/resources/testdetails/";
            function getTest() {
                let id = document.getElementById("testId").value;
                const options = {
                    method: "GET"
                };
                fetch(url + id, options)
                        .then(res => res.json())
                        .then(data => {
                            if (data !== null) {
                                document.getElementById("patientName").value = data.patientName;
                                document.getElementById("testType").value = data.testType;
                                document.getElementById("testResult").value = data.testResult;
                                document.getElementById("technician").value = data.technician;
                                document.getElementById("doctor").value = data.doctor;
                            } else {
                                alert("Not found");
                            }
                        });
            }


            function addTest() {
                const person = {
                    "testId": document.getElementById("testId").value,
                    "patientName": document.getElementById("patientName").value,
                    "testType": document.getElementById("testType").value,
                    "testResult": document.getElementById("testResult").value,
                    "technician": document.getElementById("technician").value,
                    "doctor": document.getElementById("doctor").value
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

            function updateTest() {
                let id = document.getElementById("testId").value;
                const person = {
                    "testId": id,
                    "patientName": document.getElementById("patientName").value,
                    "testType": document.getElementById("testType").value,
                    "testResult": document.getElementById("testResult").value,
                    "technician": document.getElementById("technician").value,
                    "doctor": document.getElementById("doctor").value
                };

                const options = {
                    method: "PUT",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(person)
                };

                fetch(url + id, options);
            }

            function deleteTest() {
                let id = document.getElementById("testId").value;
                const options = {
                    method: "DELETE"
                };
                fetch(url + id, options);
            }


            function clearTest() {
                document.getElementById("testId").value = "";
                document.getElementById("patientName").value = "";
                document.getElementById("testType").value = "";
                document.getElementById("testResult").value = "";
                ocument.getElementById("technician").value = "";
                ocument.getElementById("doctor").value = "";
            }
        </script>
        
    </head>
    <body>
        <div class="header fixed-header">
            <div class="menu-icon" onclick="toggleSideMenu()">
                <!-- Menu Icon (You can replace this with an actual menu icon image) -->
                &#9776;
            </div>
            <div>
                <h1>Technician Dashboard</h1>
            </div>
            <div class="logout-btn">
                <button onclick="logout()">Logout</button>
            </div>
        </div>
        <div class="container">
            <div class="side-menu fixed-side-menu" id="sideMenu">
                <div class="menu-item">
                    <a href="#" onclick="showViewAppointments()">View Appointments</a>
                </div><hr>
                <div class="menu-item">
                    <a href="#" onclick="manageTestDetails()">Manage Test Details</a>
                </div><hr>
                <div class="menu-item">
                    <a href="#" onclick="showUploadReports()">Upload Reports</a>
                </div><hr>
                <div class="menu-item">
                    <a href="#" onclick="showViewPayments()">View Payments</a>
                </div><hr>
                <div class="menu-item">
                    <a href="#" onclick="showPatientDetails()">Patient Details</a>
                </div><hr>
            </div>
            <div class="content">
                <div id="viewAppointmentsContent">
                    <!-- View Appointments Section -->
                    <h2 class="dashboard-heading">View Appointments</h2>
                    <input type="text" id="appointmentNumberInput" placeholder="Enter Appointment Number">
                    <button onclick="searchAppointment()">Search</button>
                    <br><br><br>
                    <div id="appointmentView">
                        <table id="appointmentsTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Date</th>
                                    <th>Test Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Table rows will be dynamically added here -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="testDetailsContent" style="display: none;">
                    <!-- Patient Details Section -->
                    <h2 class="dashboard-heading">Manage Test Details</h2>
                    <form id="testDetailsForm">
                        <label for="testId">Test ID:</label>
                        <input type="text" id="testId" name="testId" required>

                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>

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
                        </select>

                        <label for="testResult">Test Result:</label>
                        <input type="text" id="testResult" name="testResult" required>

                        <label for="technician">Technician Name:</label>
                        <select id="technician" name="doctor" required>
                            <option value="">Select Technician</option>
                            <option value="Perera">MR.Perera</option>
                            <option value="Rathnayake">MR.Rathnayake</option>
                            <option value="Rajapaksha">MR.Rajapaksha</option>
                            <option value="Mendis">MR.Mendis</option>
                        </select>

                        <label for="doctor">Recommended Doctor:</label>
                        <select id="doctor" name="doctor" required>
                            <option value="">Select Doctor</option>
                            <option value="Wijesooriya">DR.Wijesooriya</option>
                            <option value="Senanayaka">DR.Senanayaka</option>
                            <option value="Karunarthne">DR.Karunarthne</option>
                            <option value="Liyanage">DR.Liyanage</option>
                        </select>
                        <br><br>
<!--                        <input type="submit" value="Submit">-->
                        <button id='btngetTest' onclick='getTest()'>Get By ID</button>
                        <button id='btnaddTest' onclick='addTest()'>Add</button>
                        <button id='btnupdateTest' onclick='updateTest()'>Update</button>
                        <button id='btndeleteTest' onclick='deleteTest()'>Delete</button>
                        <br /><br>
                        <button id='btnclearTest' onclick='clearTest()'>Clear</button>
                    </form>
                    <br><hr><br>

                    <div id="testDetailsView">
                        <table id="testDetailsTable">
                            <thead>
                                <tr>
                                    <th>Test ID</th>
                                    <th>Patient Name</th>
                                    <th>Test Type</th>
                                    <th>Test Result</th>
                                    <th>Technicians</th>
                                    <th>Doctor Recommended</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Table rows will be dynamically added here -->
                            </tbody>
                        </table>
                    </div>

                </div>
                <div id="uploadReportsContent" style="display: none;">
                    <!-- Upload Reports Section -->
                    <h2 class="dashboard-heading">Upload Reports</h2>
                    <!-- Add your upload report form here -->
                    <form id="uploadForm" enctype="multipart/form-data">
                        <label for="reportInput">Report ID:</label>
                        <input type="text" id="reportInput" required><br><br>
                        <label for="fileInput">Choose File:</label>
                        <input type="file" id="fileInput" required><br><br>
                        <button type="submit">Upload</button>
                    </form>
                </div>
                <div id="viewPaymentsContent" style="display: none;">
                    <!-- View Payments Section -->
                    <h2 class="dashboard-heading">View Payments</h2>
                    <!-- Add your view payments content here -->
                </div>
                <div id="patientDetailsContent" style="display: none;">
                    <!-- Patient Details Section -->
                    <h2 class="dashboard-heading">Patient Details</h2>
                    <!-- Add your patient details content here -->
                </div>
            </div>
        </div>

        <script>

            fetch('http://localhost:8080/Rest-Service/resources/appointments/')
                    .then(response => response.json())
                    .then(appointments => {
                        const tableBody = document.querySelector('#appointmentsTable tbody');
                        appointments.forEach(appointment => {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                        <td>${appointment.id}</td>
                        <td>${appointment.name}</td>
                        <td>${appointment.date}</td>
                        <td>${appointment.testType}</td>
                    `;
                            tableBody.appendChild(row);
                        });
                    })
                    .catch(error => console.error('Error fetching appointments:', error));

            window.onload = function () {
                // Ensure the side menu is displayed when the page loads
                var menu = document.getElementById("sideMenu");
                menu.style.display = "block";

                // Display the View Appointments section by default
                showViewAppointments();
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

            function showViewAppointments() {
                document.getElementById("viewAppointmentsContent").style.display = "block";
                document.getElementById("testDetailsContent").style.display = "none";
                document.getElementById("uploadReportsContent").style.display = "none";
                document.getElementById("viewPaymentsContent").style.display = "none";
                document.getElementById("patientDetailsContent").style.display = "none";
            }

            function manageTestDetails() {
                document.getElementById("viewAppointmentsContent").style.display = "none";
                document.getElementById("testDetailsContent").style.display = "block";
                document.getElementById("uploadReportsContent").style.display = "none";
                document.getElementById("viewPaymentsContent").style.display = "none";
                document.getElementById("patientDetailsContent").style.display = "none";
            }

            function showUploadReports() {
                document.getElementById("viewAppointmentsContent").style.display = "none";
                document.getElementById("testDetailsContent").style.display = "none";
                document.getElementById("uploadReportsContent").style.display = "block";
                document.getElementById("viewPaymentsContent").style.display = "none";
                document.getElementById("patientDetailsContent").style.display = "none";
            }

            function showViewPayments() {
                document.getElementById("viewAppointmentsContent").style.display = "none";
                document.getElementById("testDetailsContent").style.display = "none";
                document.getElementById("uploadReportsContent").style.display = "none";
                document.getElementById("viewPaymentsContent").style.display = "block";
                document.getElementById("patientDetailsContent").style.display = "none";
            }

            function showPatientDetails() {
                document.getElementById("viewAppointmentsContent").style.display = "none";
                document.getElementById("testDetailsContent").style.display = "none";
                document.getElementById("uploadReportsContent").style.display = "none";
                document.getElementById("viewPaymentsContent").style.display = "none";
                document.getElementById("patientDetailsContent").style.display = "block";
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

    </body>
</html>
