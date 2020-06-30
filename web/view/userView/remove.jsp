<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Remove user</title>
</head>
<body style="background-image: linear-gradient(#d71515, #000000)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarUserInfo.jsp"/>

<div class="container">
    <h1 style="color: #2A2A2A">Remove user</h1>
    <div>
        <form method="post">
            <fieldset>
                <legend style="color: #2A2A2A">${requestScope.user.name}</legend>
                <table class="table table-borderless table-hover">
                    <tr>
                        <th class="w-25" scope="row">Name: </th>
                        <td class="w-75">${requestScope.user.name}</td>
                    </tr>
                    <tr>
                        <th scope="row">Email: </th>
                        <td>${requestScope.user.email}</td>
                    </tr>
                    <tr>
                        <th scope="row">Password: </th>
                        <td>${requestScope.user.password}</td>
                    </tr>
                    <tr>
                        <th scope="row">Balance: </th>
                        <td>${requestScope.user.balance}</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center"><input class="btn btn-primary" type="submit" value="Remove user"></td>
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

