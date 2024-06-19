<%@ page import="model.Account" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>

<%
    Account account = (Account) session.getAttribute("account");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <%@include file="/layout/subheader.jsp"%>
    <link rel="stylesheet" href="${url}/Assets/css/user_profile.css">
    <link rel="stylesheet" href="${url}/Assets/css/header.css">
    <link href="${url}/https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <aside class="sidebar">
        <ul>
            <li><a href="#">Infomation</a></li>
            <li><a href="#">Option</a></li>
            <li><a href="#">Safe and secure</a></li>
            <li><a href="#">Billing Information</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Email notifications</a></li>
            <li><a href="#">Accompanying person</a></li>
        </ul>
    </aside>
    <main class="content">
        <header>
            <h1>Personal information</h1>
            <p>Update your information and learn how it is used.</p>
        </header>
        <section class="profile-info">
            <table>
                <tr>
                    <td>User Name</td>
                    <td><%= account.getUserName() %></td>
                    <td><a href="#" class="edit-link">Edit</a></td>
                </tr>
                <tr>
                    <td>Full Name</td>
                    <td><%= account.getFullName() %></td>
                    <td><a href="#" class="edit-link">Edit</a></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%= account.getEmail() %></td>
                    <td><a href="#" class="edit-link">Edit</a></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%= account.getGender() ? "Male" : "Female" %></td>
                    <td><a href="#" class="edit-link">Edit</a></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><%= account.getPhone() %></td>
                    <td><a href="#" class="edit-link">Edit</a></td>
                </tr>
                <tr>
                    <td>Birth Day</td>
                    <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(account.getDob()) %></td>
                    <td><a href="#" class="edit-link">Edit</a></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%= account.getAddress() %></td>
                    <td><a href="#" class="edit-link">Edit</a></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td></td>
                    <td><a href="changePass.jsp" >Edit</a></td>
                </tr>
            </table>
        </section>
    </main>
</div>
<script src="script.js"></script>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const editLinks = document.querySelectorAll(".edit-link");

        editLinks.forEach(link => {
            link.addEventListener("click", function(event) {
                event.preventDefault();

                const row = this.closest("tr");
                const valueCell = row.querySelector("td:nth-child(2)");
                const currentValue = valueCell.textContent.trim();
                const input = document.createElement("input");
                input.type = "text";
                input.value = currentValue;
                input.classList.add("edit-input");

                valueCell.innerHTML = "";
                valueCell.appendChild(input);

                input.focus();

                // Save the new value when the input loses focus
                input.addEventListener("blur", function() {
                    const newValue = this.value.trim();
                    valueCell.textContent = newValue;

                    // Optionally, send the new value to a server or save it locally
                    // e.g., saveNewValue(row.id, newValue);
                });
            });
        });
    });

</script>
</html>
