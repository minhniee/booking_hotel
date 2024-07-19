<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <title>View Service</title>
    <style>
        .room-table td {
            color: black;
            background-color: snow;
        }
        .container {
            text-align: center;
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            background-color: rgb(255,127,80);
            padding: 10px;
            border: 1px solid;
        }
        .room-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        .room-table th, .room-table td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .room-table th {
            background-color: #F2DDB3;
            color: #333;
            font-weight: bold;
        }
        .room-actions {
            margin-top: 20px;
        }
        .room-actions input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .room-actions button {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 10px;
        }
        .room-actions button:hover {
            background-color: #45a049;
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
        }
        .pagination a:hover {
            background-color: rgba(73, 174, 80, 0.88);
        }
        .pagination strong {
            margin: 0 2px;
            padding: 8px 16px;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            background-color: rgba(73, 174, 80, 0.88);
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="logo"></div>
    <ul class="menu">
        <li>
            <a href="dashboardstaff.jsp">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li >
            <a href="profileStaff.jsp">
                <i class="fas fa-user"></i>
                <span>Profile</span>
            </a>
        </li>
        <li class="active">
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
<div class="container">
    <h1>View Service</h1>

    <!-- Search box -->
    <div class="input-group">
        <input type="text" id="searchInput" onkeyup="filterServices()" placeholder="Search for services...">
        <select id="sortByIdSelect" onchange="sortServicesById()">
            <option value="default">Sort by ID</option>
            <option value="idAsc">ID: Ascending</option>
            <option value="idDesc">ID: Descending</option>
        </select>
        <select id="sortByPriceSelect" onchange="sortServicesByPrice()">
            <option value="default">Sort by Price</option>
            <option value="priceAsc">Price: Low to High</option>
            <option value="priceDesc">Price: High to Low</option>
        </select>
    </div>

    <table class="room-table" id="serviceTable">
        <thead>
        <tr>
            <th>Service ID</th>
            <th>Category ID</th>
            <th>Service Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="serviceTableBody">
        <c:forEach var="service" items="${service}">
            <tr>
                <td>${service.id}</td>
                <td>${service.categoryId}</td>
                <td>${service.serviceName}</td>
                <td>${service.description}</td>
                <td>${service.price}</td>
                <td>${service.quantity}</td>
                <td><img src="Assets/services/${service.image}" alt="${service.image}" width="100"></td>
                <td class="room-actions">
                    <a href="editService?id=${service.id}"><button type="submit">Edit</button></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="ViewService?page=${currentPage - 1}">&laquo; Previous</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == currentPage}">
                    <strong>${pageNumber}</strong>
                </c:when>
                <c:otherwise>
                    <a href="ViewService?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="ViewService?page=${currentPage + 1}">Next &raquo;</a>
        </c:if>
    </div>
</div>

<script>
    function filterServices() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('#serviceTableBody tr');
        rows.forEach(row => {
            const cells = Array.from(row.cells);
            const matches = cells.some(cell => cell.innerText.toLowerCase().includes(searchInput));
            if (matches) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    function sortServicesById() {
        const sortValue = document.getElementById('sortByIdSelect').value;
        const tableBody = document.getElementById('serviceTableBody');
        const rows = Array.from(tableBody.rows);

        if (sortValue === 'idAsc') {
            rows.sort((a, b) => parseInt(a.cells[0].innerText) - parseInt(b.cells[0].innerText));
        } else if (sortValue === 'idDesc') {
            rows.sort((a, b) => parseInt(b.cells[0].innerText) - parseInt(a.cells[0].innerText));
        } else {
            return; // No sorting applied
        }

        rows.forEach(row => tableBody.appendChild(row));
    }

    function sortServicesByPrice() {
        const sortValue = document.getElementById('sortByPriceSelect').value;
        const tableBody = document.getElementById('serviceTableBody');
        const rows = Array.from(tableBody.rows);

        if (sortValue === 'priceAsc') {
            rows.sort((a, b) => parseFloat(a.cells[4].innerText) - parseFloat(b.cells[4].innerText));
        } else if (sortValue === 'priceDesc') {
            rows.sort((a, b) => parseFloat(b.cells[4].innerText) - parseFloat(a.cells[4].innerText));
        } else {
            return; // No sorting applied
        }

        rows.forEach(row => tableBody.appendChild(row));
    }
</script>

</body>
</html>
