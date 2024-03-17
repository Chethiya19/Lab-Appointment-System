<%-- 
    Document   : login
    Created on : Mar 17, 2024, 3:37:43 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h2>Login</h2>
        <form id="loginForm" onsubmit="return login()">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            <input type="submit" value="Login">
        </form>
        <div id="message"></div>

        <script>
            function login() {
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;

                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/Rest-Lab-Appointment/login.jsp?email=" + email + "&password=" + password, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        document.getElementById("message").innerHTML = xhr.responseText;
                    } else if (xhr.status === 401) {
                        document.getElementById("message").innerHTML = "Invalid email or password";
                    } else {
                        document.getElementById("message").innerHTML = "Error: " + xhr.status;
                    }
                };
                xhr.send();
                return false;
            }
        </script>
    </body>
</html>

