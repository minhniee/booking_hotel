<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/14/2024
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="images/favicon.png" rel="icon" />
    <title>Hotel Booking Invoice - Koice</title>
    <meta name="author" content="harnishdesign.net">

    <!-- Web Fonts
    ======================= -->
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type='text/css'>

    <!-- Stylesheet
    ======================= -->
    <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/stylesheet.css"/>
</head>
<body>
<!-- Container -->
<div class="container-fluid invoice-container">
    <!-- Header -->
    <header>
        <div class="row align-items-center gy-3">
            <div class="col-sm-7 text-center text-sm-start"> <img id="logo" src="images/logo.png" title="Koice" alt="Koice" /> </div>
            <div class="col-sm-5 text-center text-sm-end">
                <h4 class="mb-0">Invoice</h4>
                <p class="mb-0">Invoice Number - ${vnp_TxnRef}</p>
            </div>
        </div>
        <hr>
    </header>

    <!-- Main Content -->
    <main>
        <div class="row">
            <div class="col-sm-6 mb-3"> <strong>Full Name:</strong> <span>${account.fullName}</span> </div>
            <div class="col-sm-6 mb-3 text-sm-end"> <strong>Booking Date:</strong> <span>${invoiceDate}</span> </div>
        </div>
        <hr class="mt-0">
        <div class="row">
            <div class="col-sm-5"> <strong>Hotel Details:</strong>
                <address>
                    The Orchid Hotel<br />
                    Plot No.3, Nr. HDFC Bank, Ashram Road<br />
                    Ahmedabad, Gujarat,<br />
                    India.
                </address>
            </div>
            <div class="col-sm-7">
                <div class="row">
                    <div class="col-sm-4"> <strong>Check In:</strong>
                        <p>${checkInDate}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Check Out:</strong>
                        <p>${checkOutDate}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Rooms:</strong>
                        <p>${roomId}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Booking ID:</strong>
                        <p>${bookingID}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Payment Mode:</strong>
                        <p>Credit Card</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table border mb-0">
                <thead>
                <tr class="bg-light">
                    <td class="col-6"><strong>Description</strong></td>
                    <td class="col-4 text-end"><strong>Rate</strong></td>
                    <td class="col-2 text-end"><strong>Amount</strong></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="col-6">Room Charges</td>
                    <td class="col-4 text-end">$${basePrice} X ${nights} Night X 1 Rooms</td>
                    <td class="col-2 text-end">$${basePrice* nights}.00</td>
                </tr>
                <tr>
                    <td>Other Charges</td>
                    <td class="text-end">0</td>
                    <td class="text-end">0</td>
                </tr>
<%--                <tr>--%>
<%--                    <td>Promotional Code</td>--%>
<%--                    <td class="text-end">SUMMERFUN - <span class="text-1">20.00% One Time Discount</span></td>--%>
<%--                    <td class="text-end">-$100.00</td>--%>
<%--                </tr>--%>
                </tbody>
            </table>
        </div>
        <div class="table-responsive">
            <table class="table border border-top-0 mb-0">
                <tr class="bg-light">
                    <td colspan="2" class="text-end"><strong>Sub Total:</strong></td>
                    <td class="col-sm-2 text-end">$${basePrice* nights}.00</td>
                </tr>
                <tr class="bg-light">
                    <td colspan="2" class="text-end"><strong>Tax(10%):</strong></td>
                    <td class="col-sm-2 text-end">${basePrice* nights*0.1}.00</td>
                </tr>
                <tr class="bg-light">
                    <td colspan="2" class="text-end border-bottom-0"><strong>Total:</strong></td>
                    <td class="col-sm-2 text-end border-bottom-0">$${basePrice* nights*0.1+basePrice* nights}.00</td>
                </tr>
            </table>
        </div>
        <br>
        <p class="text-1 text-muted"><strong>Please Note:</strong> Amount payable is inclusive of central & state goods & services Tax act applicable slab rates. Please ask Hotel for invoice at the time of check-out.</p>
    </main>
    <!-- Footer -->
    <footer class="text-center">
        <hr>
        <p class="lh-base"><strong>Koice Inc.</strong><br>
            4th Floor, Plot No.22, Above Public Park, 145 Murphy Canyon Rd,<br>
            Suite 100-18, San Diego CA 2028. </p>
        <hr>
        <p class="text-1"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>
        <div class="btn-group btn-group-sm d-print-none"> <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none"><i class="fa fa-print"></i> Print & Download</a> </div>
    </footer>
</div>
<!-- Back to My Account Link -->
<p class="text-center d-print-none"><a href="${url}user/user_profile.jsp">&laquo; Back to My Account</a></p>
</body>
</html>