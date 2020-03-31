<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>(주) 오정상사 인트라넷</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fullcalendar-bootstrap/main.min.css">
  
  
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/css/fullcalendar.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/css/select2.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/css/bootstrap-datetimepicker.min.css">
  
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<!-- jQuery -->
	<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
	<style>
   .fc-sun {
      color:red;
   }

   .fc-sat {
      color:blue;
   }
   
</style>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to to the body tag
to get the desired effect
|---------------------------------------------------------|
|LAYOUT OPTIONS | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="nav.jsp" />
		<jsp:include page="sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->


			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<section class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-0" style="background-color: transparent">
									<div class="sticky-top mb-3">
										<div class="card">
											<div class="card-body" id="del">
												<!-- the events -->
												<div id="external-events">
												</div>
											</div>
											<!-- /.card-body -->
										</div>
										<!-- /.card -->
									</div>
								</div>
								
								
								<!-- /.col -->
								<div class="col-md-12">
									<div class="card card-primary">
										<div class="card-body p-0">
											<!-- THE CALENDAR -->
											<div id="calendar"></div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.container-fluid -->
					</section>
					<!-- ----------------------------------------------------------------------------------------------------------- -->
					<div class="row">
						<div class="col-lg-7">
							<div class="card">
								<div class="card-header">
									<div class="d-flex">
										<h3 class="card-title">최신게시글</h3>
									</div>
								</div>
								<div class="card-body" style="height: 290px">
									<table class="table table-hover text-nowrap  text-center" id="list-table">
										<thead>
											<tr>
												<th>
													<!-- 게시판 구분-->
												</th>
												<th>작성자</th>
												<th>제목</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${empty rList }">
												존재하는 최신게시글이 없습니다.
										</c:if>
										<c:if test="${!empty rList}">
												<c:forEach var="rBoard" items="${rList}" varStatus="vs"
													begin="0" end="3" step="1">
													<tr>
														<c:choose>
															<c:when test="${rBoard.rBoardType == 1}">
																<td class="badge badge-pill badge-success">부서
																<input type="hidden" value="${rBoard.rBoardNo}" id="rBoardNo">
																<input type="hidden" value="${rBoard.rBoardType}" id="rBoardType"></td>
															</c:when>
															<c:otherwise>
																<td class="badge badge-pill badge-danger">협업
																<input type="hidden" value="${rBoard.rBoardNo}" id="rBoardNo">
																<input type="hidden" value="${rBoard.rBoardType}" id="rBoardType"></td>
															</c:otherwise>
														</c:choose>
														<td>${rBoard.rMemberName}</td>
														<td>${rBoard.rBoardTitle}</td>
														<td>${rBoard.changeDate}</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- /.card -->


						<div class="col-lg-5">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">공지사항</h3>
									<a href="${contextPath}/notice/noticeList" style="float: right;"><span><i class="fas fa-plus"></i></span></a>
								</div>
								<div class="card-body" style="height: 112px">
									<c:if test="${empty noticeList}">
											존재하는 공지사항이 없습니다.
										</c:if>
									<c:if test="${!empty noticeList }">
										<c:forEach var="notice" items="${noticeList}" varStatus="vs">
											<a href="${contextPath}/notice/detail?no=${notice.noticeNo}"> ${notice.noticeTitle}</a>
											<br>
										</c:forEach>
									</c:if>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h3 class="card-title">결제대기문서</h3>
									<a href="${contextPath}/electronicSign/electronicSignList_payer" style="float: right;"><span><i class="fas fa-plus"></i></span></a>
								</div>
								<div class="card-body" style="height: 112px">
									<c:if test="${empty mainSignList}">
											존재하는 결재대기문서가 없습니다.
										</c:if>
									<c:if test="${!empty mainSignList}">
										<c:forEach var="sign" items="${mainSignList}" varStatus="vs">
											<a href="${contextPath}/electronicSign/sgnDocReceiver?no=${sign.docNo}"> ${sign.docTitle}</a>
											<br>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
						<!-- /.col-md-6 -->
					</div>
				</div>
			</div>
			<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
	<jsp:include page="footer.jsp" />
			</div>
			<!-- /.content -->
		


	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->

	<!-- ./wrapper -->

<%-- <!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script> --%>
<!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="<%=request.getContextPath() %>/resources/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/plugins/fullcalendar/main.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/plugins/fullcalendar-daygrid/main.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/plugins/fullcalendar-timegrid/main.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/plugins/fullcalendar-interaction/main.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/plugins/fullcalendar-bootstrap/main.min.js"></script>
<!-- Page specific script -->
<script>

      // 게시글 상세보기 기능 (jquery를 통해 작업)
      $(function(){
         $("#list-table td").click(function(){
            var rBoardNo = $(this).parent().children().eq(0).children('#rBoardNo').val();
            console.log(rBoardNo);
            var rBoardType = $(this).parent().children().eq(0).children('#rBoardType').val();
            console.log(rBoardType);
            
            if(rBoardType == 1){
            	// 부서게시판
            	location.href="${contextPath}/departmentBoard/departmentBoardDetail?no="+rBoardNo;
            }else{
            	location.href="${contextPath}/collaboBoard/detail?no="+rBoardNo;
            }
            // 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
            //<c:url var="detailUrl" value="detail"></c:url>
            
           // location.href="${detailUrl}&no="+boardNo;
            
            //location.href="${contextPath}/board/detail?no=" + boardNo +"&currentPage="+${pInf.currentPage};
         
         }).mouseenter(function(){
            $(this).parent().css("cursor", "pointer");
         
         });
         
      });
      
</script>

<script>
$("#del").remove();
</script>
	<!-- jQuery -->
	<%-- <script src="<%=request.getContextPath() %>/resources/plugins/js/jquery.min.js"></script> --%>
	<!-- Bootstrap -->
	<script src="<%=request.getContextPath() %>/resources/plugins/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath() %>/resources/dist/js/adminlte.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/plugins/jquery-ui/jquery-ui.min.js"></script>

<%-- 	<script
		src="<%=request.getContextPath() %>/resources/plugins/fullcalendar-daygrid/main.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/plugins/fullcalendar-timegrid/main.min.js"></script> --%>
	<!-- fullCalendar 2.2.5 -->
	<script
		src="<%=request.getContextPath() %>/resources/plugins/js/moment.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/plugins/js/fullcalendar.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/plugins/js/ko.js"></script>
	<script src="<%=request.getContextPath() %>/resources/plugins/js/select2.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/plugins/js/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/mainMain.js"></script> 
<%-- 	<script src="<%=request.getContextPath() %>/resources/js/addEvent.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/editEvent.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/etcSetting.js"></script> --%>
	
</body>
</html>
