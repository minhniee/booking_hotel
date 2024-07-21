
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <title>Dashboard</title>
</head>
<body>
<div class="sidebar">
    <div class="logo"></div>
    <ul class="menu">
        <li class="active">
            <a href="#" >
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="profileStaff.jsp">
                <i class="fas fa-user"></i>
                <span>Profile</span>
            </a>
        </li>
        <li>
            <a href="ViewService">
                <i class="fas fa-chart-bar"></i>
                <span>Service</span>
            </a>
        </li>
        <li>
            <a href="ViewMaterial">
                <i class="fas fa-briefcase"></i>
                <span>Material</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fas fa-question-circle"></i>
                <span>FAQ</span>
            </a>
        </li>
        <li>
            <a href="roomManager">
                <i class="fas fa-cog"></i>
                <span>Room</span>
            </a>
        </li>
        <li>
            <a href="customerInfo">
                <i class="fas fa-star"></i>
                <span>Customer</span>
            </a>
        </li>
        <li class="logout">
            <a href="logout">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </li>
    </ul>
</div>

<div class="main--content">
    <div class="header--wrapper">
        <div class="header--title">
            <span>Primary</span>
            <h2>Dashboard</h2>
        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search"/>
            </div>
            <img src="Assets/image/staff/Staff.jpg" alt="">
        </div>
    </div>
    <div class="card--container">
        <h3 class="main--title">Today's data</h3>
        <div class="card--wrapper">
            <div class="payment--card light-red">
                <div class="card--header">
                    <div class="amount">
                    <span class="title">
                        Payment amount
                    </span>
                        <span class="amount-value">$500.00
                    </span>
                    </div>
                    <i class="fas fa-dollar-sign icon"></i>
                </div>
                <span class="card-detail">
                       **** **** **** 3484
           </span>
            </div>
            <div class="payment--card light-purple">
                <div class="card--header">
                    <div class="amount">
                    <span class="title">
                        Payment order
                    </span>
                        <span class="amount-value">$500.00
                    </span>
                    </div>
                    <i class="fas fa-list icon dark-purple"></i>
                </div>
                <span class="card-detail">
                       **** **** **** 3484
           </span>
            </div>
            <div class="payment--card light-blue">
                <div class="card--header ">
                    <div class="amount">
                    <span class="title">
                        Payment customer
                    </span>
                        <span class="amount-value">$500.00
                    </span>
                    </div>
                    <i class="fas fa-users icon dark-blue"></i>
                </div>
                <span class="card-detail">
                       **** **** **** 3484
           </span>
            </div>
            <div class="payment--card light-green">
                <div class="card--header">
                    <div class="amount">
                    <span class="title">
                        Payment process
                    </span>
                        <span class="amount-value">$500.00
                    </span>
                    </div>
                    <i class="fas fa-check icon dark-green"></i>
                </div>
                <span class="card-detail">
                       **** **** **** 3484
           </span>
            </div>
        </div>
    </div>
    <div class="tabular--wrapper">


        <canvas id="myChart" width="400" height="400"></canvas>



    </div>

</div>
<script>
    // Function to fetch data from servlet
    function fetchData() {
        fetch('chartData')
            .then(response => response.json())
            .then(data => {
                // Prepare data for Chart.js
                const labels = data.map(point => point.month);
                const values = data.map(point => point.totalAmount);

                // Create chart
                const ctx = document.getElementById('myChart').getContext('2d');
                const myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Total Amount Billed',
                            data: values,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        },
                        plugins: {
                            legend: {
                                display: true,
                                labels: {
                                    color: 'rgb(255, 99, 132)'
                                }
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    // Call fetchData() to fetch data and render the chart
    fetchData();
</script>
</body>
</html>
