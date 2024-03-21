<%-- 
    Document   : newjsp
    Created on : Mar 11, 2024, 9:10:54 AM
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
        <div id="paymentForm" style="display: none;">
            <form>
                <h2>Payment Form</h2>
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber">

                <label for="cardHolderName">Cardholder Name:</label>
                <input type="text" id="cardHolderName" name="cardHolderName">

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv">

                <label for="expiryDate">Expiration Date:</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YYYY">

                <button type="button" onclick="submitPayment()">Submit Payment</button>
            </form>
        </div>

    </body>
</html>
