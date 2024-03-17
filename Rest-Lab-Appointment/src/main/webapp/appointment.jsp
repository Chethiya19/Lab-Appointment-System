<%-- 
    Document   : appointment
    Created on : Mar 11, 2024, 4:50:24 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Make an Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #D4DEE8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #F0F2F3;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 900px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #666;
            margin-bottom: 30px;
            font-size: 25px;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #85BBF4;
        }

        button:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Make an Appointment</h1>
        <p>To make an appointment, first, you should log in to the ABC Laboratory system.</p>
        <button onclick="signup()">Click to Sign up</button>
        <button onclick="login()">Click to Login</button>
    </div>
    
    <script>
        function login() {
            // Redirect to the login page
            window.location.href = "p-login.jsp";
        }
        function signup() {
            // Redirect to the login page
            window.location.href = "p-signup.jsp";
        }
    </script>
</body>
</html>
