<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/25/2024
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<style>
    .error {
        color: white;
        display: none;
    }
</style>
</head>
<body>

<div class="footer">
    <div class="mail">
        <h1 class="mailTitle">Save time, save money!</h1>
        <span class="mailDesc">Sign up and we'll send the best deal for you</span>
        <form method="get" action="ContactServlet" onsubmit="return validateEmail()">
            <div class="mailInputContainer">
                <input type="text" id="email" name="email" placeholder="Your Email">
                <button type="submit">Subscribe</button>
                <div id="error-message" class="error">Please enter a valid email address.</div>
            </div>
        </form>
    </div>
</div>

<script>
    function validateEmail() {
        var email = document.getElementById('email').value;
        var errorMessage = document.getElementById('error-message');
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        if (emailPattern.test(email)) {
            errorMessage.style.display = 'none';
            return true;
        } else {
            errorMessage.style.display = 'block';
            return false;
        }
    }

    document.getElementById('email').addEventListener('input', function() {
        document.getElementById('error-message').style.display = 'none';
    });
</script>

</body>