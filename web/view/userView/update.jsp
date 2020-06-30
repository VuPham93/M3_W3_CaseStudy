<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Update user information</title>
</head>
<body style="background-image: linear-gradient(#e2dc38, #ffffff)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarUpdate.jsp"/>

<div class="container">
    <h1 style="color: #2A2A2A">Update user information</h1>
    <div>
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message" style="color: #107c10">${requestScope["message"]}</span>
            </c:if>
        </p>

        <form method="post">
            <fieldset>
                <table class="table table-borderless table-hover">
                    <tr>
                        <th scope="row" class="w-25">Name: </th>
                        <td class="w-75"><input class="form-control" type="text" name="name" id="name" value="${requestScope.user.name}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Email: </th>
                        <td><input class="form-control" type="text" name="email" id="email" value="${requestScope.user.email}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Password: </th>
                        <td><input class="form-control" type="text" name="password" id="password" value="${requestScope.user.password}"></td>
                    </tr>
                    <tr>
                        <th scope="row">Balance: </th>
                        <td><input class="form-control" type="text" name="balance" id="balance" value="${requestScope.user.balance}"></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center"><input class="btn btn-primary" type="submit" value="Update information"></td>
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
