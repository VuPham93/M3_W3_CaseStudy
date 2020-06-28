<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Remove user</title>
</head>
<body>
<c:import url="../component/navbar1.jsp"/>
<div class="container">
    <h1>Remove user</h1>
    <div>
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>

        <p>
            <a href="usersServlet">Back to home</a>
        </p>

        <form method="post">
            <fieldset>
                <legend>User information</legend>
                <table class="table table-light table-striped table-bordered table-hover">
                    <tr>
                        <th scope="row">Name: </th>
                        <td>${requestScope.user.name}</td>
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
                        <td></td>
                        <td><input class="btn btn-primary" type="submit" value="Remove user"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>

