<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/resource/res/img/${product.filename}" style="width:100%" />
			</div>
			<div class="col-md-6">
				<h3>${product.pname}</h3>
				<p>${product.description}
				<p><b>상품 코드 : </b><span class="badge badge-danger">${product.productId}</span>
				<p><b>제조사</b> : ${product.manufacturer}
				<p><b>분류</b> : ${product.category}
				<p><b>재고 수</b> : ${product.unitsInStock}
				<h4>${product.unitPrice}원</h4>
				<p><a href="#" class="btn btn-info"> 상품 주문 &raquo;</a> 
				<a href="/productList" class="btn btn-secondary">상품 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>
