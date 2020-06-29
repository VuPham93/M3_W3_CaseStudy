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
<body style="background-image: linear-gradient(#5aabd0, #ffffff);">
<c:import url="../component/navbar1.jsp"/>
<div>
    <nav class="navbar navbar-expand-sm navbar-light mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="homeServlet">Back to home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="usersServlet?action=update&id=${requestScope.user.id}">Update user information</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="usersServlet?action=remove&id=${requestScope.user.id}">Remove user</a>
                </li>
            </ul>

            <form class="form-inline ml-auto" action="usersServlet?action=find" method="post">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-dark border-0" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i></span>
                    </div>
                    <input type="text" class="form-control bg-dark border-0" placeholder="Search..." aria-label="Username" aria-describedby="basic-addon1" name="findingUser" id="findingUser">
                </div>
            </form>
        </div>
    </nav>
</div>
<!--Content-->
<div class="container">
    <h1 style="color: #2A2A2A">${requestScope.user.name}</h1>
</div>

<div class="container table-responsive">
    <table class="table table-borderless">
        <tbody>
        <tr>
            <th scope="row"><h2><small>User name: </small></h2></th>
            <td><h2><small>${requestScope.user.name}</small></h2></td>
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

<%--Footer--%>
<c:import url="../component/footer.jsp"/>
</body>
</html>
