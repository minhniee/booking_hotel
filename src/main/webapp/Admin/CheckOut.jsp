<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check out</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">

</head>
<body>
<%@include file="dashBoardAdmin.jsp"%>
<div class="edit-account-wrapper">
    <h2>Check out room</h2>
    <form class="edit-account-form" action="Checkout" method="post">
        <c:set var="bill" value="${requestScope.bill}" />

        <div class="form-group">
            <label for="username">Bill id</label>
            <input type="text" id="username" name="id" value="${bill.billId}" required readonly/>
        </div>
        <input type="text" id="username" name="accountid" value="${bill.accountId}" required hidden="hidden"/>
        <div class="form-group">
            <label for="username">Booking id</label>
            <input type="text" id="username" name="booking_id" value="${bill.bookingId}" required readonly/>
        </div>

        <div class="form-group">
            <label for="fullname">Amount</label>
            <input type="text" id="fullname" name="amount" value="${bill.totalPrice}" required readonly/>
        </div>


        <div class="form-group">
            <label for="fullname">Material</label>

                <input type="text" id="material" name="material" required/>

        </div>




        <div class="form-group">
            <label for="email">Total amount</label>
            <input type="text" id="quantity" name="total_amount"  required />
        </div>



        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
