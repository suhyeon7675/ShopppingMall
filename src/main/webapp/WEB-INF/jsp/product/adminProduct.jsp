<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 수정/삭제</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정/삭제</h1>
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
							<p> <a href="/editProduct?productId=${pro.productId}" class="btn btn-secondary btn-sm mr-1" role="button"> 상품 수정 &raquo;</a>
							<button type="button" class="btn btn-secondary btn-sm" onclick="deleteCheck('${pro.productId}')"> 상품 삭제 &raquo;</button>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<hr>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
<script>
	function deleteCheck(productId){
		if(confirm("상품을 삭제하시겠습니까?")){
			alert("상품이 삭제되었습니다.")
			location.href = "/deleteProduct?productId=" + productId;
		}
	}
</script>
</html>