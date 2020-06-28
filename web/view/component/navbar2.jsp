<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <nav class="navbar navbar-expand-sm navbar-dark mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <c:choose>
                    <c:when test="${requestScope.loggedUserRole.equals('admin')}">
                        <li class="nav-item">
                            <a class="nav-link" href="userInfo">Administrator</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gamesServlet?action=new">Add new game</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gamesServlet?action=new">Show game list</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="usersServlet?action=new">New user</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="usersServlet">Users management</a>
                        </li>

                    </c:when>

                    <c:when test="${requestScope.loggedUserRole != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="userInfo">Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gamesServlet?action=new">Your library</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Browse</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Browse</a>
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