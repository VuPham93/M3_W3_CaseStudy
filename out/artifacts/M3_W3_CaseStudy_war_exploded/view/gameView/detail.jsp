<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="view/component/css/detail-slide.js"></script>
    <c:import url="../component/head.jsp"/>
    <title>${requestScope.game.name}</title>
</head>
<body style="background-image: linear-gradient(#5aabd0, #ffffff);">
<c:import url="../component/navbar1.jsp"/>
<div>
    <nav class="navbar navbar-expand-sm navbar-light mx-lg-5 mt-3">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="gamesServlet">Back to home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gamesServlet?action=update&id=${requestScope.game.id}">Update game information</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gamesServlet?action=remove&id=${requestScope.game.id}">Remove game</a>
                </li>
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
<!--Content-->
<div class="container">
    <h1 style="color: #2A2A2A">${requestScope.game.name}</h1>
</div>

<div class="container contenedor-slide">

    <div id="carouselExampleControls" class="carousel slide " data-ride="carousel" data-interval="false">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="<c:url value="${requestScope.game.bigImg1Path}"/>" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<c:url value="${requestScope.game.bigImg2Path}"/>" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="<c:url value="${requestScope.game.bigImg3Path}"/>" alt="Third slide">
            </div>
            <div class="carousel-item">
                <div class="carousel-video-inner embed-responsive embed-responsive-16by9">
                    <div id="video-player" data-video-id="${requestScope.game.videoPath}"></div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<div class="container">
    <table class="table table-borderless d-flex justify-content-end">
        <tr>
            <td style="vertical-align: bottom; padding: 3px">
                <h5 class="card-text font-weight-light align-self-end m-0 p-0" style="text-decoration: line-through; text-align: right"><small>$ ${requestScope.game.price}</small></h5>
            </td>
            <td rowspan="2" style="width: 310px; padding-right: 0; padding-left: 0">
                <button type="button" class="btn btn-success" disabled style="width: 100px; height: 60px; margin-left: 0">-${requestScope.game.discount}%</button>
                <button type="button" class="btn btn-primary" style="width: 200px; height: 60px; margin-right: 0">BUY NOW</button>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top; padding: 2px">
                <h4 class="card-text align-self-baseline">$ ${requestScope.game.sellPrice}</h4>
            </td>
        </tr>
    </table>

</div>

<div class="container table-responsive">
    <table class="table table-borderless">
        <tbody>
        <tr>
            <th scope="row"><h2><small>Game detail: </small></h2></th>
            <td><h2><small>${requestScope.game.detail}</small></h2></td>
        </tr>
        <tr>
            <th scope="row"><h2><small>Category: </small></h2></th>
            <td><h2><small>${requestScope.game.category}</small></h2></td>
        </tr>
        <tr>
            <th scope="row"><h2><small>Status :</small></h2></th>
            <td><h2><small>${requestScope.game.status}</small></h2></td>
        </tr>
        <tr>
            <th scope="row"><h2><small>System requirements: </small></h2></th>
            <td><h2><small>${requestScope.game.systemRequirements}</small></h2></td>
        </tr>
        </tbody>
    </table>
</div>

<%--Catalog--%>
<div class="container-fluid" style="color: #2A2A2A">
    <c:import url="../component/catalog.jsp"/>
</div>

<%--Footer--%>
<c:import url="../component/footer.jsp"/>
</body>
</html>
