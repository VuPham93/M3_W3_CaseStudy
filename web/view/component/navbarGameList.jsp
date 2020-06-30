<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <nav class="navbar navbar-expand-md navbar-light mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <c:set var = "loggedUserRole" scope = "session"	value="${sessionScope.loggedUser.role}"/>
                <c:set var = "loggedUserName" scope = "session"	value="${sessionScope.loggedUser.name}"/>
                <c:choose>
                    <c:when test="${loggedUserRole.equals('admin')}">
                        <li>
                            <a class="nav-link" href="homeServlet">< Back to home |</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gameManagementServlet?action=new">Add new game</a>
                        </li>
                    </c:when>

                    <c:when test="${loggedUserRole != null}">
                        <li>
                            <a class="nav-link" href="homeServlet">< Back to home |</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="buyGameServlet">Your library</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li>
                            <a class="nav-link" href="homeServlet">< Back to home |</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Category</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="gamesServlet?action=action">Action</a>
                        <a class="dropdown-item" href="gamesServlet?action=adventure">Adventure</a>
                        <a class="dropdown-item" href="gamesServlet?action=fantasy">Fantasy</a>
                        <a class="dropdown-item" href="gamesServlet?action=strategy">Strategy</a>
                        <a class="dropdown-item" href="gamesServlet?action=horror">Horror</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="gamesServlet">All game</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Status</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="gamesServlet?action=recentlyUpdate">Recently Update</a>
                        <a class="dropdown-item" href="gamesServlet?action=topSellers">Top Sellers</a>
                        <a class="dropdown-item" href="gamesServlet?action=comingSoon">Coming Soon</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="gamesServlet">All game</a>
                    </div>
                </li>
            </ul>

            <form class="form-inline ml-auto" action="gamesServlet?action=find" method="post">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-dark border-0" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i></span>
                    </div>
                    <input type="text" class="form-control bg-dark border-0" placeholder="Find game..." aria-label="Username" aria-describedby="basic-addon1" name="findingGame" id="findingGame">
                </div>
            </form>
        </div>
    </nav>
</div>