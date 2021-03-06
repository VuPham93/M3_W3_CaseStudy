<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <nav class="navbar navbar-expand-sm navbar-light mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="homeServlet">Back to home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="userServlet?action=update&id=${requestScope.user.id}">Update account information</a>
                </li>
            </ul>

            <c:set var = "loggedUserRole" scope = "session"	value="${sessionScope.loggedUser.role}"/>
            <c:if test="${loggedUserRole.equals('admin')}">
                <form class="form-inline ml-auto" action="userManagementServlet?action=find" method="post">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-dark border-0" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i></span>
                        </div>
                        <input type="text" class="form-control bg-dark border-0" placeholder="Find user..." aria-label="Username" aria-describedby="basic-addon1" name="findingUser" id="findingUser">
                    </div>
                </form>
            </c:if>
        </div>
    </nav>
</div>
