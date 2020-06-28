<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hurah
  Date: 6/25/2020
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Add new game</title>
</head>
<body>
    <c:import url="../component/navbar1.jsp"/>
    <div class="container">
        <h1>Add new game</h1>
        <div>
            <p>
                <c:if test='${requestScope["message"] != null}'>
                    <span class="message">${requestScope["message"]}</span>
                </c:if>
            </p>

            <p>
                <a href="gamesServlet">Back to home</a>
            </p>

            <form method="post">
                <fieldset>
                    <legend>Game information</legend>
                    <table class="table table-light table-striped table-bordered table-hover">
                        <tr>
                            <th scope="row">Name: </th>
                            <td><input class="form-control" type="text" name="name" id="name"></td>
                        </tr>
                        <tr>
                            <th scope="row">Category: </th>
                            <td><input class="form-control" type="text" name="category" id="category"></td>
                        </tr>
                        <tr>
                            <th scope="row">Detail: </th>
                            <td><input class="form-control" type="text" name="detail" id="detail"></td>
                        </tr>
                        <tr>
                            <th scope="row">System requirements: </th>
                            <td><input class="form-control" type="text" name="systemRequirements" id="systemRequirements"></td>
                        </tr>
                        <tr>
                            <th scope="row">Price: </th>
                            <td><input class="form-control" type="text" name="price" id="price"></td>
                        </tr>
                        <tr>
                            <th scope="row">Discount: </th>
                            <td><input class="form-control" type="text" name="discount" id="discount"></td>
                        </tr>
                        <tr>
                            <th scope="row">Status: </th>
                            <td><input class="form-control" type="text" name="status" id="status"></td>
                        </tr>
                        <tr>
                            <th scope="row">Download link: </th>
                            <td><input class="form-control" type="text" name="downloadLink" id="downloadLink"></td>
                        </tr>
                        <tr>
                            <th scope="row">Small image path: </th>
                            <td><input class="form-control" type="text" name="smallImgPath" id="smallImgPath"></td>
                        </tr>
                        <tr>
                            <th scope="row">Big image 1 path: </th>
                            <td><input class="form-control" type="text" name="bigImg1Path" id="bigImg1Path"></td>
                        </tr>
                        <tr>
                        <tr>
                            <th scope="row">Big image 2 path: </th>
                            <td><input class="form-control" type="text" name="bigImg2Path" id="bigImg2Path"></td>
                        </tr>
                        <tr>
                        <tr>
                            <th scope="row">Big image 3 path: </th>
                            <td><input class="form-control" type="text" name="bigImg3Path" id="bigImg3Path"></td>
                        </tr>
                        <tr>
                        <tr>
                            <th scope="row">Video path: </th>
                            <td><input class="form-control" type="text" name="videoPath" id="videoPath"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input class="btn btn-primary" type="submit" value="Create product"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>
