<%-- 
    Document   : send-email
    Created on : Mar 14, 2024, 11:13:17 AM
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.mail.*,jakarta.mail.internet.*" %>
<%@ page import="jakarta.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Email</title>
</head>
<body>
    <h1>Send Email</h1>
    <form action="sendEmail" method="post">
        To: <input type="text" name="toEmail"><br>
        Subject: <input type="text" name="subject"><br>
        Message: <textarea name="message" rows="5" cols="40"></textarea><br>
        <input type="submit" value="Send">
    </form>
</body>
</html>

