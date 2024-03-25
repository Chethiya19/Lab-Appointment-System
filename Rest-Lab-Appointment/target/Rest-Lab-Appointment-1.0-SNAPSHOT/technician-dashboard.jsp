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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                z-index: 1000;
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
                height: calc(96vh - 46px);
            }
            .side-menu {
                width: 200px;
                background-color: #4a90e2;
                color: #fff;
                padding: 20px;
                display: block;
                transition: transform 0.3s ease;
                transform: translateX(0);
            }
            .fixed-side-menu {
                position: fixed;
                top: 70px;
                left: 0;
                bottom: 0;
                width: 200px;
                z-index: 1000;
                overflow-y: auto;
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
                color: #ffd700;
            }
            .logout-btn button {
                background-color: #ff6347;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                border-radius: 5px;
                transition: all 0.5s ease;
            }
            .logout-btn button:hover {
                background-color: #d9534f;
            }
            .content {
                flex: 1;
                padding: 20px;
            }
            .centered-content {
                display: flex;
                justify-content: center;
                align-items: center;
                height: calc(100vh - 100px);
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
                background-color: #4caf50;
                color: white;
                border: none;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
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
                width: 300px;
                margin: 0 auto;
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

            #appointmentsTable {
                width: 100%;
                border-collapse: collapse;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            #appointmentsTable th,
            #appointmentsTable td {
                padding: 12px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }

            #appointmentsTable th {
                background-color: #f2f2f2;
                color: #333;
                font-weight: bold;
                text-transform: uppercase;
            }

            #appointmentsTable tbody tr:hover {
                background-color: #f5f5f5;
            }

            /* Button Styling */
            .download-button {
                background-color: #4caf50;
                border: none;
                color: white;
                padding: 8px 16px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .download-button:hover {
                background-color: #45a049;
            }

            #patientDetailsTabel {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            #patientDetailsTabel th,
            #patientDetailsTabel td {
                padding: 10px;
                text-align: center;
                border-bottom: 1px solid #ddd;
                border-radius: 5px;
            }

            #patientDetailsTabel th {
                background-color: #f2f2f2;
            }

            #patientDetailsTabel tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            #patientDetailsTabel tbody tr:hover {
                background-color: #f1f1f1;
            }

            /* Responsive Styling */
            @media screen and (max-width: 600px) {
                #patientDetailsTabel {
                    border: 1px solid #ccc;
                }
                #patientDetailsTabel th,
                #patientDetailsTabel td {
                    padding: 8px;
                }
            }

            .acceptButton {
                background-color: green; /* Set background color for accept button */
                color: white; /* Set text color for accept button */
                border: none; /* Remove border */
                padding: 8px 16px; /* Add padding */
                cursor: pointer; /* Change cursor to pointer on hover */
                border-radius: 4px; /* Add border radius */
            }

            .rejectButton {
                background-color: red; /* Set background color for reject button */
                color: white; /* Set text color for reject button */
                border: none; /* Remove border */
                padding: 8px 16px; /* Add padding */
                cursor: pointer; /* Change cursor to pointer on hover */
                border-radius: 4px; /* Add border radius */
            }

            .acceptButton:hover, .rejectButton:hover {
                opacity: 0.8; /* Reduce opacity on hover */
            }

        </style>

        <script>
            const url = "http://localhost:8080/Rest-Service/resources/testdetails/";
            function getTest(event) {
                event.preventDefault();

                let id = document.getElementById("testId").value;

                if (id.trim() === "") {
                    alert("Please enter a test ID.");
                    return;
                }

                const options = {
                    method: "GET"
                };
                fetch(url + id, options)
                        .then(res => {
                            if (!res.ok) {
                                throw new Error("Test details not found");
                            }
                            return res.json();
                        })
                        .then(data => {
                            document.getElementById("patientName").value = data.patientName;
                            document.getElementById("testType").value = data.testType;
                            document.getElementById("testResult").value = data.testResult;
                            document.getElementById("technician").value = data.technician;
                            document.getElementById("doctor").value = data.doctor;
                        })
                        .catch(error => {
                            alert(error.message);
                            document.getElementById("testDetailsForm").reset();
                        });

            }


            function addTest(event) {
                event.preventDefault();
                let id = document.getElementById("testId").value;

                fetch(url + id)
                        .then(response => {
                            if (response.ok) {
                                alert("Test ID is already in use. Please choose a different ID.");
                            } else {

                                const person = {
                                    "testId": id,
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

                                fetch(url, options)
                                        .then(response => {
                                            if (response.ok) {
                                                alert("Test details added successfully!");
                                                document.getElementById("testDetailsForm").reset();
                                            } else {
                                                // Test addition failed
                                                throw new Error("Failed to add test.");
                                            }
                                        })
                                        .catch(error => {
                                            console.error('Error:', error);
                                            alert("An error occurred. Please try again later.");
                                        });
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }




            function updateTest(event) {
                event.preventDefault();

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

                fetch(url + id, options)
                        .then(response => {
                            if (response.ok) {
                                alert("Test details updated successfully!");
                                document.getElementById("testDetailsForm").reset();
                            } else {
                                throw new Error("Failed to update data.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Failed to update data. Please try again later.");
                        });
            }


            function deleteTest(event) {
                event.preventDefault();

                let id = document.getElementById("testId").value;

                if (!id) {
                    alert("Please enter a valid Test ID.");
                    return;
                }

                fetch(url + id)
                        .then(response => {
                            if (response.ok) {
                                const options = {
                                    method: "DELETE"
                                };

                                return fetch(url + id, options);
                            } else {
                                throw new Error("Test ID does not exist.");
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                alert("Test details deleted successfully!");
                                document.getElementById("testDetailsForm").reset();
                            } else {
                                throw new Error("Failed to delete data.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Failed to delete data. " + error.message);
                        });
            }


            function clearTest(event) {
                event.preventDefault();

                document.getElementById("testId").value = "";
                document.getElementById("patientName").value = "";
                document.getElementById("testType").value = "";
                document.getElementById("testResult").value = "";
                document.getElementById("technician").value = "";
                document.getElementById("doctor").value = "";
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
                    <a href="#" onclick="showManageTestDetails()">Manage Test Details</a>
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
                    <button id="searchButton" onclick="getAppointment()">Search</button>
                    <br><br><br>
                    <table id="appointmentsTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Test Type</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="appointmentsTableBody">
                            <!-- Appointments will be populated here -->
                        </tbody>
                    </table>
                </div>
                <div id="testDetailsContent" style="display: none;">
                    <!-- Patient Details Section -->
                    <h2 class="dashboard-heading">Manage Test Details</h2>
                    <form id="testDetailsForm">
                        <label for="testId">Test ID:</label>
                        <input type="text" id="testId" name="testId" required>

                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" >

                        <label for="testType">Test Type:</label>
                        <select id="testType" name="testType" >
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
                        <input type="text" id="testResult" name="testResult" >

                        <label for="technician">Technician Name:</label>
                        <select id="technician" name="doctor" >
                            <option value="">Select Technician</option>
                            <option value="Perera">MR.Perera</option>
                            <option value="Rathnayake">MR.Rathnayake</option>
                            <option value="Rajapaksha">MR.Rajapaksha</option>
                            <option value="Mendis">MR.Mendis</option>
                        </select>

                        <label for="doctor">Recommended Doctor:</label>
                        <select id="doctor" name="doctor" >
                            <option value="">Select Doctor</option>
                            <option value="Wijesooriya">DR.Wijesooriya</option>
                            <option value="Senanayaka">DR.Senanayaka</option>
                            <option value="Karunarthne">DR.Karunarthne</option>
                            <option value="Liyanage">DR.Liyanage</option>
                        </select>
                        <br><br>
                        <!--                        <input type="submit" value="Submit">-->
                        <button id='btngetTest' onclick='getTest(event)'>Get By ID</button>
                        <button id='btnaddTest' onclick='addTest(event)' required>Add</button>
                        <button id='btnupdateTest' onclick='updateTest(event)' required>Update</button>
                        <button id='btndeleteTest' onclick='deleteTest(event)' required>Delete</button>
                        <br /><br>
                        <button id='btnclearTest' onclick='clearTest(event)'>Clear</button>
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
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="testDetailsTableBody">
                                <!-- Table rows will be dynamically added here -->
                            </tbody>
                        </table>
                    </div>

                </div>
                <div id="uploadReportsContent" style="display: none;">
                    <!-- Upload Reports Section -->
                    <h2 class="dashboard-heading">Upload Reports</h2>
                    <form id="uploadForm" enctype="multipart/form-data">
                        <label for="reportId">Report ID:</label>
                        <input type="text" id="reportId" name="reportId" required>

                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>

                        <label for="uploadReportFile">Upload PDF Report:</label>
                        <input type="file" id="uploadReportFile" accept=".pdf" required />
                        <button id="btnUploadReport" onclick="addReport(event)">Upload</button>
                    </form>
                </div>
                <div id="viewPaymentsContent" style="display: none;">
                    <!-- View Payments Section -->
                    <h2 class="dashboard-heading">View Payments</h2>
                    <input type="text" id="paymentId" placeholder="Enter Payment ID">
                    <button id="searchButton" onclick="getPayment()">Search</button>
                    <br><br><br>
                    <div id="paymentView">
                        <table id=paymentTabel">
                            <thead>
                                <tr>
                                    <th>Patient ID</th>
                                    <th>Patient Name</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Date Of Birth</th>
                                    <th>Contact</th>
                                </tr>
                            </thead>
                            <tbody id="paymentTabelBody">
                                <!-- Table rows will be dynamically added here -->
                            </tbody>
                        </table>
                    </div>
                    <div id="patientDetailsContent" style="display: none;">
                        <!-- Patient Details Section -->
                        <h2 class="dashboard-heading">Patient Details</h2>
                        <input type="text" id="patientId" placeholder="Enter Patient ID">
                        <button id="searchButton" onclick="getPatient()">Search</button>
                        <br><br><br>
                        <div id="patientDetailsView">
                            <table id="patientDetailsTabel">
                                <thead>
                                    <tr>
                                        <th>Patient ID</th>
                                        <th>Patient Name</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>Date Of Birth</th>
                                        <th>Contact</th>
                                    </tr>
                                </thead>
                                <tbody id="patientDetailsTabelBody">
                                    <!-- Table rows will be dynamically added here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <script>
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

                function showManageTestDetails() {
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


            </script>


            <script>
                //*****View Appointments*****
                $(document).ready(function () {
                    // Fetch data from API
                    fetch('http://localhost:8080/Rest-Service/resources/appointments')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                var tableBody = $('#appointmentsTableBody');

                                // Clear existing table rows
                                tableBody.empty();

                                if (data.length === 0) {
                                    tableBody.append('<tr><td colspan="7">No appointments found</td></tr>');
                                } else {
                                    // Populate table rows with appointments data
                                    data.forEach(function (appointment) {
                                        var row = '<tr>' +
                                                '<td>' + appointment.Aid + '</td>' +
                                                '<td>' + appointment.p_name + '</td>' +
                                                '<td>' + appointment.date + '</td>' +
                                                '<td>' + appointment.time + '</td>' +
                                                '<td>' + appointment.test_Type + '</td>' +
                                                '<td><button class="acceptButton" data-id="' + appointment.Aid + '">Accept</button>\n\
                                                     <button class="rejectButton" data-id="' + appointment.Aid + '">Reject</button></td>' +
                                                '</tr>';
                                        tableBody.append(row);
                                    });

                                    // Add event listener for accept buttons
                                    $('.acceptButton').click(function () {
                                        var appointmentId = $(this).data('id');
                                        // Implement accept logic here, e.g., call an accept API endpoint
                                        console.log('Accepting appointment with ID:', appointmentId);
                                    });

                                    // Add event listener for reject buttons
                                    $('.rejectButton').click(function () {
                                        var appointmentId = $(this).data('id');
                                        // Implement reject logic here, e.g., call a reject API endpoint
                                        console.log('Rejecting appointment with ID:', appointmentId);
                                    });
                                }
                            })
                            .catch(error => {
                                console.error('Error fetching or parsing data:', error);
                                // Handle error, e.g., display a message to the user
                            });
                });


                //****View TestDetails*****
                $(document).ready(function () {
                    // Fetch data from API
                    fetch('http://localhost:8080/Rest-Service/resources/testdetails')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                var tableBody = $('#testDetailsTableBody');

                                // Clear existing table rows
                                tableBody.empty();

                                if (data.length === 0) {
                                    tableBody.append('<tr><td colspan="6">No test details found</td></tr>');
                                } else {
                                    // Populate table rows with appointments data
                                    data.forEach(function (testdetails) {
                                        var row = '<tr>' +
                                                '<td>' + testdetails.testId + '</td>' +
                                                '<td>' + testdetails.patientName + '</td>' +
                                                '<td>' + testdetails.testType + '</td>' +
                                                '<td>' + testdetails.testResult + '</td>' +
                                                '<td>' + testdetails.technician + '</td>' +
                                                '<td>' + testdetails.doctor + '</td>' +
                                                '<td><button class="deleteButton" data-id="' + testdetails.testId + '">Delete</button></td>' +
                                                '</tr>';
                                        tableBody.append(row);
                                    });

                                    // Add event listener for delete buttons
                                    $('.deleteButton').click(function () {
                                        var testId = $(this).data('id');
                                        // Implement delete logic here, e.g., call a delete API endpoint
                                        console.log('Deleting test details with ID:', testId);
                                    });
                                }
                            })
                            .catch(error => {
                                console.error('Error fetching or parsing data:', error);
                                // Handle error, e.g., display a message to the user
                            });
                });


                //****View Payment Details*****
                $(document).ready(function () {
                    // Fetch data from API
                    fetch('http://localhost:8080/Rest-Service/resources/payment')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                var tableBody = $('#paymentTabelBody');

                                // Clear existing table rows
                                tableBody.empty();

                                if (data.length === 0) {
                                    tableBody.append('<tr><td colspan="6">No Payment details found</td></tr>');
                                } else {
                                    // Populate table rows with appointments data
                                    data.forEach(function (payment) {
                                        var row = '<tr>' +
                                                '<td>' + payment.payment_id + '</td>' +
                                                '<td>' + payment.appointment_id + '</td>' +
                                                '<td>' + payment.name + '</td>' +
                                                '<td>' + payment.amount + '</td>' +
                                                '<td>' + payment.payment_date + '</td>' +
                                                '</tr>';
                                        tableBody.append(row);
                                    });
                                }
                            })
                            .catch(error => {
                                console.error('Error fetching or parsing data:', error);
                                // Handle error, e.g., display a message to the user
                            });
                });


                //****View Patient Details*****
                $(document).ready(function () {
                    // Fetch data from API
                    fetch('http://localhost:8080/Rest-Service/resources/patients')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                var tableBody = $('#patientDetailsTabelBody');

                                // Clear existing table rows
                                tableBody.empty();

                                if (data.length === 0) {
                                    tableBody.append('<tr><td colspan="6">No test details found</td></tr>');
                                } else {
                                    // Populate table rows with appointments data
                                    data.forEach(function (patient) {
                                        var row = '<tr>' +
                                                '<td>' + patient.id + '</td>' +
                                                '<td>' + patient.name + '</td>' +
                                                '<td>' + patient.email + '</td>' +
                                                '<td>' + patient.password + '</td>' +
                                                '<td>' + patient.dob + '</td>' +
                                                '<td>' + patient.contact + '</td>' +
                                                '</tr>';
                                        tableBody.append(row);
                                    });
                                }
                            })
                            .catch(error => {
                                console.error('Error fetching or parsing data:', error);
                                // Handle error, e.g., display a message to the user
                            });
                });


            </script>


            <script>
                const reportDetailsUrl = "http://localhost:8080/Rest_service/resources/report/";

                function addReport() {
                    event.preventDefault();
                    let rid = document.getElementById("reportId").value;

                    // Check if the test ID already exists
                    fetch(reportDetailsUrl + rid)
                            .then(response => {
                                if (response.ok) {
                                    alert("Report ID is already in use. Please choose a different ID.");
                                } else {
                                    const person = {
                                        "rid": rid,
                                        "patient_name": document.getElementById("patientName").value,
                                        "pdf_file": document.getElementById("uploadReportFile").value
                                    };

                                    const options = {
                                        method: "POST",
                                        headers: {
                                            "content-type": "application/json"
                                        },
                                        body: JSON.stringify(person)
                                    };

                                    fetch(reportDetailsUrl, options)
                                            .then(response => {
                                                if (response.ok) {
                                                    alert("Report Uploading is successful!");
                                                    document.getElementById("uploadReportForm").reset();
                                                } else {
                                                    throw new Error("Failed to upload report.");
                                                }
                                            })
                                            .catch(error => {
                                                console.error('Error:', error);
                                                alert("An error occurred. Please try again later.");
                                            });
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                alert("An error occurred. Please try again later.");
                            });
                }
            </script>




    </body>
</html>
