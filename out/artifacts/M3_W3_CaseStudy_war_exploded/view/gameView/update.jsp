<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Update game information</title>
</head>
<body style="background-image: linear-gradient(#fff000, #ffffff)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarUpdateGameInfo.jsp"/>

<div class="container">
    <h1 style="color: #2A2A2A">Update game information</h1>
    <div>
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>

        <form method="post">
            <fieldset>
                <table class="table table-borderless table-hover">
                    <tr>
                        <th class="w-25" scope="row">Name: </th>
                        <td class="w-75"><input class="form-control" type="text" name="name" id="name" value="${requestScope.game.name}"></td>
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
                        <td colspan="2" class="text-center"><input class="btn btn-primary" type="submit" value="Update game information"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>

<%--Catalog--%>
<div class="container-fluid" style="color: #2A2A2A">
    <c:import url="../component/catalog.jsp"/>
</div>

<%--Footer--%>
<c:import url="../component/footer.jsp"/>
</body>
</html>
