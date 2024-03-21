<%-- 
    Document   : reportuplaod
    Created on : Mar 22, 2024, 12:37:40 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
    
    <script>
        //Upload report
            function submitReport() {
                var appointmentId = document.getElementById('appointmentId').value;
                var reportFileInput = document.getElementById('uploadReportFile');
                var reportFile = reportFileInput.files[0];
                if (!appointmentId) {
                    alert('Please enter the Appointment ID.');
                    return;
                }
 
                if (!reportFile) {
                    alert('Please select a PDF report file.');
                    return;
                }
 
                // You can handle the file (e.g., upload to the server) here
                handleReportUpload(appointmentId, reportFile);
            }
 
            function handleReportUpload(appointmentId, reportFile) {
                // Perform any necessary actions here
                // For demonstration purposes, display a success message
                var reportUploadResult = document.getElementById('reportUploadResult');
                reportUploadResult.innerHTML = 'Report uploaded successfully for Appointment ID: ' + appointmentId;
            }
 
            function handleFileSelect(event) {
                var fileInput = event.target;
                var files = fileInput.files;
                if (files.length > 0) {
                    var file = files[0];
                    if (file.type === 'application/pdf') {
                        readPDFFile(file);
                    } else {
                        alert('Please select a valid PDF file.');
                    }
                }
            }
 
            function readPDFFile(file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var pdfContent = e.target.result;
                    // Handle the PDF content, e.g., upload to the server or display it
                    displayPDFContent(pdfContent);
                };
                reader.readAsDataURL(file);
            }
 
            function displayPDFContent(pdfContent) {
                var reportContainer = document.getElementById('report');
                reportContainer.innerHTML = '<embed src="' + pdfContent + '" type="application/pdf" width="100%" height="600px" />';
            }
    </script>
</html>
