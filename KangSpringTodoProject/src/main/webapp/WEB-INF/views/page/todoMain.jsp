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
<title>Insert title here</title>
<style>
.reMain {
	margin: auto;
	margin-top: 130px;
	border: 1px solid black;
}

.cc {
	/* 	border: 1px solid black; */
	margin-top: 130px;
}

th {
	text-align: center;
} 
</style>
</head>
<body>
	<script>
	<!-- 확인용 -->
	
	
	</script>
	<div class="background_main">
		<div class="col-md-2 aa"></div>
		<div class="col-md-8 text-center">
			<div class="reMain ">
				<h2>일정목록</h2>
				<table class="table table-hover table-condensed text-center">
					<tr>
						<th id="no">NO</th>
						<th id="subject">제목</th>
						<th id="cate">카테고리</th>
						<th>시작일</th>
						<th>마감일</th>
						<th>완료여부</th>
						<th></th>
					</tr>
					<c:set var="n" value="1" />
					<c:if test="${todoCount == 0}">
						<tr><td colspan="7">게시글이 없습니당.</td></tr>
					</c:if>
					<c:if test="${todoCount != 0 }">
						<c:forEach var="i" items="${todoList }">
							<tr>


								<td>${n }</td>
								<td>${i.todosubject }</td>
								<td>${i.cano }</td>
								<td>${i.todostartdate }</td>
								<td>${i.todoenddate }</td>
								<td>${i.completion == false ? '미완료' : '완료' }</td>
								<td><input type="button" value="상세정보" class="btn btn-info"
									onclick="javascript:location.href='todoDetail?todono=${i.todono}';"></td>

							</tr>
							<c:set var="n" value="${n+1 }" />
						</c:forEach>
						<tr>
								<td colspan="7">
									<c:if  test="${todoCount > 0}"  >
										<c:if  test="${startPg > pageGroup}">
											<a  href="todoMain?pageNum=${startPg - pageGroup}">[이전]</a>
										</c:if>
										<c:forEach  var="i"  begin="${ startPg }"  end="${ endPg }">
											<c:if  test="${ i == pageNum }">
												[${  i  }]
											</c:if>
											<c:if  test="${ i != pageNum }">
												<a  href="todoMain?pageNum=${i }">[${i }]</a>
											</c:if>
										</c:forEach>
										<c:if  test="${endPg < listPg}">
											<a  href="todoMain?pageNum=${startPg + pageGroup}">[다음]</a>
										</c:if>
									</c:if>
								</td>
							</tr>
					</c:if>
				</table>
			</div>
		</div>
		<div class="col-md-2"></div>

	</div>
</body>
</html>