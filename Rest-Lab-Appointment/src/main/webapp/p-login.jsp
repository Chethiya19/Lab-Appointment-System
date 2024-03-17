<%-- 
    Document   : p-login
    Created on : Mar 11, 2024, 3:27:11 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Login</title>
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
            .login-container input[type="email"],
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

        <script>
            function checkLogin() {
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8080/Rest-Service/resources/login", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var response = JSON.parse(xhr.responseText);
                            if (response.success) {
                                // Login successful, redirect to the patient dashboard
                                window.location.href = "p-dashboard.jsp";
                            } else {
                                document.getElementById("message").innerHTML = response.message;
                            }
                        } else {
                            document.getElementById("message").innerHTML = "An error occurred. Please try again later.";
                        }
                    }
                };
                var data = JSON.stringify({email: email, password: password});
                xhr.send(data);
                return false; // Prevent the form from submitting
            }
        </script>

    </head>
    <body>
        <div class="login-container">
            <h1>Patient Login</h1>
            <form id="loginForm" onsubmit="return checkLogin()">
                <input type="email" id="email" name="email" placeholder="Email" required><br>
                <input type="password" id="password" name="password" placeholder="Password" required><br>
                <button type="submit">Login</button>
                <label>Don't you have an account - <a href="p-signup.jsp">Sign up</a></label>
            </form>
            <div id="message" class="message"></div>
        </div>

    </body>
</html>
