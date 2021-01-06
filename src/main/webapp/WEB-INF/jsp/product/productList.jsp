<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>>
	<div class="container">
		<div class="row" align="center">
			<c:choose>
				<c:when test="${empty listOfProducts}">
					<h3 class="text-center">상품 없음</h3>
				</c:when>
				<c:when test="${!empty listOfProducts}">
					<c:forEach var="pro" items="${listOfProducts}">
						<div class="col-md-4">
							<img src="/resource/res/img/${pro.filename}" style="width:100%"/>
							<h3>${pro.pname}</h3>
							<p>${pro.description}
							<p>${pro.unitPrice}원
							<p> <a href="/productDetail?productId=${pro.productId}"
							class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<hr>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>