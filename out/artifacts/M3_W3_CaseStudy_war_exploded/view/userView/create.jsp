<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Add new user</title>
</head>
<body style="background-image: linear-gradient(#d01e78, #ffffff)">
    <c:import url="../component/navbarTop.jsp"/>
    <c:import url="../component/navbarAccountInfo.jsp"/>

    <div class="container">
        <h1 style="color: #2A2A2A">Add new user</h1>
        <div>
            <p>
                <c:if test='${requestScope["message"] != null}'>
                    <span class="message">${requestScope["message"]}</span>
                </c:if>
            </p>

            <p><a href="homeServlet">Back to home</a></p>

            <form method="post">
                <fieldset>
                    <legend style="color: #2A2A2A">User information</legend>
                    <table class="table table-borderless table-hover">
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
                            <th scope="row">Role: </th>
                            <td><input class="form-control" type="text" name="role" id="role"></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center"><input class="btn btn-primary" type="submit" value="Create user"></td>
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
