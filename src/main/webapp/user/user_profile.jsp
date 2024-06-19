<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin cá nhân</title>
    <%@include file="/layout/subheader.jsp"%>
    <link rel="stylesheet" href="${url}/Assets/css/user_profile.css">
    <link rel="stylesheet" href="${url}/Assets/css/header.css">

</head>
<body>
<div class="container">
    <aside class="sidebar">
        <ul>
            <li><a href="#">Infomation</a></li>
            <li><a href="#">Các tùy chọn</a></li>
            <li><a href="#">An toàn và bảo mật</a></li>
            <li><a href="#">Thông tin thanh toán</a></li>
            <li><a href="#">Quyền riêng tư</a></li>
            <li><a href="#">Thông báo email</a></li>
            <li><a href="#">Người đi cùng</a></li>
        </ul>
    </aside>
    <main class="content">
        <header>
            <h1>Thông tin cá nhân</h1>
            <p>Cập nhật thông tin của bạn và tìm hiểu các thông tin này được sử dụng ra sao.</p>
        </header>
        <section class="profile-info">
            <table>
                <tr >
                    <td>User Name</td>
                    <td >Minh</td>
                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>
                </tr>
                <tr id="">
                    <td>Full name</td>
                    <td id="name-value">Minh</td>
                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>
                </tr>
                <tr id="email-row">
                    <td>Email</td>
                    <td id="email-value">metoo2k3@gmail.com </td>
                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>
                </tr>
                <tr id="gender-row">
                    <td>gender</td>
                    <td id="gender-value">metoo2k3@gmail.com </td>
                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>
                </tr>
                <tr id="phone-row">
                    <td>Phone Number</td>
                    <td id="phone-value">1234567890</td>
                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>
                </tr>
                <tr id="dob-row">
                    <td>Birth Day</td>
                    <td >metoo2k3@gmail.com </td>
                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>
                </tr>

                <!-- Add other rows as needed -->
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
