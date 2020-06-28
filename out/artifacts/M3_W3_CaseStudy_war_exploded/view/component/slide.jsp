<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Slide-->
<div id="carouselExampleCaptions" class="carousel slide mx-lg-5" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="5"></li>
    </ol>

    <div class="carousel-inner">
        <div class="carousel-item active col-12 mt-3">
            <div class="card bg-dark text-light">
                <div class="card-horizontal">
                    <div class="col-xl-7 col-lg-7 col-md-7 col-sm-12 col-xs-12 p-0" >
                        <img alt="pic" class="d-block w-100" src="view/component/img/slide.jpg">
                    </div>
                    <div class="card-body col-xl-5 col-lg-5 col-md-5 d-none d-md-block bg-dark">
                        <div>
                            <h1><small>Game Store</small></h1>
                            <h2><small>A selection of great DRM-free games, from modern hits to all-time classics, that you really shouldn't miss.</small></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach items="${requestScope.topSellerList}" var="game">
            <a href="gamesServlet?action=detail&id=${game.id}">
                <div class="carousel-item col-12 mt-3">
                    <div class="card bg-dark text-light">
                        <div class="card-horizontal">
                            <div class="col-xl-7 col-lg-7 col-md-7 col-sm-12 col-xs-12 p-0" >
                                <img alt="pic" class="d-block w-100" src="<c:url value="${game.bigImg1Path}"/>">
                            </div>
                            <div class="card-body col-xl-5 col-lg-5 col-md-5 d-none d-md-block bg-dark">
                                <div class="align-middle">
                                    <h1 class="mb-3"><small>${game.name}</small></h1>
                                    <h2><small>${game.detail}</small></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
