<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<title>로그인</title>
<style>
body {
	height: -webkit-fill-available;
	position: absolute;
	width: -webkit-fill-available;
}

#loginform {
	margin: auto;
	margin-top: 230px;
}
.zTd{
	padding-top: 14px !important;
}
</style>
</head>
<body>
	<div class="toppg">
		<div class="col-md-4"></div>
		<div class="col-md-4 ">
			
			<form action='/login' method='POST' id="loginform" class="text-center">
				<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />
				<h2><span class="glyphicon glyphicon-user"></span>&nbsp;<strong>로그인</strong></h2>
				<p style="color:red">${error }</p>
				<table class="table table-bordered table-hover">
					<tr>
						<td class="zTd"><strong>아이디</strong></td>
						<td><input id="id" type="text" class="form-control" name="id" /></td>
					</tr>
					<tr>
						<td class="zTd"><strong>비밀번호</strong></td>
						<td><input id="password" type="password" name="password" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-primary btn-lg btn-block" value="로그인"/>
							
						</td>
					</tr>
					
				</table>
			</form>
		</div>
		<div class="col-md-4"></div>

	</div>
</body>
</html>