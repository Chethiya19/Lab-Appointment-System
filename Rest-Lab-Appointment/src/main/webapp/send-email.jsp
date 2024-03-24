<%-- 
    Document   : send-email
    Created on : Mar 14, 2024, 11:13:17 AM
    Author     : user
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Email Sender</title>
    </head>
    <body>
        <h1>Email Sender</h1>
        <form id="emailForm">
            <label for="from">From:</label><br>
            <input type="email" id="from" name="from" required><br><br>

            <label for="to">To:</label><br>
            <input type="email" id="to" name="to" required><br><br>

            <label for="subject">Subject:</label><br>
            <input type="text" id="subject" name="subject" required><br><br>

            <label for="body">Body:</label><br>
            <textarea id="body" name="body" required></textarea><br><br>

            <input type="submit" value="Send Email">
        </form>

        <script>
            document.getElementById("emailForm").addEventListener("submit", function (event) {
                event.preventDefault(); // Prevent default form submission

                // Get form data
                var formData = {
                    from: document.getElementById("from").value,
                    to: document.getElementById("to").value,
                    subject: document.getElementById("subject").value,
                    body: document.getElementById("body").value
                };

                // Send data to backend
                fetch('http://localhost:8080/Rest-Service/resources/email/send', {// Adjust the URL here
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(formData),
                })
                        .then(response => {
                            if (response.ok) {
                                alert("Email sent successfully!");
                            } else {
                                alert("Failed to send email.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("Failed to send email.");
                        });
            });
        </script>

    </body>
</html>


