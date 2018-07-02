<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<title>투두라고</title>
<style>
.nav1 {
	margin-right: 20px;
}

.textHeader {
	background-color: aliceblue;
	border: 1px solid ivory;
	border-radius: 10px;
}
</style>
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>


</head>

<body>
<c:url var="logoutUrl" value="/logout" />
<form action="${logoutUrl}" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid collapse navbar-collapse">
			<div class="navbar-header textHeader">
				<p class="navbar-text">
					<strong>&nbsp;강태욱의 100% 수작업 투두</strong>
				</p>
			</div>
			<ul class="nav1 nav navbar-nav navbar-right ">
				<sec:authorize access="isAnonymous()"> 
						<li role="navs"><a href="/">홈</a></li>
						<li role="navs"><a href="/login">로그인</a></li>
						<li role="navs"><a href="/register">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
						<li role="navs"><a href="/">홈</a></li>
						<li role="navs"><a href="javascript:formSubmit()">로그아웃</a></li>
						<li role="navs"><a href="/todo/todoMain">투두</a></li>
				</sec:authorize>

			</ul>
		</div>
	</nav>
</body>
</html>