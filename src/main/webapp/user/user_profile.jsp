<%--<!DOCTYPE html>--%>
<%--<html lang="vi">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Thông tin cá nhân</title>--%>
<%--    <%@include file="/layout/subheader.jsp"%>--%>
<%--    <link rel="stylesheet" href="${url}/Assets/css/user_profile.css">--%>
<%--    <link rel="stylesheet" href="${url}/Assets/css/header.css">--%>

<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <aside class="sidebar">--%>
<%--        <ul>--%>
<%--            <li><a href="#">Infomation</a></li>--%>
<%--            <li><a href="#">Các tùy chọn</a></li>--%>
<%--            <li><a href="#">An toàn và bảo mật</a></li>--%>
<%--            <li><a href="#">Thông tin thanh toán</a></li>--%>
<%--            <li><a href="#">Quyền riêng tư</a></li>--%>
<%--            <li><a href="#">Thông báo email</a></li>--%>
<%--            <li><a href="#">Người đi cùng</a></li>--%>
<%--        </ul>--%>
<%--    </aside>--%>
<%--    <main class="content">--%>
<%--        <header>--%>
<%--            <h1>Thông tin cá nhân</h1>--%>
<%--            <p>Cập nhật thông tin của bạn và tìm hiểu các thông tin này được sử dụng ra sao.</p>--%>
<%--        </header>--%>
<%--        <section class="profile-info">--%>
<%--            <table>--%>
<%--                <tr >--%>
<%--                    <td>User Name</td>--%>
<%--                    <td >Minh</td>--%>
<%--                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>--%>
<%--                </tr>--%>
<%--                <tr id="">--%>
<%--                    <td>Full name</td>--%>
<%--                    <td id="name-value">Minh</td>--%>
<%--                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>--%>
<%--                </tr>--%>
<%--                <tr id="email-row">--%>
<%--                    <td>Email</td>--%>
<%--                    <td id="email-value">metoo2k3@gmail.com </td>--%>
<%--                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>--%>
<%--                </tr>--%>
<%--                <tr id="gender-row">--%>
<%--                    <td>gender</td>--%>
<%--                    <td id="gender-value">metoo2k3@gmail.com </td>--%>
<%--                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>--%>
<%--                </tr>--%>
<%--                <tr id="phone-row">--%>
<%--                    <td>Phone Number</td>--%>
<%--                    <td id="phone-value">1234567890</td>--%>
<%--                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>--%>
<%--                </tr>--%>
<%--                <tr id="dob-row">--%>
<%--                    <td>Birth Day</td>--%>
<%--                    <td >metoo2k3@gmail.com </td>--%>
<%--                    <td><a href="#" class="edit-link">Chỉnh sửa</a></td>--%>
<%--                </tr>--%>

<%--                <!-- Add other rows as needed -->--%>
<%--            </table>--%>
<%--        </section>--%>
<%--    </main>--%>
<%--</div>--%>
<%--<script src="script.js"></script>--%>
<%--</body>--%>
<%--<script>--%>
<%--    document.addEventListener("DOMContentLoaded", function() {--%>
<%--        const editLinks = document.querySelectorAll(".edit-link");--%>

<%--        editLinks.forEach(link => {--%>
<%--            link.addEventListener("click", function(event) {--%>
<%--                event.preventDefault();--%>

<%--                const row = this.closest("tr");--%>
<%--                const valueCell = row.querySelector("td:nth-child(2)");--%>
<%--                const currentValue = valueCell.textContent.trim();--%>
<%--                const input = document.createElement("input");--%>
<%--                input.type = "text";--%>
<%--                input.value = currentValue;--%>
<%--                input.classList.add("edit-input");--%>

<%--                valueCell.innerHTML = "";--%>
<%--                valueCell.appendChild(input);--%>

<%--                input.focus();--%>

<%--                // Save the new value when the input loses focus--%>
<%--                input.addEventListener("blur", function() {--%>
<%--                    const newValue = this.value.trim();--%>
<%--                    valueCell.textContent = newValue;--%>

<%--                    // Optionally, send the new value to a server or save it locally--%>
<%--                    // e.g., saveNewValue(row.id, newValue);--%>
<%--                });--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>

<%--</script>--%>
<%--</html>--%>
<%@include file="../layout/subheader.jsp"%>
<%@include file="../layout/cdnpkg.jsp"%>
<link rel="stylesheet" href="user">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Edogaru</span><span class="text-black-50">edogaru@mail.com.my</span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <form action="${url}/UpdateProfile" method="post" onsubmit="return validateForm()">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels">User name</label>
                            <input readonly type="text" name="userName" class="form-control" placeholder="first name" value="${account.userName}">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Full name</label>
                            <input type="text" name="fname" class="form-control" placeholder="enter full name" value="${account.fullName}">
                            <small class="error-message text-danger" id="fullNameError"></small>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Email</label>
                            <input type="text" name="email" class="form-control" placeholder="enter email" value="${account.email}">
                            <small class="error-message text-danger" id="emailError"></small>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Gender</label>
                            <select name="gender" class="form-control">
                                <option value="true" ${account.gender ? 'selected' : ''}>Male</option>
                                <option value="false" ${!account.gender ? 'selected' : ''}>Female</option>
                            </select>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Phone</label>
                            <input type="text" name="phone" class="form-control" placeholder="enter phone number" value="${account.phone}">
                            <small class="error-message text-danger" id="phoneError"></small>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Date of birth</label>
                            <input type="date" name="dob" class="form-control" max="2024-12-31" value="${account.dob}">
                            <small class="error-message text-danger" id="dobError"></small>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Address</label>
                            <input type="text" name="address" class="form-control" placeholder="enter address" value="${account.address}">
                            <small class="error-message text-danger" id="addressError"></small>
                        </div>
                    </div>
                    <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                    <div class="mt-5 text-center">
                        <a href="${url}/user/changePass.jsp" class="btn btn-primary profile-button">Change Password</a>
                    </div>


                </div>
            </form>

        </div>
        </div>
<%--        <div class="col-md-4">--%>
<%--            <div class="p-3 py-5">--%>
<%--                <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div><br>--%>
<%--                <div class="col-md-12"><label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value=""></div> <br>--%>
<%--                <div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value=""></div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
<script>
    function validateForm() {
        const fullName = document.querySelector('[name="fname"]').value.trim();
        const email = document.querySelector('[name="email"]').value.trim();
        const phone = document.querySelector('[name="phone"]').value.trim();
        const dob = document.querySelector('[name="dob"]').value.trim();
        const address = document.querySelector('[name="address"]').value.trim();

        const nameRegex = /^[A-Z][a-zA-Z\s]*$/;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const phoneRegex = /^\d{10}$/;

        let isValid = true;

        // Clear previous error messages
        document.getElementById('fullNameError').textContent = '';
        document.getElementById('emailError').textContent = '';
        document.getElementById('phoneError').textContent = '';
        document.getElementById('dobError').textContent = '';
        document.getElementById('addressError').textContent = '';

        if (!fullName) {
            document.getElementById('fullNameError').textContent = 'Full name is required.';
            isValid = false;
        } else if (!nameRegex.test(fullName)) {
            document.getElementById('fullNameError').textContent = 'Full name must start with a capital letter and only contain letters and spaces.';
            isValid = false;
        }

        if (!email) {
            document.getElementById('emailError').textContent = 'Email is required.';
            isValid = false;
        } else if (!emailRegex.test(email)) {
            document.getElementById('emailError').textContent = 'Please enter a valid email address.';
            isValid = false;
        }

        if (!phone) {
            document.getElementById('phoneError').textContent = 'Phone number is required.';
            isValid = false;
        } else if (!phoneRegex.test(phone)) {
            document.getElementById('phoneError').textContent = 'Phone number must be exactly 10 digits.';
            isValid = false;
        }

        if (!dob) {
            document.getElementById('dobError').textContent = 'Date of birth is required.';
            isValid = false;
        }

        if (!address) {
            document.getElementById('addressError').textContent = 'Address is required.';
            isValid = false;
        }

        return isValid;
    }
</script>

</div>
</div>
</div>