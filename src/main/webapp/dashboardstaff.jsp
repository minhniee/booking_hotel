<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="Assets/css/styleDashboard.css">
        <title>Title</title>
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
                    <a href="#">
                        <i class="fas fa-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-chart-bar"></i>
                        <span>Statistics</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-briefcase"></i>
                        <span>Careers</span>
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
                    <img src="images/Staff.jpg" alt="">
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



                <h3 class="main--title">List Account</h3>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User name</th>

                                <th>Full name</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Gender</th>
                                <th>Phone</th>
                                <th>DOB</th>
                                <th>Address</th>
                                <th>Action</th>
                            </tr>
                        <tbody>
                            <c:forEach items="${requestScope.listAccounts}" var="listAccounts">
                                <tr>
                                    <td>${listAccounts.id}</td>
                                    <td>${listAccounts.userName}</td>

                                    <td>${listAccounts.fullName}</td>
                                    <td>${listAccounts.email}</td>
                                    <td>${listAccounts.role}</td>
                                    <td>${listAccounts.gender ? 'Male' : 'Female'}</td>
                                    <td>${listAccounts.phone}</td>
                                    <td>${listAccounts.dob}</td>
                                    <td>${listAccounts.address}</td>
                                    <td>
                                        <a href="setAccount?id=${listAccounts.id}"><button class="fas fa-edit"></button></a>
                                        <a href="removeAccount?id=${listAccounts.id}"><button class="fas fa-trash-alt"></button></a>

                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                        </thead>
                    </table>

                </div>

            </div>
        </div>

    </body>
</html>
