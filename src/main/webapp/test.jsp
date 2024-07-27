
<%@include file="/layout/subheader.jsp"%>
<%@include file="/layout/cdnpkg.jsp"%>
<link rel="stylesheet" href="user">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right" style="margin-right: 30px;">
            <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                <div class="card p-3">
                    <div class="e-navlist e-navlist--active-bg">
                        <ul class="nav" style="text-wrap: nowrap">
                            <li class="nav-item"><a class="nav-link px-3 active" href="/Booking_Hotell"><i class="fa fa-fw fas fa-home mr-1"></i><span> Home</span></a></li>
                            <li class="nav-item"><a class="nav-link px-3" href="/Booking_Hotell/user/user_profile.jsp"><i class="fa fa-fw fa-user-cog mr-1"></i><span> Profile</span></a></li>
                            <li class="nav-item"><a class="nav-link px-3" href="/Booking_Hotell/ChangePass"><i class="fa fa-fw fa-user-edit " ></i><span> Change Password</span></a></li>
                            <li class="nav-item"><a class="nav-link px-3" href="/Booking_Hotell/bookingHistory"><i class="fa fa-fw fa-history " ></i><span> Booking history</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5 border-right" style=" background-color: rgba(220,220,220,0.4);">
            <form action="${url}/UpdateProfile" method="post" onsubmit="return validateForm()">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels">User name</label>
                            <input readonly style="background-color: #e9e8e8; font-weight:520;" type="text" name="userName" class="form-control" placeholder="first name" value="${account.userName}">
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
                            <input type="date" name="dob" class="form-control" max="2024-07-31" value="${account.dob}">
                            <small class="error-message text-danger" id="dobError"></small>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Address</label>
                            <input type="text" name="address" class="form-control" placeholder="enter address" value="${account.address}">
                            <small class="error-message text-danger" id="addressError"></small>
                        </div>
                    </div>
                    <div class="mt-5 text-center">
                        <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
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

        const nameRegex = /^[A-Z][a-z]*(?: [A-Z][a-z]*){0,2}$/;
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
        } else if (fullName.length > 20) {
            document.getElementById('fullNameError').textContent = 'Full name cannot be longer than 20 characters.';
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
        } else if (address.length > 50) {
            document.getElementById('addressError').textContent = 'Address cannot be longer than 50 characters.';
            isValid = false;
        }

        return isValid;
    }
</script>

</div>
</div>
</div>