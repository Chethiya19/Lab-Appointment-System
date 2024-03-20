<%-- 
    Document   : patientview
    Created on : Mar 17, 2024, 11:23:10 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Appointments</title>
        <!-- Include jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <table id="appointments-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Test Type</th>
                </tr>
            </thead>
            <tbody id="appointments-table-body">
                <!-- Appointments will be populated here -->
            </tbody>
        </table>
        <script>
            $(document).ready(function () {
                $.get("http://localhost:8080/Rest-Service/resources/appointments", function (data) {
                    var appointments = JSON.parse(data);
                    var tableBody = $("#appointments-table-body");
                    appointments.forEach(function (appointment) {
                        var row = "<tr>" +
                                "<td>" + appointment.id + "</td>" +
                                "<td>" + appointment.name + "</td>" +
                                "<td>" + appointment.date + "</td>" +
                                "<td>" + appointment.time + "</td>" +
                                "<td>" + appointment.testType + "</td>" +
                                "</tr>";
                        tableBody.append(row);
                    });
                });
            });
        </script>
    </body>
</html>


