<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<nav style="display:flex; flex-direction:row; align-items:center; background:#343A40" >
	<div style="padding:1rem;margin-left:2rem;font-weight:bold; font-size:1.2rem">
		<a  style ="color:white" href="/welcome">Home</a>
	</div>	
	<div style=" margin-left:auto; padding:1rem; margin-right:3rem;">
		<ul style="display:flex; align-items:center; text-decoration:none; list-style:none; margin-bottom:0">
			<c:choose>
				<c:when test="${empty member}">
					<li><a  style="margin-right:1rem; text-decoration:none; color:white" href="/login">로그인</a></li>
					<li ><a  style="margin-right:1rem; text-decoration:none; color:white" href="/register">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li style="margin-right:1rem; color:white">${member.id}님</li>
					<li ><a  style="margin-right:1rem; text-decoration:none; color:white" href="/logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
			<li ><a style="margin-right:1rem; text-decoration:none; color:white" href="/productList">상품 목록</a></li>
			<li ><a  style="margin-right:1rem; text-decoration:none; color:white" href="/addProduct">상품 등록</a></li>
			<li ><a  style="margin-right:1rem; text-decoration:none; color:white" href="/adminProduct">상품 수정</a></li>
			<li ><a  style="margin-right:1rem; text-decoration:none; color:white" href="/adminProduct">상품 삭제</a></li>
		</ul>
	</div>
</nav>