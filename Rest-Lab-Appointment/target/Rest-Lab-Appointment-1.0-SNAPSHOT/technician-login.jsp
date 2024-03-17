<%-- 
    Document   : technician-login
    Created on : Mar 11, 2024, 3:35:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technician Login</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #D4DEE8;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .login-container {
                background-color: #F0F2F3;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
            }
            .login-container h1 {
                font-size: 28px;
                margin-bottom: 20px;
                color: #333333;
            }
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .login-container button[type="submit"] {
                width: 100%;
                background-color: #007bff;
                color: white;
                padding: 14px 0;
                margin: 10px 0;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            .login-container button[type="submit"]:hover {
                background-color: #85BBF4;
            }
            .message {
                margin-top: 20px;
                color: #ff3333;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Technician Login</h1>
            <form id="loginForm">
                <input type="text" id="username" name="username" placeholder="Username" required><br>
                <input type="password" id="password" name="password" placeholder="Password" required><br>
                <button type="submit">Login</button>
            </form>
            <div id="message" class="message"></div>
        </div>

        <script>
            document.getElementById("loginForm").addEventListener("submit", function (event) {
                event.preventDefault(); // Prevent form submission
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;

                // Check if username and password are correct
                if (username === "tec" && password === "123") {
                    // If correct, redirect to desired page or perform any other action
                    window.location.href = "http://localhost:8080/Rest-Lab-Appointment/technician-dashboard.jsp";
                } else {
                    // If incorrect, display error message
                    document.getElementById("message").textContent = "Invalid username or password";
                }
            });
        </script>
    </body>
</html>
