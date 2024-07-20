<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/25/2024
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="${url}/Assets/css/styleDashboard.css">
<%@include file="dashBoardAdmin.jsp"%>
    <title>Dashboard</title>
</head>
<body>


<div class="main-content">

    <div class="card--container">

     <div class="card--wrapper">
       <div class="payment--card light-green">
           <h3 class="main--title">Monthly revenue of bookings</h3>
           <canvas id="chartForBillDetail" style="height: 20%; "></canvas>
       </div>
         <div class="payment--card light-purple">
             <h3 class="main--title">Monthly revenue of services</h3>
             <canvas id="getChartBillService" style="height: 20%; "></canvas>
         </div>
     </div>
    </div>
    <div class="tabular--wrapper">
        <h3 class="main--title">Total monthly revenue</h3>
      <canvas id="revenueChart" style="height: 20%; "></canvas>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        let revenueData = JSON.parse('${revenueData}');
        let labels = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

        // Monthly Revenue Chart
        let data = new Array(12).fill(0);
        revenueData.forEach(item => {
            let monthIndex = item.month - 1;
            data[monthIndex] = item.totalAmount;
        });
        let ctxRevenue = document.getElementById('revenueChart').getContext('2d');
        new Chart(ctxRevenue, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Total monthly revenue',
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(0, 0, 0, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Monthly Revenue of Bookings Chart
        let getChartBillBooking = JSON.parse('${getChartBillBooking}');
        let dataBill = new Array(12).fill(0);
        getChartBillBooking.forEach(item => {
            let monthIndex = item.month - 1;
            dataBill[monthIndex] = item.totalAmount;
        });
        let ctxBill = document.getElementById('chartForBillDetail').getContext('2d');
        new Chart(ctxBill, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Revenue of bookings',
                    data: dataBill,
                    backgroundColor: 'rgba(0, 0, 0, 0.5)',
                    borderColor: 'rgba(0, 0, 0, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Monthly Revenue of Services Chart
        let getChartBillService = JSON.parse('${getChartBillService}');
        let dataBillService = new Array(12).fill(0);
        getChartBillService.forEach(item => {
            let monthIndex = item.month - 1;
            dataBillService[monthIndex] = item.totalAmount;
        });
        let ctxService = document.getElementById('getChartBillService').getContext('2d');
        new Chart(ctxService, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Revenue of services',
                    data: dataBillService,
                    backgroundColor: 'rgba(255, 255, 255, 1)',
                    borderColor: 'rgba(0, 0, 0, 1)',

                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });
</script>
</body>
</html>
