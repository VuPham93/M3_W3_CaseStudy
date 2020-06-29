<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="view/component/css/style-login.css">
    <title>Login Form</title>
    <link href="https://fonts.googleapis.com/css?family=Hind&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
</head>

<body>
<div class="login-form">
    <a href="loginServlet">< Go back</a>

    <div class="logo"><img src="view/component/img/logo.png" alt="logo"></div>

    <div class="social-media">
        <button class="fb"><img src="view/component/img/fb.png" alt="facebook"></button>
        <button class="google"><img src="view/component/img/google.png" alt="google"></button>
        <button class="ps"><img src="view/component/img/ps.png" alt="ps"></button>
        <button class="xbox"><img src="view/component/img/xbox.png" alt="xbox"></button>
        <button class="switch"><img src="view/component/img/switch.png" alt="switch"></button>
    </div>

    <h6>Sign In</h6>

    <form method="post" action="signUpServlet">

        <div class="textbox">
            <input type="text" placeholder="Name start with uppercase & 2-10 characters" name="name">
            <span class="check-message hidden">Required</span>
        </div>
        <div style="height: 20px">
            <p style="color: #ff0000; text-align: center">${requestScope.nameError}</p>
        </div>

        <div class="textbox">
            <input type="password" name="email" placeholder="Email must be gmail" id="email">
            <span class="check-message hidden">Required</span>
        </div>
        <div style="height: 20px">
            <p style="color: #ff0000; text-align: center">${requestScope.emailError}</p>
        </div>

        <div class="textbox">
            <input type="password" name="password" placeholder="Password must have 3-10 characters" id="password">
            <span class="check-message hidden">Required</span>
        </div>

        <div style="height: 20px; margin-top: 5px">
            <p style="color: #ff0000; text-align: center">${requestScope.passError}</p>
            <p style="color: #00ff04; text-align: center">${requestScope.message}</p>
            <p style="color: #ff0000; text-align: center">${requestScope.messageError}</p>
        </div>

        <input type="submit" value="Sign Up" class="signIn-btn" disabled>

        <div class="privacy-link">
            <a href="#">Private Policy</a>
        </div>

    </form>
</div>

<script type="text/javascript">
    $(".textbox input").focusout(function () {
        if ($(this).val() == "") {
            $(this).siblings().removeClass("hidden");
            $(this).css("background", "#554343");
        } else {
            $(this).siblings().addClass("hidden");
            $(this).css("background", "#484848");
        }
    });

    $(".textbox input").keyup(function () {
        var inputs = $(".textbox input");
        if (inputs[0].value != "" && inputs[1].value && inputs[2].value) {
            $(".signIn-btn").attr("disabled", false);
            $(".signIn-btn").addClass("active");
        } else {
            $(".signIn-btn").attr("disabled", true);
            $(".signIn-btn").removeClass("active")
        }
    });
</script>
</body>
</html>
