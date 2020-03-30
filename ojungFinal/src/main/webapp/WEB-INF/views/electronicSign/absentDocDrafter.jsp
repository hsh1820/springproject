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
   href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
   href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
   rel="stylesheet">
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
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
         </section>


         <!-- Main content -->
         <div class="content">
            <div class="container-fluid">
               <div class="row">
                  <!-- left column -->
                  <div class="col-md-10">
                     <!-- general form elements -->
                     <div>
                        <!-- <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div> -->
                        <!-- /.card-header -->


                        <!-- Input addon -->
                        <div class="card card-info">
                           <div class="card-header bg-navy">
                              <h3 class="card-title">결재</h3>
                           </div>
                           <div class="card-body">
							<input type="hidden" value="${docList[0].docNo}">
                              <div class="input-group mb-3">
                                 <div class="input-group-prepend mb-3">
                                    <span class="input-group-text">제목</span>
                                 </div>
                                 <input type="text" class="form-control mb-3"
                                    style="background-color: white;" readonly
                                    value="${docList[0].docTitle}">
                              </div>


                              <div class="input-group mb-3">
                                 <div class="input-group mb-3" style="width: 60%;">
                                    <div class="input-group-prepend">
                                       <span class="input-group-text">결근 일자</span>
                                    </div>
                                    <input type="text" class="form-control"
                                       style="background-color: white; margin-right: 10px;"
                                       value="${docList[0].absentStartDt}" readonly> ~
                                    <input type="text" class="form-control"
                                    style="background-color: white; margin-right: 10px;"
                                    value="${docList[0].absentEndDt}" readonly>
                                       
                                 </div>
                              </div>

                              <div class="input-group mb-3">
                                 <div class="input-group mb-3" style="width: 50%;">
                                    <div class="input-group-prepend">
                                       <span class="input-group-text">기안자</span>
                                    </div>
                                    <input type="text" class="form-control"
                                       style="background-color: white; margin-right: 10px;"
                                       value="${docList[0].drafterName}" readonly>
                                 </div>
                                 
                                    <div class="input-group mb-3" style="width: 50%;">
                                    <div class="input-group-prepend">
                                       <span class="input-group-text">상신일</span>
                                    </div>
                                    <input type="date" class="form-control"
                                       style="background-color: white; margin-right: 10px;"
                                       value="${docList[0].insertDate }" readonly>
                                 </div>
                                 

                                
                              </div>

                              <div class="input-group mb-3">
                                 <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                       <span class="input-group-text" style="width: 100px;">결근사유</span>
                                    </div>
                                    <textarea class="form-control "
                                       style="height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; 
                                       padding: 10px; resize: none; background-color: white;" readonly>${docList[0].docContents}</textarea>
                                 </div>
                              </div>
							
							<c:if test="${docList[0].docStatus == 3}">
							<hr id="rejectHr">
							 <div class="input-group mb-3" id="rejectDiv">
                                 <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                       <span class="input-group-text" style="width: 100px;">반려사유</span>
                                    </div>
                                    <c:forEach var="docList" items="${docList}">
                                    <c:if test="${!empty docList.ssComment}">
                                    <textarea class="form-control "
                                       style="height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; 
                                       padding: 10px; resize: none; background-color: white;" readonly>${docList.ssComment}</textarea>
                                       </c:if>
                                     </c:forEach>
                                 </div>
                              </div>
							</c:if>

                              <!-- /input-group -->
                              <!-- /.card-body -->
                           </div>
                        </div>
                     </div>


                     <!-- /.card -->
                  </div>
                  <div class="col-md-2 pl-3">
                     <div class="row" style="width: 100%">
                        <div class="card row" style="width: 100%">
                          <div class="card-header bg-navy">
									<h3 class="card-title">
										<i class="fas fa fa-book-reader"></i>&nbsp; 결재선
									</h3>
								</div>

                           <!-- /.card-header -->
                           <!-- form start -->
                        	<div class="card-body">
										<ul class="list-group">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												이대리 <span class="badge badge-info badge-pill">기안</span>
												<p style="font-size: small; color: lightslategrey;">${docList[0].insertDate}</p>
											</li>
											<c:forEach var="docList" items="${docList}">
												<i class="fas fa-angle-down fa-2x mt-2 mb-2 ml-5"></i>
												<li
													class="list-group-item d-flex justify-content-between align-items-center">
													${docList.payerName} <c:if test="${docList.ssResult == 0}">
														<span class="badge badge-primary badge-pill">대기중</span>
													</c:if> <c:if test="${docList.ssResult == 1}">
														<span class="badge badge-primary badge-pill">승인</span>
													</c:if> <c:if test="${docList.ssResult == 2}">
														<span class="badge badge-primary badge-pill">반려</span>
													</c:if>
													<p style="font-size: small; color: lightslategrey;">${docList.signDate}</p>
												</li>
												<p style="color: lightslategrey; font-size: small;"></p>
											</c:forEach>
										</ul>


									</div>
                           <!-- cardBody-->
                        </div>
                        <!-- 결재라인 끝 (결재선) -->
                     </div>
					
							<div class="card row" style="width: 100%">
								<div class="card-header bg-navy">
									<h3 class="card-title">
										<i class="fas fa fa-book-reader"></i>&nbsp; 첨부파일
									</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<div class="card-body">
									<c:if test="${empty files}">
                    	 			등록된 파일이 없습니다.
                    				 </c:if>
									<c:forEach var="files" items="${files}">
										<c:if
											test="${files.realName  != '' || files.realName ne null}">
											<c:set var="formatString" value="${files.realName }" />

											<a
												href="${contextPath}/resources/uploadFiles/${files.fileName}"
												class="btn-link text-secondary" download> <c:choose>
													<c:when test="${fn:contains(formatString,'png')}">
														<i class="far fa-fw fa-image " style="display: inline"></i>
													</c:when>

													<c:when test="${fn:contains(formatString,'docx')}">
														<i class="far fa-fw fa-file-word" style="display: inline"></i>
													</c:when>

													<c:when test="${fn:contains(formatString,'pdf')}">
														<i class="far fa-fw fa-file-pdf" style="display: inline"></i>
													</c:when>

													<c:when test="${fn:contains(formatString,'mln')}">
														<i class="far fa-fw fa-envelope" style="display: inline"></i>
													</c:when>

													<c:otherwise>
														<i class="far fa-fw fa-file" style="display: inline"></i>
													</c:otherwise>
												</c:choose> ${files.realName}
											</a> &nbsp;
                        				</c:if>
									</c:forEach>
								</div>
							</div><!-- 첨부파일 div끝-->
							
							<c:if test="${docList[0].docStatus == 4}">
							<div class="card row" style="width: 100%">
							<button onclick="location.href='${contextPath}/electronicSign/signPDF?no=${docList[0].docNo}'">인쇄 미리 보기</button>
							</div>
							</c:if>
                  </div>
                  <!--/.col (right) -->
               </div>

               <!-- /.row -->


            </div>
            <!-- /.container-fluid -->

         </div>
      </div>
   </div>
   <!-- /.content-wrapper -->

   <jsp:include page="../common/footer.jsp" />

   <!-- Control Sidebar -->
   <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
   </aside>
   <!-- /.control-sidebar -->

   <!-- ./wrapper -->


   <!-- Bootstrap 4 -->
   <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   
   <!-- AdminLTE App -->
   <script src="<%=request.getContextPath() %>/resources/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
   
  
</body>

</html>