<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.kh.ojungFinal.admin.model.vo.Member"%>
<%@page import="com.kh.ojungFinal.notice.model.vo.NoticeCategory"%>
<%@page import="com.kh.ojungFinal.notice.model.vo.NoticeView"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 전자결재</title>
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
<script
	src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
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
					<div class="row mb-2">
						
						<!-- <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Simple Tables</li>
            </ol>
          </div> -->
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header bg-navy ">
							<div class="card-title">
							공지사항
							</div>
								<form action="noticeList" method="GET" class="text-center"
									id="searchForm">
									<div class="input-group input-group-sm float-right"
										style="width: 450px;">
										<select name="searchKey" class="form-control"
											style="width: px; display: inline-block;">
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
									</div>
								</form>
							</div>
							<!-- /.card-header -->

							<div class="card-body table-responsive p-0  noticeList">
								<table class="table table-hover text-nowrap" id="list-table"
									style="text-align: center;">
									<thead style="background-color:lightsteelblue; ">
										<tr>
											<th>글번호</th>
											<th>카테고리</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										 <c:if test="${empty list }">
											<tr>
												<td colspan="6">존재하는 공지사항이 없습니다.</td>
											</tr>
										</c:if> 
										<c:if test="${!empty list }">
											<c:forEach var="noticeView" items="${list}" varStatus="vs">
												<tr>
													<c:if test="${noticeView.noticeName eq '사내공지'}" > 
																<td style="background-color:  rgba(221, 221, 221, 0.5);">${noticeView.noticeNo}</td>
																<td style="background-color:  rgba(221, 221, 221, 0.5);"><b>[${noticeView.noticeName}]</b></td>
																<td style="background-color:  rgba(221, 221, 221, 0.5);">${noticeView.noticeTitle}</td>
																<td style="background-color:  rgba(221, 221, 221, 0.5);">${noticeView.memberName}</td>
																<td style="background-color:  rgba(221, 221, 221, 0.5); ">${noticeView.noticeUpdateDate}</td>
													</c:if>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${!empty nList }">
											<c:forEach var="noticeView" items="${nList}" varStatus="vs">
												<tr >
													<c:if test="${noticeView.noticeName eq '부서공지'}" >
																<td>${noticeView.noticeNo}</td>
																<td>${noticeView.noticeName}</td>
																<td>${noticeView.noticeTitle}</td>
																<td>${noticeView.memberName}</td>
																<td>${noticeView.noticeUpdateDate}</td>
													</c:if>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<div class="card-footer">
									<div class="float-right">
										<c:if
											test="${ !empty loginMember && loginMember.memberGrade == '1' }">
											<button type="button" class="btn btn-primary" onclick="location.href = 'insertForm';">
												<i class="fas fa-pencil-alt"></i> 글쓰기
											</button>
										</c:if>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
				</div>
				<!--------------------------------- 페이징바  ---------------------------------->
				<div style="clear: both;">
	            <ul class="pagination justify-content-center m-0">
	            	<c:if test="${pInf.currentPage > 1}">
		                <li class="page-item">
		                	<!-- 맨 처음으로(<<) -->
		                	<!-- 
		                		c:url 태그에 var 속성이 존재하지 않으면 변수처럼 사용되는 것이 아닌, 
		                		작성된 자리에 바로 URL 형식으로 표기된다.  
		                	-->
		                    <a class="page-link "  style="color : grey;" 
		                    	href=" 
		                    	<c:url value="noticeList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="1"/>
		                    	</c:url>
	                    	">
			                    <i class="fas fa-angle-double-left"></i>
			                </a>
		                </li>
		                
		                <li class="page-item">
		                	<!-- 이전으로(<) -->
	                   		<a class="page-link " style="color : grey;" 
		                    	href=" 
		                    	<c:url value="noticeList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage-1}"/>
		                    	</c:url>
	                    	">
			                    <i class="fas fa-angle-left"></i>
			                </a>
		                </li>
	                </c:if>
	                
	                <!-- 10개의 페이지 목록 -->
	                <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                
	                
	                	<c:if test="${p == pInf.currentPage}">
			                <li class="page-item">
			                    <a class="page-link">${p}</a>
			                </li>
		                </c:if>
	                	
	                	<c:if test="${p != pInf.currentPage}">
	                		<li class="page-item">
		                    	<a class="page-link "  style="color : grey;" 
			                    	href=" 
			                    	<c:url value="noticeList">
			                    		<c:if test="${!empty param.searchKey }">
							        		<c:param name="searchKey" value="${param.searchKey}"/>
							        	</c:if>
							        	
							        	<c:if test="${!empty param.searchValue }">
							        		<c:param name="searchValue" value="${param.searchValue}"/>
							        	</c:if>
			                    		<c:param name="currentPage" value="${p}"/>
			                    	</c:url>
		                    	">
				                    ${p}
				                </a>
		                	</li>
	                	</c:if>
	                	
                	</c:forEach>
	                
	                <!-- 다음 페이지로(>) -->
	                <c:if test="${pInf.currentPage < pInf.maxPage }">
		                <li class="page-item">
							<a class="page-link "  style="color : grey;" 
		                    	href=" 
		                    	<c:url value="noticeList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
		                    	</c:url>
	                    	">
			                   <i class="fas fa-angle-right"></i>
			                </a>
		                </li>
		                
		                <!-- 맨 끝으로(>>) -->
		                <li class="page-item">
		                    <a class="page-link "  style="color : grey;" 
		                    	href=" 
		                    	<c:url value="noticeList">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.maxPage}"/>
		                    	</c:url>
	                    	">
			                    <i class="fas fa-angle-double-right"></i>
			                </a>
		                </li>
	                
	                </c:if>
	            </ul>
	            </div>
		</section>
		<!-- /.container-fluid -->
		<!-- /.content -->
	</div>
	<jsp:include page="../common/footer.jsp" />
	<!-- /.content-wrapper -->

	</div>
	<!-- ./wrapper -->


	<script>
		// 공지사항 상세보기 기능 (jquery를 통해 작업)
		$(function(){
			$("#list-table td").click(function(){
				var noticeNo = $(this).parent().children().eq(0).text();
				// 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
				<c:url var="detailUrl" value="detail">
              		<c:if test="${!empty param.searchKey }">
	        		<c:param name="searchKey" value="${param.searchKey}"/>
		        	</c:if>
		        	<c:if test="${!empty param.searchValue }">
		        		<c:param name="searchValue" value="${param.searchValue}"/>
		        	</c:if>
		        	
                 	<c:param name="currentPage" value="${pInf.currentPage}"/>
               	</c:url>
				
				location.href="${detailUrl}&no="+noticeNo;
			
			}).mouseenter(function(){
				$(this).parent().css("cursor", "pointer");
			
			});
		});
	</script>
	
	<script>
		 // 오늘 날짜 출력 
       	 var today = new Date();
  
         var str = today.getFullYear() + "-"
             + (today.getMonth()+1) + "-"
             + today.getDate();
     	 $("#today").html(str);
    </script>
    



	<!-- REQUIRED SCRIPTS -->

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
		src="<%=request.getContextPath() %>/resources/dist/js/pages/dashboard3.js"></script>
</body>
</html>