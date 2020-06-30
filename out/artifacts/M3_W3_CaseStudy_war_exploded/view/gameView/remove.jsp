<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Remove game</title>
</head>
<body style="background-image: linear-gradient(#ff3737, #ffbdbd)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarGameDetail.jsp"/>

<div class="container">
    <h1 style="color: #2A2A2A">Remove game</h1>
    <div>
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>

        <p>
            <a href="homeServlet">Back to home</a>
        </p>

        <form method="post">
            <fieldset>
                <legend style="color: #2A2A2A">${requestScope.game.name}</legend>
                <table class="table table-borderless table-hover">
                    <tr>
                        <th class="w-25" scope="row">Name: </th>
                        <td class="w-75">${requestScope.game.name}</td>
                    </tr>
                    <tr>
                        <th scope="row">Category: </th>
                        <td>${requestScope.game.category}</td>
                    </tr>
                    <tr>
                        <th scope="row">Detail: </th>
                        <td>${requestScope.game.detail}</td>
                    </tr>
                    <tr>
                        <th scope="row">System requirements: </th>
                        <td>${requestScope.game.systemRequirements}</td>
                    </tr>
                    <tr>
                        <th scope="row">Price: </th>
                        <td>${requestScope.game.price}</td>
                    </tr>
                    <tr>
                        <th scope="row">Discount: </th>
                        <td>${requestScope.game.discount}</td>
                    </tr>
                    <tr>
                        <th scope="row">Status: </th>
                        <td>${requestScope.game.status}</td>
                    </tr>
                    <tr>
                        <th scope="row">Download link: </th>
                        <td>${requestScope.game.downloadLink}</td>
                    </tr>
                    <tr>
                        <th scope="row">Small image path: </th>
                        <td>${requestScope.game.smallImgPath}</td>
                    </tr>
                    <tr>
                        <th scope="row">Big image 1 path: </th>
                        <td>${requestScope.game.bigImg1Path}</td>
                    </tr>
                    <tr>
                    <tr>
                        <th scope="row">Big image 2 path: </th>
                        <td>${requestScope.game.bigImg2Path}</td>
                    </tr>
                    <tr>
                    <tr>
                        <th scope="row">Big image 3 path: </th>
                        <td>${requestScope.game.bigImg3Path}</td>
                    </tr>
                    <tr>
                    <tr>
                        <th scope="row">Video path: </th>
                        <td>${requestScope.game.videoPath}</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center"><input class="btn btn-primary" type="submit" value="Remove game"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>

