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
<script src="../js/todoDetail.js"></script>
<title>Insert title here</title>
<style>
.formRg {
	padding-top: 80px;
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
			<div class="detail_main text-center">
				<h2>
					<span class="glyphicon glyphicon-tree-deciduous"></span>&nbsp;<strong>투두
						정보</strong>
				</h2>
				<c:choose>
					<c:when test="${todo.completion == 'true'}">
						<script>
							$(function() {
								$('#completionbt').attr('value', '완료됨')
										.addClass('btn-success');
							});
						</script>
					</c:when>
					<c:otherwise>
						<script>
							$(function() {
								$('#completionbt').removeClass('btn-success')
										.addClass('btn-default').val('완료하기');
							});
						</script>
					</c:otherwise>
				</c:choose>
				<p>
					<input type="button" class="btn btn-sm" id="completionbt">
				</p>
				<input type="hidden" id="aa" value="${todo.todono }" /> <input
					type="hidden" id="bb" value="${todo.completion }" />
				<table class="table table-bordered table-hover ">
					<tr>
						<td class="zTd"><strong>카테고리</strong></td>
						<td><label class="control-label">${todo.cano }</label></td>
					</tr>

					<tr>
						<td class="zTd"><strong>제목</strong></td>
						<td><label class="control-label">${todo.todosubject }</label></td>
					</tr>
					<tr>
						<td class="zTd"><strong>내용</strong></td>
						<td><textarea rows="5" class="form-control"
								disabled="disabled">${todo.todocontent }</textarea></td>
					</tr>

					<tr>
						<td class="zTd"><strong>시작일</strong></td>
						<td><label class="control-label">${todo.todostartdate }</label></td>
					</tr>
					<tr>
						<td class="zTd"><strong>마감일</strong></td>
						<td><label class="control-label">${todo.todoenddate }</label></td>
					</tr>

					<tr>
						<td colspan="2"><input type="button"
							class="btn btn-primary btn-lg btn-block" onclick="javascript:location.href='/todo/todoUpdateF?todono=${todo.todono}'" value="수정하기" /> <input
							type="button" class="btn  btn-block btn-danger btn-lg" value="삭제하기"
							onclick="javascript:location.href='/todo/tododelete?todono=${todo.todono}';">
							<input type="button" onclick="javascript:location.href='/todo/todoMain'" class="btn btn-success btn-lg btn-block"
							value="돌아가기" /></td>
					</tr>

				</table>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
</body>
</html>