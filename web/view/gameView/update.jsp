<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Update game information</title>
</head>
<body>
<c:import url="../component/navbar1.jsp"/>
<div class="container">
    <h1>Update game information</h1>
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
                        <td><input class="form-control" type="text" name="name" id="name" value="${requestScope.game.name}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Category: </th>
                        <td><input class="form-control" type="text" name="category" id="category" value="${requestScope.game.category}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Detail: </th>
                        <td><input class="form-control" type="text" name="detail" id="detail" value="${requestScope.game.detail}"></td>
                    </tr>
                    <tr>
                        <th scope="row">System requirements: </th>
                        <td><input class="form-control" type="text" name="systemRequirements" id="systemRequirements" value="${requestScope.game.systemRequirements}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Price: </th>
                        <td><input class="form-control" type="text" name="price" id="price" value="${requestScope.game.price}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Discount: </th>
                        <td><input class="form-control" type="text" name="discount" id="discount" value="${requestScope.game.discount}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Status: </th>
                        <td><input class="form-control" type="text" name="status" id="status" value="${requestScope.game.status}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Download link: </th>
                        <td><input class="form-control" type="text" name="downloadLink" id="downloadLink" value="${requestScope.game.downloadLink}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Small image path: </th>
                        <td><input class="form-control" type="text" name="smallImgPath" id="smallImgPath" value="${requestScope.game.smallImgPath}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Big image 1 path: </th>
                        <td><input class="form-control" type="text" name="bigImg1Path" id="bigImg1Path" value="${requestScope.game.bigImg1Path}"></td>
                    </tr>
                    <tr>
                    <tr>
                        <th scope="row">Big image 2 path: </th>
                        <td><input class="form-control" type="text" name="bigImg2Path" id="bigImg2Path" value="${requestScope.game.bigImg2Path}"></td>
                    </tr>
                    <tr>
                    <tr>
                        <th scope="row">Big image 3 path: </th>
                        <td><input class="form-control" type="text" name="bigImg3Path" id="bigImg3Path" value="${requestScope.game.bigImg3Path}"></td>
                    </tr>
                    <tr>
                    <tr>
                        <th scope="row">Video path: </th>
                        <td><input class="form-control" type="text" name="videoPath" id="videoPath" value="${requestScope.game.videoPath}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="btn btn-primary" type="submit" value="Update game information"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
