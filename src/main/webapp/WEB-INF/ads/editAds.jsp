<%--
  Created by IntelliJ IDEA.
  User: ranchayasambath
  Date: 4/14/22
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="edit page"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>edit page</h1>
    <form action="/ads/edit" method="post">

        <c:set var="ad" value="${AdsDao.findByAdId(adId)}"/>
        <div class="form-group">

            <input type="hidden" name="userId" value="${sessionScope.user.id}">
            <input type="hidden" name="adId" value="${adId}">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" placeholder="${ad.getTitle()}">
        </div>
        <div class="form-group">
            <label for="price">Price(in galactic credits)</label>
            <input type="number" id="price" name="price" class="form-control" step="0.01"
                   placeholder="${ad.getPrice()}"/>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control"
                      placeholder="${ad.getDescription()}"></textarea>
        </div>
        <div class="form-group row">
            <h3 class="col-11">chose your categories(Optional)</h3>
            <div class="w-100"></div>
            <c:forEach items="${AdsDao.AllCats()}" var="eachCat">
                <div class="col-3">
                    <input type="checkbox" name="categories" value="${eachCat.getCategory()}"> ${eachCat.getCategory()}
                </div>
            </c:forEach>
        </div>
        <div class="container-large m-auto text-center row">
            <h3 class="col-11">chose an ad picture</h3>
            <div class="w-100"></div>
            <c:forEach var="adPic" items="${adPictures}">

            <div class="col form-check form-check-inline justify-content-center"><label><img
                    src="../asset/${adPic.getUrl()}" alt="${adPic.getUrl()}" height="300" width="400"><br>
                <input type="radio" name="picId" value="${adPic.getId()}" required/>
            </label></div>
            </c:forEach>

            <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
