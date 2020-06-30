<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Searched user</title>
</head>
<body style="background-image: linear-gradient(#712399, #ffffff)">
<c:import url="../component/navbarTop.jsp"/>
<c:import url="../component/navbarUpdate.jsp"/>

<div class="container">
    <h1 style="color: #2A2A2A">User list</h1>
    <div class="row row-cols-2 row-cols-lg-5 row-cols-md-4 row-cols-sm-2 row-cols-xs-1">
        <c:forEach items="${requestScope.userList}" var="user">
            <div class="col mb-2 hover12">
                <div class="card h-100">
                    <a href="userManagementServlet?action=detail&id=${user.id}">
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

<%--Catalog--%>
<div class="container-fluid" style="color: #2A2A2A">
    <c:import url="../component/catalog.jsp"/>
</div>

<%--Footer--%>
<c:import url="../component/footer.jsp"/>
</body>
</html>
