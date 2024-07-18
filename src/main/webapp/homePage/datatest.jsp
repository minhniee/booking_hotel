<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/17/2024
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<form action="vnpayRefund" method="post">--%>
<%--<input type="hidden" name="order_id" value="${l.id}"> <!-- booking id -->--%>
<%--<input type="hidden" name="amount" value="${l.bookingPrice}"> <!-- amount-->--%>
<%--<input type="hidden" name="trantype" value="02"> <!-- account id -->--%>
<%--<input type="hidden" name="trans_date" value='<fmt:formatDate pattern="yyyyMMddHHmmss" value="${l.bookingDate}"/>' />--%>
<%--<!-- account id -->--%>
<%--<button type="submit" name="action" value="reject" class="btn btn-danger">Reject</button>--%>
<%--</form>--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Refund</title>
  <!-- Bootstrap core CSS -->
  <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
  <!-- Custom styles for this template -->
  <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
</head>

<body>

<div class="container">
  <div class="header clearfix">

    <h3 class="text-muted">VNPAY DEMO</h3>
  </div>
    <h4>${noti}</h4>
  <h3>Refund</h3>
  <div class="table-responsive">
    <form action="vnpayRefund" id="frmrefund" method="Post">
        <input type="text" value="${account.id}" name="accountId">
        <div class="form-group">
          <label for="order_id">Mã giao dịch cần hoàn (Giá trị của vnp_TxnRef)</label>
        <input class="form-control" id="order_id"
               name="order_id" type="text"/>
      </div>
<%--      <div class="form-group">--%>
<%--        <label for="amount">Số tiền hoàn</label>--%>
<%--        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="10000" />--%>
<%--      </div>--%>
<%--      <div class="form-group">--%>
<%--        <label for="trantype">Kiểu hoàn tiền</label>--%>
<%--        <select name="trantype" id="trantype" class="form-control">--%>
<%--          <option value="02">Hoàn tiền toàn phần</option>--%>
<%--          <option value="03">Hoàn tiền một phần</option>--%>
<%--        </select>--%>
<%--      </div>--%>
<%--      <div class="form-group">--%>
<%--        <label for="trans_date">Thời gian khởi tạo giao dịch (Giá trị của vnp_CreateDate yêu cầu thanh toán)</label>--%>
<%--        <input class="form-control" id="trans_date"--%>
<%--               name="trans_date" type="text" placeholder="yyyyMMddHHmmss"/>--%>
<%--      </div>--%>
<%--      <div class="form-group">--%>
<%--        <label for="user">User khởi tạo hoàn</label>--%>
<%--        <input class="form-control" id="user"--%>
<%--               name="user" type="text"/>--%>
<%--      </div>--%>
      <div class="form-group">
        <button type="submit" class="btn btn-primary">Refund</button>
      </div>
    </form>
    <p>
      &nbsp;
    </p>
    <footer class="footer">
      <p>&copy; VNPAY 2020</p>
    </footer>
  </div>
</div>
</body>
</html>
