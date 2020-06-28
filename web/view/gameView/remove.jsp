<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Remove game</title>
</head>
<body>
<c:import url="../component/navbar1.jsp"/>
<div class="container">
    <h1>Remove game</h1>
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
                <legend>Game information</legend>
                <table class="table table-light table-striped table-bordered table-hover">
                    <tr>
                        <th scope="row">Name: </th>
                        <td>${requestScope.game.name}</td>
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
                        <td></td>
                        <td><input class="btn btn-primary" type="submit" value="Remove game"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>

