<%-- 
    Document   : p-signup
    Created on : Mar 11, 2024, 3:29:29 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Sign Up</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #D4DEE8;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            .signup-container {
                background-color: #F0F2F3;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 400px;
                text-align: center;
            }

            .signup-container h2 {
                color: #333;
            }

            .signup-form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                margin-top: 20px;
            }

            .signup-form label {
                font-weight: bold;
                color: #555;
            }

            .signup-form input {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .signup-form button {
                background-color: #007bff;
                color: #fff;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .signup-form button:hover {
                background-color: #85BBF4;
            }
        </style>

        <script>
            const url = "http://localhost:8080/Rest-Service/resources/patients/";

            function addPatient() {
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

                fetch(url, options)
                        .then(response => {
                            if (response.ok) {
                                alert("Sign-up successful. You can now log in.");
                                window.location.href = "p-login.html";
                            } else {
                                // If the response is not successful, show error message
                                throw new Error("Failed to sign up. Please try again later.");
                            }
                        })
                        .catch(error => {
                            // Catch any errors during the fetch process
                            console.error("Error signing up:", error);
                            alert("Error signing up: " + error.message);
                        });
            }


            function clearPatient() {
                document.getElementById("name").value = "";
                document.getElementById("email").value = "";
                document.getElementById("password").value = "";
                document.getElementById("dob").value = "";
                document.getElementById("contact").value = "";
            }

        </script>
    </head>
    <body>
        <div class="signup-container">
            <h2>Patient Sign Up</h2>
            <form class="signup-form">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>

                <label for="contact">Contact:</label>
                <input type="text" id="contact" name="contact" required>

                <button id='btnGetPatient' onclick='addPatient()'>Sign Up </button>

                <button id='btnClearPatient' onclick='clearPatient()'>Clear</button>

                <label>Already Have an account - <a href="p-login.jsp">Login</a></label>

            </form>
        </div>
    </body>
</html>
