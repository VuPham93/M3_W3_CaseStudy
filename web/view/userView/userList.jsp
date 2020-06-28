<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Searched user</title>
</head>
<body>
<c:import url="../component/navbar1.jsp"/>
<div class="container">
    <h1>Searched user</h1>
    <div class="row row-cols-2 row-cols-lg-5 row-cols-md-4 row-cols-sm-2 row-cols-xs-1">
        <c:forEach items="${requestScope.userList}" var="user">
            <div class="col mb-2 hover12">
                <div class="card h-100">
                    <a href="usersServlet?action=detail&id=${user.id}">
                        <div class="card-body">
                            <h5 class="card-title">${user.name}</h5>
                            <p class="card-text">${user.email}$</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
