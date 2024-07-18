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
        <h3 class="main--title">Today's data</h3>
     <div class="card--wrapper">
       <div class="payment--card light-red">
             <div class="card--header">
                 <div class="amount">
                    <span class="title">
                        Accept booking
                    </span>
                    <span class="amount-value">$500.00
                    </span>
                 </div>
                 <i class="fas fa-list icon"></i>
             </div>
           <span class="card-detail">

           </span>
       </div>
         <div class="payment--card light-purple">
             <div class="card--header">
                 <div class="amount">
                    <span class="title">
                       Booking status
                    </span>
                     <span class="amount-value">$500.00
                    </span>
                 </div>
                 <i class="fas fa-list icon dark-purple"></i>
             </div>
             <span class="card-detail">

           </span>
         </div>
     </div>
    </div>
    <div class="tabular--wrapper">
        <canvas id="revenueChart" style="height: 20%; "></canvas>
    </div>
</div>

<script>
    // Fetch revenueData from servlet attribute
    let revenueData = JSON.parse('${revenueData}');

    // Function to map numeric month to month name
    function getMonthName(monthNumber) {
        const monthNames = [
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        ];
        return monthNames[monthNumber - 1]; // monthNumber is 1-indexed
    }

    // Extract labels (months) and data (sales)
    let labels = revenueData.map(item => getMonthName(item.month));
    let data = revenueData.map(item => item.totalAmount);

    // Create Chart.js instance
    let ctx = document.getElementById('revenueChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar', // You can use 'line' for a line chart if preferred
        data: {
            labels: labels,
            datasets: [{
                label: 'Revenue',
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.5)', // Blue background
                borderColor: 'rgba(54, 162, 235, 1)', // Solid border color (blue)
                borderWidth: 1 // Border width
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
</script>
</body>
</html>
