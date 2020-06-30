<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="view/component/css/detail-slide.js"></script>
    <c:import url="../component/head.jsp"/>
    <title>${requestScope.user.name}</title>
</head>
<body style="background-image: linear-gradient(#426ae5, #ffffff)">
    <%--navbar--%>
    <c:import url="../component/navbarTop.jsp"/>
    <c:import url="../component/navbarUserInfo.jsp"/>

    <!--Content-->
    <div class="container">
        <h1 style="color: #2A2A2A">${requestScope.user.name}</h1>
    </div>

    <div class="container table-responsive">
        <table class="table table-borderless">
            <tbody>
            <tr>
                <th scope="row" class="w-25"><h2><small>User name: </small></h2></th>
                <td class="w-75"><h2><small>${requestScope.user.name}</small></h2></td>
            </tr>
            <tr>
                <th scope="row"><h2><small>Email: </small></h2></th>
                <td><h2><small>${requestScope.user.email}</small></h2></td>
            </tr>
            <tr>
                <th scope="row"><h2><small>Password :</small></h2></th>
                <td><h2><small>${requestScope.user.password}</small></h2></td>
            </tr>
            <tr>
                <th scope="row"><h2><small>System Balance: </small></h2></th>
                <td><h2><small>${requestScope.user.balance}</small></h2></td>
            </tr>
            </tbody>
        </table>
    </div>

    <%--Catalog--%>
    <div class="container-fluid" style="color: #2A2A2A">
        <c:import url="../component/catalog.jsp"/>
    </div>

    <%--Footer--%>
    <c:import url="../component/footer.jsp"/>
</body>
</html>
