<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <nav class="navbar navbar-expand-sm navbar-light mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <c:set var = "loggedUserRole" scope = "session"	value="${sessionScope.loggedUser.role}"/>
                <c:set var = "loggedUserName" scope = "session"	value="${sessionScope.loggedUser.name}"/>
                <c:choose>
                    <c:when test="${loggedUserRole.equals('admin')}">
                        <li>
                            <a class="nav-link" href="homeServlet">< Back to home |</a>
                        </li>
                        <li>
                            <a class="nav-link" href="#">${requestScope.game.name}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gameManagementServlet?action=update&id=${requestScope.game.id}">Update game information</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gameManagementServlet?action=remove&id=${requestScope.game.id}">Remove game</a>
                        </li>
                    </c:when>

                    <c:when test="${loggedUserRole != null}">
                        <li>
                            <a class="nav-link" href="homeServlet">< Back to home |</a>
                        </li>
                        <li>
                            <a class="nav-link" href="#">${requestScope.game.name}</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li>
                            <a class="nav-link" href="homeServlet">< Back to home |</a>
                        </li>
                        <li>
                            <a class="nav-link" href="loginServlet">Sign in</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <form class="form-inline ml-auto" action="gamesServlet?action=find" method="post">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-dark border-0" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i></span>
                    </div>
                    <input type="text" class="form-control bg-dark border-0" placeholder="Search..." aria-label="Username" aria-describedby="basic-addon1" name="findingGame" id="findingGame">
                </div>
            </form>
        </div>
    </nav>
</div>