<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<style>
.formRg {
	padding-top: 50px;
}

.sub {
	font-size: 40px;
}

.zTd {
	padding-top: 14px !important;
}
</style>
</head>
<body>
	<script>
		//확인용
		//alert(${todo.completion});
	</script>

	<div class="toppg">
		<div class="col-md-4"></div>
		<div class="col-md-4 formRg ">
			<form action="/todo/todoUpdate" method="post" name="regsterForm"
				class="text-center formRg form-horizontal">

				<input type='hidden' name='${_csrf.parameterName }'
					value='${_csrf.token }' />
				<h2>
					<span class="glyphicon glyphicon-tree-deciduous"></span>&nbsp;<strong>투두
						정보</strong>
				</h2>
				<input type="hidden" name="todono" value="${todo.todono }">
				<input type="hidden" name="id" value="${todo.id }">
				
				<table class="table table-bordered table-hover ">
					<tr>
						<td class="zTd"><strong>카테고리</strong></td>
						<td><select class="form-control" name="cano">
								<option value="생활">생활</option>
								<option value="학업">학업</option>
								<option value="회사">회사</option>
								<option value="연예">연예</option>
								<option value="기타">기타</option>
						</select></td>
					</tr>

					<tr>
						<td class="zTd"><strong>제목</strong></td>
						<td><input type="text" id="text" name="todosubject"
							class="form-control" placeholder="" value="${todo.todosubject }"/></td>
					</tr>
					<tr>
						<td class="zTd"><strong>내용</strong></td>
						<td><textarea rows="5" name="todocontent" class="form-control">${todo.todocontent }</textarea></td>
					</tr>

					<tr>
						<td class="zTd"><strong>시작일</strong></td>
						<td><input type="date" id="todostartdate" class="form-control"
									name="todostartdate" required /></td>
					</tr>
					<tr>
						<td class="zTd"><strong>마감일</strong></td>
						<td><input type="date" id="todoenddate" class="form-control" name="todoenddate"
									required /></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit"
							class="btn btn-primary btn-lg btn-block" value="수정하기" /> 
							<input type="button" onclick="javascript:location.href='/todo/todoMain'" class="btn btn-success btn-lg btn-block"
							value="돌아가기" /></td>
					</tr>

				</table>
				
				</form>
			</div>
		</div>
		<div class="col-md-4"></div>

</body>
</html>