<%-- 
    Document   : admin-dashboard
    Created on : Mar 15, 2024, 3:32:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
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
                transition: transform 0.5s ease;
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
                transition: all 0.3s ease;
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
            #managePatientsContent,
            #manageTechniciansContent {
                margin-top: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 20px;
                display: none;
                background-color: #f4f4f4;
            }

            #managePatientForm {
                max-width: 900px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 15px;
            }

            .form-group {
                flex: 1;
                margin-right: 10px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="email"],
            input[type="password"],
            input[type="date"],
            input[type="tel"],
            button[type="submit"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
            }

            button[type="submit"] {
                background-color: #4caf50;
                color: white;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button[type="submit"]:hover {
                background-color: #45a049;
            }

            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="password"]:focus,
            input[type="date"]:focus,
            input[type="tel"]:focus {
                border-color: #4a90e2;
                box-shadow: 0 0 5px #4a90e2;
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

            
            #addPatient,
            #addTechnician,
            #searchPatient,
            #searchTechnician{
                background-color: #f2f2f2;
                padding: 20px;
                margin-left: 5%;
                width: 90%;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            #searchPatientform,
            #searchTechnicianform {
                margin-top: 20px;
            }

            #searchPatient label,
            #searchTechnician label {
                font-weight: bold;
            }

            #searchPatient input[type="text"],
            #searchTechnician input[type="text"]{
                width: 30%;
                padding: 8px;
                margin: 5px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            #searchPatient button,
            #searchTechnician button{
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #searchPatient button:hover,
            #searchTechnician button:hover {
                background-color: #45a049;
            }

        </style>

        <script>
            const url = "http://localhost:8080/Rest-Service/resources/patients/";

            function getPatient() {
                event.preventDefault();

                let id = document.getElementById("Id").value;

                if (id.trim() === "") {
                    alert("Please enter the Patient ID.");
                    return;
                }

                const url = "http://localhost:8080/Rest-Service/resources/patients/";

                const options = {
                    method: "GET"
                };

                fetch(url + id, options)
                        .then(res => {
                            if (!res.ok) {
                                throw new Error("Patient details not found");
                            }
                            return res.json();
                        })
                        .then(data => {
                            document.getElementById("name").value = data.name;
                            document.getElementById("email").value = data.email;
                            document.getElementById("password").value = data.password;
                            document.getElementById("dob").value = data.dob;
                            document.getElementById("contact").value = data.contact;
                        })
                        .catch(error => {
                            alert(error.message);
                            document.getElementById("managePatientForm").reset();
                        });
            }

            function addPatient(event) {
                event.preventDefault();

                let email = document.getElementById("email").value;
                const url = 'http://localhost:8080/Rest-Service/resources/patients/';
                fetch(url + email)
                        .then(response => {
                            if (response.ok) {
                                // Email already exists, display alert
                                alert("Email is already in use. Please choose a different Email.");
                            } else {
                                // Email is not in use, proceed to add patient
                                const person = {
                                    "name": document.getElementById("name").value,
                                    "email": document.getElementById("email").value,
                                    "password": document.getElementById("password").value,
                                    "dob": document.getElementById("dob").value,
                                    "contact": document.getElementById("contact").value
                                };

                                const options = {
                                    method: "POST",
                                    headers: {
                                        "content-type": "application/json"
                                    },
                                    body: JSON.stringify(person)
                                };

                                return fetch(url, options);
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                alert("Patient details added successfully!");
                                document.getElementById("managePatientForm").reset();
                            } else {
                                // Test addition failed
                                throw new Error("Failed to add Patient.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }



            function updatePatient() {
                event.preventDefault();

                let id = document.getElementById("Id").value;
                const person = {
                    "id": id,
                    "name": document.getElementById("name").value,
                    "email": document.getElementById("email").value,
                    "password": document.getElementById("password").value,
                    "dob": document.getElementById("dob").value,
                    "contact": document.getElementById("contact").value
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
                                alert("Patient updated successfully!");
                                document.getElementById("managePatientForm").reset();
                            } else {
                                throw new Error('Failed to update patient. Please try again.');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert(error.message);
                        });
            }


            function deleteTest(event) {
                event.preventDefault();

                let id = document.getElementById("Id").value;

                if (!id) {
                    alert("Please enter a valid Patient ID.");
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
                                throw new Error("Patient ID does not exist.");
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                alert("Patient details deleted successfully!");
                                document.getElementById("managePatientForm").reset();
                            } else {
                                throw new Error("Failed to delete data.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Failed to delete data. " + error.message);
                        });
            }

            function clearPatient() {
                document.getElementById("Id").value = "";
                document.getElementById("name").value = "";
                document.getElementById("email").value = "";
                document.getElementById("password").value = "";
                document.getElementById("dob").value = "";
                document.getElementById("contact").value = "";
            }


        </script>

        <script>
            const url = "http://localhost:8080/Rest-Service/resources/technicians/";

            function getTechnician(event) {
                event.preventDefault();

                let id = document.getElementById("id").value;

                if (id.trim() === "") {
                    alert("Please enter the Technician ID.");
                    return;
                }

                const options = {
                    method: "GET"
                };

                fetch(url + id, options)
                        .then(res => {
                            if (!res.ok) {
                                throw new Error("Technician details not found");
                            }
                            return res.json();
                        })
                        .then(data => {
                            document.getElementById("t_name").value = data.name;
                            document.getElementById("t_email").value = data.email;
                            document.getElementById("t_password").value = data.password;
                            document.getElementById("t_dob").value = data.dob;
                            document.getElementById("t_contact").value = data.contact;
                        })
                        .catch(error => {
                            alert(error.message);
                            document.getElementById("manageTechnicianForm").reset();
                        });
            }

            function addTechnician(event) {
                event.preventDefault();

                let email = document.getElementById("t_email").value;
                const url = 'http://localhost:8080/Rest-Service/resources/technicians/';

                fetch(url + email)
                        .then(response => {
                            if (response.ok) {
                                // Email already exists, display alert
                                alert("Email is already in use. Please choose a different Email.");
                            } else {
                                // Email is not in use, proceed to add technician
                                const technicianData = {
                                    "name": document.getElementById("t_name").value,
                                    "email": document.getElementById("t_email").value,
                                    "password": document.getElementById("t_password").value,
                                    "dob": document.getElementById("t_dob").value,
                                    "contact": document.getElementById("t_contact").value
                                };

                                const options = {
                                    method: "POST",
                                    headers: {
                                        "content-type": "application/json"
                                    },
                                    body: JSON.stringify(technicianData)
                                };

                                return fetch(url, options);
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                alert("Technician details added successfully!");
                                document.getElementById("manageTechnicianForm").reset();
                            } else {
                                // Addition failed
                                throw new Error("Failed to add Technician.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }


        </script>



    </head>
    <body>
        <!-- Admin Dashboard Header -->
        <div class="header fixed-header">
            <div class="menu-icon" onclick="toggleSideMenu()">
                <!-- Menu Icon (You can replace this with an actual menu icon image) -->
                &#9776;
            </div>
            <div>
                <h1>Admin Dashboard</h1>
            </div>
            <div class="logout-btn">
                <button onclick="logout()">Logout</button>
            </div>
        </div>
        <!-- Admin Dashboard Content -->
        <div class="container">
            <div class="side-menu fixed-side-menu" id="sideMenu">
                <!-- Admin Dashboard Side Menu -->
                <div class="menu-item">
                    <a href="#" onclick="showManagePatients()">Manage Patients</a>
                </div><hr>
                <div class="menu-item">
                    <a href="#" onclick="showManageTechnicians()">Manage Technicians</a>
                </div><hr>
            </div>
            <div class="content">
                <div id="managePatientsContent">
                    <!-- Manage Patients Section -->
                    <h2 class="dashboard-heading">Manage Patients</h2>
                    <div id="searchPatient">
                        <h2>Search Patients by ID</h2>
                        <form id="searchPatientform" method="GET">
                            <label for="Id">Enter Patient ID:</label>
                            <input type="text" id="Id" name="Id" placeholder="Patient ID..." required><br><br>
                            <button id='btngetPatient' onclick='getPatient(event)'>Get By ID</button>
                            <button id='btndeletePatient' onclick='deletePatient(event)'>Delete</button>
                        </form>
                    </div><br>
                    <div id="addPatient">
                        <h2>Add Patients</h2>
                        <form id="managePatientForm">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <input type="text" id="name" name="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" id="email" name="email" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" id="password" name="password" required>
                                </div>
                                <div class="form-group">
                                    <label for="dob">Date of Birth:</label>
                                    <input type="date" id="dob" name="dob" required>
                                </div>
                                <div class="form-group">
                                    <label for="contact">Contact:</label>
                                    <input type="tel" id="contact" name="contact" required>
                                </div>
                            </div>
                            <!--                        <button type="submit">Submit</button>-->

                            <button id='btnaddPatient' onclick='addPatient(event)'>Add</button>
                            <button id='btnupdatePatient' onclick='updatePatient(event)'>Update</button>
                            <button id='btndeletePatient' onclick='deletePatient(event)'>Delete</button>

                            <button id='btnclearPatient' onclick='clearPatient()'>Clear</button>
                        </form>
                    </div>
                </div>

                <div id="manageTechniciansContent">
                    <!-- Manage Technicians Section -->
                    <h2 class="dashboard-heading">Manage Technicians</h2>
                    <!-- Add functionality to manage technicians here -->
                    <div id="searchTechnician">
                        <h2>Search Technicians by ID</h2>
                        <form id="searchTechnicianform" method="GET">
                            <label for="Id">Enter Technicians ID:</label>
                            <input type="text" id="Tid" name="Tid" placeholder="Technician ID..." required><br><br>
                            <button id='btngetTechnician' onclick='getTechnician()'>Get By ID</button>
                        </form>
                    </div><br>
                    <div id="addTechnician">
                        <h2>Add Technicians</h2>
                        <form id="manageTechnicianForm">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <input type="text" id="t_name" name="t_name" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" id="t_email" name="t_email" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" id="t_password" name="t_password" required>
                                </div>
                                <div class="form-group">
                                    <label for="dob">Date of Birth:</label>
                                    <input type="date" id="t_dob" name="t_dob" required>
                                </div>
                                <div class="form-group">
                                    <label for="contact">Contact:</label>
                                    <input type="tel" id="t_contact" name="t_contact" required>
                                </div>
                            </div>
                            <!--                        <button type="submit">Submit</button>-->

                            <button id='btnaddTechnician' onclick='addTechnician(event)'>Add</button>
                            <button id='btnupdateTechnician' onclick='updateTechnician(event)'>Update</button>
                            <button id='btndeleteTechnician' onclick='deleteTechnician(event)'>Delete</button>

                            <button id='btnclearTechnician' onclick='clearTechnician()'>Clear</button>
                        </form>
                    </div>
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
            showManagePatients();
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
            // Implement logout functionality here
            // Redirect to logout URL or clear session
            alert("Logging out...");
        }

        function showManagePatients() {
            var managePatientsContent = document.getElementById("managePatientsContent");
            var manageTechniciansContent = document.getElementById("manageTechniciansContent");
            managePatientsContent.style.display = "block";
            manageTechniciansContent.style.display = "none";
        }

        function showManageTechnicians() {
            var managePatientsContent = document.getElementById("managePatientsContent");
            var manageTechniciansContent = document.getElementById("manageTechniciansContent");
            managePatientsContent.style.display = "none";
            manageTechniciansContent.style.display = "block";
        }
    </script>
</body>
</html>
