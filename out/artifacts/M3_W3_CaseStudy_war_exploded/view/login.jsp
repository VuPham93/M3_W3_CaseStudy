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

    <div class="logo"><img src="view/component/img/logo.png" alt="logo"></div>

    <div class="social-media">
        <button class="fb"><img src="view/component/img/fb.png" alt="facebook"></button>
        <button class="google"><img src="view/component/img/google.png" alt="google"></button>
        <button class="ps"><img src="view/component/img/ps.png" alt="ps"></button>
        <button class="xbox"><img src="view/component/img/xbox.png" alt="xbox"></button>
        <button class="switch"><img src="view/component/img/switch.png" alt="switch"></button>
    </div>

    <h6>Sign In</h6>

    <form method="post" action="loginServlet">

        <div class="textbox">
            <input type="text" placeholder="Username or Email" name="nameOrEmail">
            <span class="check-message hidden">Required</span>
        </div>

        <div class="textbox">
            <input type="password" name="password" placeholder="Password" id="password">
            <span class="check-message hidden">Required</span>
        </div>
        <div style="height: 20px">
            <p style="color: red; text-align: center">${requestScope.errorMessage}</p>
        </div>

        <div class="options">
            <label class="remember-me">
                <span class="checkbox"><input type="checkbox"><span class="checked"></span></span>Remember Me
            </label>
            <a href="#">forgot your password</a>
        </div>

        <input type="submit" value="Log In Now" class="login-btn" disabled>

        <div class="privacy-link">
            <a href="#">Private Policy</a>
        </div>

    </form>

    <div class="dont-have-account">Don't have a Epic Games Account ?<a href="#">Sign Up</a></div>
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
        if (inputs[0].value != "" && inputs[1].value) {
            $(".login-btn").attr("disabled", false);
            $(".login-btn").addClass("active");
        } else {
            $(".login-btn").attr("disabled", true);
            $(".login-btn").removeClass("active")
        }
    });
</script>
</body>
</html>
