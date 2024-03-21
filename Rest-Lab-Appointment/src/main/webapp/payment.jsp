<%-- 
    Document   : payment.jsp
    Created on : Mar 21, 2024, 5:51:38 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
        
        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-color: #0C4160;

                padding: 30px 10px;
            }

            .card {
                max-width: 500px;
                margin: auto;
                color: black;
                border-radius: 20px;
            }

            p {
                margin: 0px;
            }

            .container .h8 {
                font-size: 30px;
                font-weight: 800;
                text-align: center;
            }

            .btn.btn-primary {
                width: 100%;
                height: 70px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 15px;
                background-image: linear-gradient(to right, #77A1D3 0%, #79CBCA 51%, #77A1D3 100%);
                border: none;
                transition: 0.5s;
                background-size: 200% auto;

            }


            .btn.btn.btn-primary:hover {
                background-position: right center;
                color: #fff;
                text-decoration: none;
            }



            .btn.btn-primary:hover .fas.fa-arrow-right {
                transform: translate(15px);
                transition: transform 0.2s ease-in;
            }

            .form-control {
                color: white;
                background-color: #223C60;
                border: 2px solid transparent;
                height: 60px;
                padding-left: 20px;
                vertical-align: middle;
            }

            .form-control:focus {
                color: white;
                background-color: #0C4160;
                border: 2px solid #2d4dda;
                box-shadow: none;
            }

            .text {
                font-size: 14px;
                font-weight: 600;
            }

            ::placeholder {
                font-size: 14px;
                font-weight: 600;
            }
        </style>
    </head>
    <div class="container p-0">
        <div class="card px-4">
            <p class="h8 py-3">Payment Details</p>
            <div class="row gx-3">
                <div class="col-12">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">Person Name</p>
                        <input class="form-control mb-3" type="text" placeholder="Name">
                    </div>
                </div>
                <div class="col-12">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">Card Number</p>
                        <input class="form-control mb-3" type="text" placeholder="XXXX XXXX XXXX XXXX">
                    </div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">Expiry</p>
                        <input class="form-control mb-3" type="text" placeholder="MM/YYYY">
                    </div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">CVV/CVC</p>
                        <input class="form-control mb-3 pt-2 " type="password" placeholder="***">
                    </div>
                </div>
                <div class="col-12">
                    <div class="btn btn-primary mb-3">
                        <span class="ps-3">Pay Rs.1500</span>
                        <span class="fas fa-arrow-right"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
