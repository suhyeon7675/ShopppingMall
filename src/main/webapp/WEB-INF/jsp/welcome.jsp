<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<title>Welcome</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">웹 쇼핑몰에 오신 것을 환영합니다</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>Welcome to Web Market!</h3>
			<h6>현재 접속 시각 : ${time}</h6>
		</div>
		<hr>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>