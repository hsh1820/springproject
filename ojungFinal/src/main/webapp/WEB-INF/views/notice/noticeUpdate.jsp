<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/summernote/summernote-bs4.css">
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
						<div class="col-sm-6">
							<h1>공지사항 수정</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">

					<!-- form 태그 시작 -->
					<form class="col-md-12" method="POST"
						action="update?no=${noticeView.noticeNo}"
						enctype="multipart/form-data" role="form"
						onsubmit="return validate();">
						<div class="col-md-12">
							<div class="card card-outline card-primary">
								<div class="card-header">
									<div class="form-group row" style="margin-bottom: 0;">
										<label for="inputTitle3" class="col-md-1 col-form-label"
											style="text-align: center;" style="margin-bottom: 0;">제목</label>
										<div class="col-md-10">
											<input type="text" class="form-control" id="inputTitle3"
												value="${noticeView.noticeTitle}" name="noticeTitle">
										</div>
										<div class="form-group col-md-1">
											<select class="form-control" name="category">
												<option value="1" <c:if test="${noticeView.noticeCode == '1'}">selected='selected'</c:if>>사내공지</option>
												<option value="2" <c:if test="${noticeView.noticeCode == '2'}">selected='selected'</c:if>>부서공지</option>
											</select>
										</div>
										<label for="inputTitle3" class="col-md-1 col-form-label"
											style="text-align: center;" style="margin-bottom: 0;">첨부파일</label>
										<div class="col-md-11">
											<div class="input-group">
												<div class="custom-file">
													<label  class="custom-file-label" for="exampleInputFile">
												<c:forEach var="files" items="${files}" varStatus="vs">
												${files.fileOriginName}
												</c:forEach>
												</label> 
													<input multiple="multiple" type="file" class="custom-file-input" id="exampleInputFile" name="noticeFile" >
												</div>
											</div>
										</div>


										<!-- items="${files}" -> 이미지 등록한 모든 목록 -->
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body pad">
									<div class="mb-3">
										<textarea class="form-control"
											placeholder="Place some text here" id="compose-textarea"
											name="noticeContent"
											style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
											${noticeView.noticeContent }
										</textarea>
									</div>
									<!-- <p class="text-sm mb-0">
                Editor <a href="https://github.com/bootstrap-wysiwyg/bootstrap3-wysiwyg">Documentation and license
                information.</a>
              </p> -->
									<div class="float-right">
										<button type="submit" class="btn primary">수정</button>
										<a href="${header.referer}" class="btn primary">목록으로</a>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- form 태그 종료 -->
				</div>
				<!-- /.col-->
			</section>
		</div>
		<!-- ./row -->
		<!-- /.content -->
		<jsp:include page="../common/footer.jsp" />
	</div>
	<!-- /.content-wrapper -->
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<script>
		/* // 유효성 검사
		function validate() {
			if ($("#title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#content").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		} */
		
		// 유효성 검사
 		function validate() {
 			if ($("#inputTitle3").val().trim().length == 0) {
 				alert("제목을 입력해 주세요.");
 				$("#inputTitle3").focus();
 				return false;
 			}

 			if ($("#compose-textarea").val().trim().length == 0) {
 				alert("내용을 입력해 주세요.");
 				$("#compose-textarea").focus();
 				return false;
 			}
 		}

		
		/* $(function () {
		   // Summernote
		   $('.textarea').summernote()
		 })
		 */
		$(document).ready(function() {
			$('#compose-textarea').summernote({
				height : 500, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true
			// set focus to editable area after initializing summernote
			});
		});
	</script>

	<!-- bs-custom-file-input -->
	<script
		src="${contextPath }/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js">
		
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>



	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.js"></script>



	<!-- Summernote -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- Page Script -->

</body>
</html>