<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- 이거 꼭 해줘야됨 부트스트랩 자바스크립트.. -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<title>회원가입</title>
<style>
.formRg {
	padding-top: 110px;
}

.sub {
	font-size: 40px;
}

.zTd {
	padding-top: 14px !important;
}
</style>
<script>
	function rgSubmitCk() {
		var ck = document.regsterForm.id.getAttribute('data-type');
		if(! $("#id").val()){
			return false;	
		}
		if (ck == "false") {
			$(".rginfotop").text('아놔 -- 아이디 중복됬다고--').css('color','red');
			return false;
		}
		
	}
	
	$(function(){
		$("#id").blur(function(){
			var id = {id:$("#id").val()};
			$.ajax({
				type : "GET",
				url : "/idCk",
				dataType : "text",
				data : id,
				success : function(result) {
					if (result == 'null') {
						if($("#id").val()){
						document.regsterForm.id.setAttribute('data-type','true');
						$(".idinfo").text('사용할 수 있는 아이디 입니다').css('color','skyblue');
						}
					}
					else{
						document.regsterForm.id.setAttribute('data-type','false');
						$(".idinfo").text('이미 사용중인 아이디 입니다').css('color','red');
					}
				}

			});
		});
	});
</script>
</head>
<body>

	<div class="col-md-4"></div>
	<div class="col-md-4">
		<form action="/register" method="post" name="regsterForm"
			class="text-center formRg form-horizontal"
			onsubmit="return rgSubmitCk()">
	
			
			<input type='hidden' name='${_csrf.parameterName }'
				value='${_csrf.token }' />
			<h2>
				<span class="glyphicon glyphicon-apple"></span>&nbsp;<strong>회원가입</strong>
			</h2>
			<table class="table table-bordered table-hover ">
				<tr>
					<td class="zTd"><strong>아이디</strong></td>
					<td><input type="text" id="id" name="id" class="form-control"
						data-type="false" placeholder="아이디 2글자이상" />
						<div class="idinfo">
							<div class="error">
								<form:errors path="user.id" cssClass="error"></form:errors>
							</div>
							<!-- element="div" -->
							<!-- 	<div id="id.errors" class="error">에러입니다</div> -->
						</div></td>
				</tr>

				<tr>
					<td class="zTd"><strong>패스워드</strong></td>
					<td><input type="text" id="password" name="password"
						class="form-control" placeholder="비밀번호 2글자이상" />
						<div class="error">
							<form:errors path="user.password"  cssClass="error"/>
						</div>
					</td>
					
				</tr>
				<tr>
					<td class="zTd"><strong>이름</strong></td>
					<td><input type="text" id="name" name="name"
						class="form-control" /></td>
				</tr>
				<tr>
					<td class="zTd"><strong>이메일</strong></td>
					<td><input type="text" id="email" name="email"
						class="form-control" placeholder="ex) kang@naver.com" />
						<div class="error">
							<form:errors path="user.email" cssClass="error"></form:errors>
						</div></td>
				</tr>
				<tr>
					<td class="zTd"><strong>주소</strong></td>
					<td><input type="text" id="addr" name="addr"
						class="form-control" /></td>
				</tr>
				<tr>
					<td class="zTd"><strong>성별</strong></td>
					<td><div class="btn-group form-horizontal"
							data-toggle="buttons">
							<label class="btn btn-info active"> <input type="radio"
								name="gender" id="option1" autocomplete="off" checked>
								남자
							</label> <label class="btn btn-info"> <input type="radio"
								name="gender" id="option2" autocomplete="off"> 여자
							</label>
						</div></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit"
						class="btn btn-primary btn-lg btn-block" value="회원가입" /> <input
						type="reset" class="btn btn-success btn-lg btn-block" value="취소" />
						<div class="rginfotop"></div>
					</td>
				</tr>

			</table>

		</form>
	</div>
	<div class="col-md-4"></div>
</body>
</html>