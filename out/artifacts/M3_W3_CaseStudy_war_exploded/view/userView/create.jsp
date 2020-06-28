<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Add new user</title>
</head>
<body>
    <c:import url="../component/navbar1.jsp"/>
    <div class="container">
        <h1>Add new user</h1>
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
                            <td><input class="form-control" type="text" name="name" id="name"></td>
                        </tr>
                        <tr>
                            <th scope="row">Email: </th>
                            <td><input class="form-control" type="text" name="email" id="email"></td>
                        </tr>
                        <tr>
                            <th scope="row">Password: </th>
                            <td><input class="form-control" type="text" name="password" id="password"></td>
                        </tr>
                        <tr>
                            <th scope="row">Balance: </th>
                            <td><input class="form-control" type="text" name="balance" id="balance"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input class="btn btn-primary" type="submit" value="Create user"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>
