<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">

        <a class="navbar-brand" href="gamesServlet">
            <img src="view/component/img/logo.png" alt="Logo" style="width:40px">
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">STORE</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">NEWS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">FAQ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">HELP</a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${requestScope.loggedUser.equals('ADMIN')}">
                        <li class="nav-item">
                            <a class="nav-link" href="homeServlet"><i class="fa fa-user" aria-hidden="true"></i> ADMINISTRATOR</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logoutServlet">SIGN OUT</a>
                        </li>
                    </c:when>

                    <c:when test="${requestScope.loggedUser != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="homeServlet"><i class="fa fa-user" aria-hidden="true"></i> ${requestScope.loggedUser}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logoutServlet">SIGN OUT</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="loginServlet"><i class="fa fa-user" aria-hidden="true"></i> SIGN IN</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item">
                    <a class="nav-link" href="#">GET LAUNCHER</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
