<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="component/head.jsp"/>
    <title>GAMES</title>
</head>
<body>
    <!--Header-->
    <c:import url="component/navbarTop.jsp"/>
    <c:import url="component/navbarHome.jsp"/>

    <%--    Slide--%>
    <c:import url="component/slide.jsp"/>

    <!--Content-->
    <div class="container-fluid">
        <!--    Recently Updated-->
        <c:import url="component/recentlyUpdate.jsp"/>
        <!--    Top Sellers-->
        <c:import url="component/topSeller.jsp"/>
        <!--    Coming soon-->
        <c:import url="component/comingSoon.jsp"/>
        <!--    Catalog-->
        <c:import url="component/catalog.jsp"/>
    </div>

    <%--    Footer--%>
    <c:import url="component/footer.jsp"/>
</body>
</html>
