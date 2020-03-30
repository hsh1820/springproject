<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 부서게시판</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
<style>
.pagination {
	justify-content: center;
}

.fixedHeader {
	position: sticky;
	top: 0;
	background-color: lightsteelblue;
}
</style>
</head>

<body>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../common/nav.jsp" />
		<jsp:include page="../common/sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header bg-navy">
								<h3 class="card-title">부서 게시판</h3>
								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse" data-toggle="tooltip"
										title="Collapse">
										<i class="fas fa-minus"></i>
									</button>

									<button type="button" class="btn btn-tool"
										data-card-widget="remove" data-toggle="tooltip" title="Remove">
										<i class="fas fa-times"></i>
									</button>
								</div>

								<form action="departmentBoardList" method="GET"
									class="text-center" id="searchForm">
									<div class="input-group input-group-sm float-right"
										style="width: 450px;">
										<select name="searchKey" class="form-control"
											style="width: 30px; display: inline-block;">
											<!-- <option value="title" selected>글제목</option> -->
											<option value="title">글제목</option>
											<option value="content">내용</option>
											<option value="titcont">제목+내용</option>
										</select> <input type="text" name="searchValue" style="width: 270px"
											class="form-control float-right" placeholder="Search">

										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
							<!-- /.card-header -->
							<div class="card-body p-0 " style="width: 100%;">
								<ol class="breadcrumb ">
									<!-- <li class="breadcrumb-item "><a href="#">${deptName}</a></li> -->
									<li class="breadcrumb-item active">[${deptName}]게시판 입니다.</li>
								</ol>


								<table class="table table-hover text-center" id="list-table">
									<thead>
										<tr>
											<th class="fixedHeader">게시글 번호</th>
											<th class="fixedHeader">제목</th>
											<th class="fixedHeader">작성자</th>
											<th class="fixedHeader">조회수</th>
											<th class="fixedHeader">작성일</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${empty boardList }">
											<tr>
												<td colspan="5">등록된 게시글이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty boardList }">
											<c:forEach var="deptBoard" items="${boardList}"
												varStatus="vs">
												<tr>
													<td style="text-align: center;">${deptBoard.boardNo}</td>
													<td>
													<%-- <a href="${contextPath }/departmentBoard/departmentBoardDetail?no=${deptBoard.boardNo}" style="color:black;"> --%>
													${deptBoard.boardTitle} [${deptBoard.recnt }]
													<!-- </a> -->
													</td>
													<td>${deptBoard.memberName}</td>
													<td>${deptBoard.boardCount}</td>
													<td>${deptBoard.createDate}</td>
												</tr>


											</c:forEach>
										</c:if>
									</tbody>
									<tfoot>

									</tfoot>
								</table>

							</div>
							<!-- /.card-body -->


							<div class="card-footer">
								<c:if test="${ !empty loginMember}">
									<button type="button" onclick="location.href = 'insertForm';"
										class="btn btn-outline-primary" id="insertBtn"
										style="float: right; margin-right: 2%; width: 100px; height: 40px;">
										글 쓰기</button>
								</c:if>


								<!--------------------------------- 페이징바  ---------------------------------->
								<div style="clear: both;">
									<ul class="pagination">
										<c:if test="${pInf.currentPage > 1}">
											<li>
												<!-- 맨 처음으로(<<) --> <!--  c:url 태그에 var 속성이 존재하지 않으면 변수처럼 사용되는 것이 아닌,  작성된 자리에 바로 URL 형식으로 표기된다. -->
												<a class="page-link text-success"
												href=" 
		                    	<c:url value="departmentBoardList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="1"/>
		                    	</c:url>
	                    	">
													&lt;&lt; </a>
											</li>

											<li>
												<!-- 이전으로(<) --> <a class="page-link text-success"
												href=" 
		                    	<c:url value="departmentBoardList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage-1}"/>
		                    	</c:url>
	                    	">
													&lt; </a>
											</li>
										</c:if>

										<!-- 10개의 페이지 목록 -->
										<c:forEach var="p" begin="${pInf.startPage}"
											end="${pInf.endPage}">


											<c:if test="${p == pInf.currentPage}">
												<li><a class="page-link">${p}</a></li>
											</c:if>

											<c:if test="${p != pInf.currentPage}">
												<li><a class="page-link text-success"
													href=" 
			                    	<c:url value="departmentBoardList">
			                    		<c:if test="${!empty param.searchKey }">
							        		<c:param name="searchKey" value="${param.searchKey}"/>
							        	</c:if>
							        	
							        	<c:if test="${!empty param.searchValue }">
							        		<c:param name="searchValue" value="${param.searchValue}"/>
							        	</c:if>
			                    		<c:param name="currentPage" value="${p}"/>
			                    	</c:url>
		                    	">
														${p} </a></li>
											</c:if>

										</c:forEach>

										<!-- 다음 페이지로(>) -->
										<c:if test="${pInf.currentPage < pInf.maxPage }">
											<li><a class="page-link text-success"
												href=" 
		                    	<c:url value="departmentBoardList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
		                    	</c:url>
	                    	">
													&gt; </a></li>

											<!-- 맨 끝으로(>>) -->
											<li><a class="page-link text-success"
												href=" 
		                    	<c:url value="departmentBoardList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.maxPage}"/>
		                    	</c:url>
	                    	">
													&gt;&gt; </a></li>

										</c:if>
									</ul>
								</div>



							</div>

						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../common/footer.jsp" />
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- 페이지 이동 후 검색 결과가 검색창 input태그에 표시되도록 하는 script.  -->
	<script>
	
		$(function(){
			var searchKey = "${param.searchKey}";
			var searchValue = "${param.searchValue}";
			
			if(searchKey != "null" && searchValue != "null"){
				$.each($("select[name=searchKey] > option"), function(index, item){
					if($(item).val() == searchKey){
						$(item).prop("selected","true");
					} 
				});
				
				$("input[name=searchValue]").val(searchValue);
			}
				
		});
		
	</script>


	<script>
		//  상세보기 기능 (jquery를 통해 작업)
		$(function(){
			$("#list-table td").click(function(){
				var no = $(this).parent().children().eq(0).text();
				// 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
				 <c:url var="detailUrl" value="departmentBoardDetail">
              		<c:if test="${!empty param.searchKey }">
	        		<c:param name="searchKey" value="${param.searchKey}"/>
		        	</c:if>
		        	<c:if test="${!empty param.searchValue }">
		        		<c:param name="searchValue" value="${param.searchValue}"/>
		        	</c:if>
		        	
                 	<c:param name="currentPage" value="${pInf.currentPage}"/>
               	</c:url>
				 
				location.href="${contextPath }/departmentBoard/departmentBoardDetail?no="+no;
			
			}).mouseenter(function(){
				$(this).parent().css("cursor", "pointer");
			
			});
			
		});
		

		
	</script>

	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.js"></script>

	<!-- OPTIONAL SCRIPTS -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/chart.js/Chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/pages/dashboard3.js"></script>


</body>
</html>