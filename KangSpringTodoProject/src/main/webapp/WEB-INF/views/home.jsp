<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css">
<script src="js/mainEventAndCk.js"></script>

<sec:authentication var="user" property="principal"/><!-- user.username user.password -->

<title>Home</title>

</head>
<body>
	<div class="background_main">

		<div class="text-center back-main">
			<sec:authorize access="isAnonymous()"> 
			
					<p class="main_title">투두래요</p><a href="/todo/todoMain">확인용 url = /todo/todoMain 권한 Role_User</a>
					<p>
						<a class="btn btn-primary btn-lg" href="/login" role="button">로그인</a>
						<a class="btn btn-success btn-lg" href="/register" role="button">회원가입</a>
					</p>
					
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
			
					<p class="main_title">안뇽하세욤 ${user.username } 님</p>
					<p>
						<a class="btn btn-primary btn-lg" href="/todo/todoInsert" role="button">일정 추가</a>
						<a class="btn btn-success btn-lg" href="/todo/todoMain" role="button">일정 관리</a>
					</p>
					
			</sec:authorize>
			
		</div>


	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>
