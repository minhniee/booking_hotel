<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Refund</title>
    <!-- Bootstrap core CSS -->
    <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 0;
            position: relative; /* Để đảm bảo liên kết có thể được định vị chính xác */
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h3 {
            margin: 0;
            font-size: 24px;
            font-weight: 700;
            color: #007bff; /* Màu tiêu đề nổi bật */
        }

        .header h4 {
            font-size: 18px;
            color: #6c757d;
        }

        h3 {
            font-size: 22px;
            margin-bottom: 20px;
            color: #343a40; /* Màu chữ cho tiêu đề chính */
        }

        .table-responsive {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: 500;
            display: block;
            margin-bottom: 5px;
            color: #343a40; /* Màu chữ cho nhãn */
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
        }

        .footer p {
            margin: 0;
            font-size: 14px;
            color: #6c757d;
        }

        .form-check-inline {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-check-label {
            margin-left: 10px;
            color: #343a40; /* Màu chữ cho nhãn checkbox */
        }

        .terms-text {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .terms-text ul {
            margin: 0;
            padding-left: 20px;
            list-style: disc;
        }

        .terms-text ul li {
            margin-bottom: 5px;
            color: #dc3545; /* Màu đỏ nổi bật cho các điều khoản */
        }

        .alert-info {
            background-color: #d9edf7;
            color: #31708f;
            border: 1px solid #bce8f1;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .back-to-home {
            position: absolute;
            top: 20px; /* Khoảng cách từ trên cùng */
            left: 20px; /* Khoảng cách từ bên trái */
            font-size: 16px;
            color: #007bff; /* Màu sắc liên kết */
            text-decoration: none; /* Loại bỏ gạch chân */
            padding: 10px 15px;
            border: 1px solid #007bff; /* Viền quanh liên kết */
            border-radius: 4px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .back-to-home:hover,
        .back-to-home:focus {
            background-color: #007bff; /* Màu nền khi hover */
            color: #fff; /* Màu chữ khi hover */
            text-decoration: none; /* Đảm bảo không có gạch chân khi hover */
        }
    </style>
    <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="container">
    <div class="header clearfix">
        <h3 class="text-muted">VNPAY DEMO</h3>
    </div>
    <!-- Display notification if available -->
    <%
        String noti = (String) request.getAttribute("noti");
        if (noti != null && !noti.isEmpty()) {
    %>
    <div class="alert alert-info" role="alert">
        <%= noti %>
    </div>
    <%
        }
    %>
    <h3>Refund</h3>
    <div class="table-responsive">
        <form action="vnpayRefund" id="frmrefund" method="Post">
            <input type="hidden" value="${account.id}" name="accountId">

            <div class="form-group">
                <label for="order_id">Refund transaction code (BookingID)</label>
                <input class="form-control" id="order_id" name="order_id" type="text" required/>
            </div>

            <div class="form-group">
                <div class="terms-text">
                    <p>Refund service terms:</p>
                    <ul>
                        <li>If you cancel your reservation within 7 days from the previous check-in date, you will not receive a refund.</li>
                        <li>If you cancel your reservation within 7-15 days from the previous check-in date, you will receive a 50% refund of the reservation amount.</li>
                        <li>If you cancel your reservation 15 days before the previous check-in date, you will receive a 100% refund of the reservation amount.</li>
                    </ul>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="terms" required>
                    <label class="form-check-label" for="terms">
                        I agree to the terms and confirm the refund
                    </label>
                </div>
                <button type="submit" class="btn btn-primary" id="refundButton" disabled>Refund</button>
            </div>
        </form>
    </div>
    <footer class="footer">
        <p>&copy; VNPAY 2020</p>
    </footer>
    <a href="${url}/bookingHistory" class="back-to-home">&laquo; Back to Home</a>
</div>
<script>
    document.getElementById('terms').addEventListener('change', function() {
        var refundButton = document.getElementById('refundButton');
        refundButton.disabled = !this.checked;
    });
</script>
</body>
</html>
