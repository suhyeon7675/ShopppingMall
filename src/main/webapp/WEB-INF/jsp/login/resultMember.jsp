<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	<div class="container" align="center">
		<c:choose>
			<c:when test="${msg eq 2}">
				<h2 class='alert alert-danger'>${member.id}님 환영합니다</h2>
			</c:when>
			<c:when test="${msg eq 1}">
				<h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>
			</c:when>
		</c:choose>
	</div>	
</body>
</html>