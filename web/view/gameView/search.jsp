<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <c:import url="../component/head.jsp"/>
    <title>Searched game</title>
</head>
<body>
<c:import url="../component/navbar1.jsp"/>
<div class="container">
    <h1>Searched game</h1>
    <div class="row row-cols-2 row-cols-lg-5 row-cols-md-4 row-cols-sm-2 row-cols-xs-1">
        <c:forEach items="${requestScope.findGame}" var="game">
            <div class="col mb-2 hover12">
                <div class="card h-100">
                    <a href="gamesServlet?action=detail&id=${game.id}">
                        <img src="<c:url value="${game.smallImgPath}"/>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">${game.name}</h5>
                            <p class="card-text">${game.price}$</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>