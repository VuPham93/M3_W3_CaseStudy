<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mx-lg-5 px-lg-4 mt-5 py-2">
    <p class="display-4">Recently Update</p>
    <div class="row row-cols-2 row-cols-xl-5 row-cols-lg-4 row-cols-md-3 row-cols-sm-2 row-cols-xs-1">
        <c:forEach items="${requestScope.recentUpdateList}" var="game">
            <div class="col mb-2 hover12">
                <div class="card h-100 bg-dark">
                    <a href="gamesServlet?action=detail&id=${game.id}">
                        <img src="<c:url value="${game.smallImgPath}"/>" class="card-img-top" alt="...">
                        <div class="card-body bg-dark text-white">
                            <h4 class="card-title font-weight-normal" style="height: 40px"><small>${game.name}</small></h4>
                            <table class="card-body text-white">
                                <tr>
                                    <td style="width: 100px" rowspan="2"><button type="button" class="btn btn-outline-primary" disabled style="width: 80px; height: 40px">-${game.discount}%</button></td>
                                    <td>
                                        <p class="card-text font-weight-light" style="text-decoration: line-through"><small>$ ${game.price}</small></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h6 class="card-text font-weight-light">$ ${game.sellPrice}</h6>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>




