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
<title>Insert title here</title>
<style>
.reMain {
	margin: auto;
	margin-top: 230px;
}

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
	<div class="toppg">
		<div class="col-md-4"></div>
		<div class="col-md-4 ">
			<form action="/todo/todoInsert" method="post" name="regsterForm"
				class="text-center formRg form-horizontal">

				<input type='hidden' name='${_csrf.parameterName }'
					value='${_csrf.token }' />
				<h2>
					<span class="glyphicon glyphicon-plus"></span>&nbsp;<strong>일정
						추가</strong>
				</h2>
				<table class="table table-bordered table-hover ">
					<tr>
						<td class="zTd"><strong>카테고리</strong></td>
						<td><select class="form-control" name="cano">
								<option value="생활">생활</option>
								<option value="학업">학업</option>
								<option value="회사">회사</option>
								<option value="연예">연예</option>
								<option value="기타">기타</option>
						</select>
							<div class="idinfo"></div></td>
					</tr>

					<tr>
						<td class="zTd"><strong>제목</strong></td>
						<td><input type="text" id="text" name="todosubject"
							class="form-control" placeholder="" /></td>
					</tr>
					<tr>
						<td class="zTd"><strong>내용</strong></td>
						<td><textarea rows="5" name="todocontent" class="form-control"></textarea></td>
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
							class="btn btn-primary btn-lg btn-block" value="일정추가" /> <input
							type="reset" class="btn btn-success btn-lg btn-block" value="취소" />
							<div class="rginfotop"></div></td>
					</tr>

				</table>

			</form>
		</div>
		<div class="col-md-4"></div>

	</div>
</body>
</html>