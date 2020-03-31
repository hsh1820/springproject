<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>(주) 오정상사 | 일정</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- fullCalendar -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/css/fullcalendar.min.css">
<%--   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fullcalendar/main.min.css"> --%>
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/plugins/fullcalendar-daygrid/main.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/plugins/fullcalendar-timegrid/main.min.css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fullcalendar-bootstrap/main.min.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">

<!-- ***********************************이거 때문에 사이드바 깨짐 ******************************************-->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/css/bootstrap.min.css">
<!-- ********************************************************************************************************* -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/css/select2.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/css/bootstrap-datetimepicker.min.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fullcalendar-timegrid/main.min.css"> --%>

<!-- Theme style -->
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script src="<%=request.getContextPath() %>/resources/plugins/js/jquery.min.js"></script>

<style>
	.fc-sun {
		color:red;
	}

	.fc-sat {
		color:blue;
	}
	
</style>

</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">
	

		<jsp:include page="../common/nav.jsp" />
		<jsp:include page="../common/sidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header bg-navy" style="font-size: 15px;">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6" >
							<h1>일정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">

							<!-- 일자 클릭 시 카테고리 오픈 -->
							<div id="contextMenu" class="dropdown clearfix">
					            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
					                style="display:block;position:static;margin-bottom:5px;">
					                <li><a tabindex="-1" href="#">업무</a></li>
					                <li><a tabindex="-1" href="#">회의</a></li>
					                <li><a tabindex="-1" href="#">외근</a></li>
					                <li><a tabindex="-1" href="#">출장</a></li>
					                <li><a tabindex="-1" href="#">휴가</a></li>
					                <li><a tabindex="-1" href="#">협업일정</a></li>
					                <li><a tabindex="-1" href="#">기타</a></li>
					                <li class="divider"></li>
					                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
					            </ul>
					        </div>
							<!-- 카테고리 관련 div 끝 -->
							
							
							<!-- 캘린더 오픈 -->
							<div class="card-body p-0">
								<!-- THE CALENDAR -->
								<!-- <div id="loading"></div> -->
								<div id="calendar"></div>
							</div>
							<!-- /.card-body -->
							
							<!-- 일정 추가 모달 나와라 -->
							<div class="modal fade " id="eventModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                      		<div class="modal-dialog" role="document">
	                        		<div class="modal-content" id="modal-1212">
	                              		<div class="card">
	                                		<div class="card-header bg-navy">
	                                  			<h2 class="card-title" style="font-size: 23px;"><i class="far fa-calendar-check">&nbsp; </i>일정관리</h2>
	                                		</div>
	                              
	                                   		<div class="modal-body p-1" style="font-size: 18px;">
	                                   			<div class="row">
	                                   				<div class="input-group-prepend mt-1 mb-3 pl-2 col-md-12 justify-content-center">
		                                   				<h4 class="modal-title" style="color:navy;"></h4>
								                    </div>
	                                   			</div>
								                <hr style="margin-top:0;">
	                                   			
	                                   			<div class="row">
						                            <div class="input-group-prepend mt-1 mb-3 pl-2 col-md-12">
						                           		<div class="input-group-prepend col-md-3">
						                                	<label class="input-group-text justify-content-center" for="edit-allDay" style="width:90px; font-size: 18px;">하루종일</label>
						                                </div>
						                                <input class="allDayNewEvent" id="edit-allDay" type="checkbox" style="margin-top: 12px; width:18px; height:18px;">
						                            </div>
						                        </div>
						                        
	                                   			<div class="row">
	                                          		<div class="input-group mt-1 mb-3 pl-2 col-md-12">
	                                            		<div class="input-group-prepend col-md-3" style="text-align: center;">
	                                              			<label class="input-group-text justify-content-center" for="edit-title" style="width:90px; font-size: 18px;">일정명</label>
	                                            		</div>
	                                            		<input class="inputModal" type="text" name="edit-title" id="edit-title" required="required">
	                                          		</div>
	                                        	</div>
	                                        	
	                                         	<div class="row">
	                                          		<div class="input-group mb-3 pl-2 col-md-12">
	                                             		<div class="input-group-prepend col-md-3">
	                                               			<label class="input-group-text justify-content-center" for="edit-start" style="width:90px; font-size: 18px;">시작일</label>
	                                             		</div>
	                                             		
			                                            <input class="inputModal" type="text" name="edit-start" id="edit-start" /> 
			                                       </div>
			                                    </div>
			                                    <div class="row">
	                                          		<div class="input-group mb-3 pl-2 col-md-12">
	                                             		<div class="input-group-prepend col-md-3">
	                                               			<label class="input-group-text justify-content-center" for="edit-end" style="width:90px; font-size: 18px;">종료일</label>
	                                             		</div>
	                                             		
			                                            <input class="inputModal" type="text" name="edit-end" id="edit-end" /> 
			                                       </div>
			                                    </div>    
			                                         
		                                         <div class="row">
		                                         	<div class="input-group mb-3 pl-2 col-md-12">
	                                           			<div class="input-group-prepend col-md-3">
	                                             			<label class="input-group-text justify-content-center" for="edit-repeat" style="width:90px; font-size: 18px;">반복 </label>
	                                           			</div>
			                                              <select name="" class="inputModal" id="edit-repeat" style="height:30px;">
			                                                <option value="반복없음">반복없음</option>
			                                                <option value="매주">매주</option>
			                                                <option value="매월">매월</option>
			                                                <option value="매년">매년</option>
			                                              </select>
		                                            </div>
	                                       		 </div>
	                                       		 
	                                       		 <div class="row">
	                                        		<div class="input-group mb-3 pl-2 col-md-12">
	                                        			<div class="input-group-prepend col-md-3">
	                                        				<label class="input-group-text justify-content-center" for="edit-type" style="width:90px; font-size: 18px;">구분 </label>
	                                             		</div>
	                                             		<select name="" class="inputModal" id="edit-type" style="height:30px;">
			                                                <option value="업무">업무</option>
			                                                <option value="회의">회의</option>
			                                                <option value="외근">외근</option>
			                                                <option value="출장">출장</option>
			                                                <option value="휴가">휴가</option>
			                                                <option value="협업일정">협업일정</option>
			                                                <option value="기타">기타</option>
			                                             </select>
		                                            </div>
	                                         	</div>
	                                       		 
	                                       		 <div class="row">
						                            <div class="input-group mb-3 pl-2 col-md-12">
						                           		<div class="input-group-prepend col-md-3 text-center">
						                                	<label class="input-group-text justify-content-center" for="edit-color" style="width:90px; font-size: 18px;">색상</label>
						                                </div>
						                                <select class="inputModal" name="color" id="edit-color" style="height:30px;">
						                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
						                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
						                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
						                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
						                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
						                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
						                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
						                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
						                                    <option value="#495057" style="color:#495057;">검정색</option>
						                                </select>
						                            </div>
						                        </div>
	
		                                         <div class="row">
		                                          <div class="input-group mb-3 pl-2 col-md-12">
		                                            <div class="input-group-prepend col-md-3">
		                                              <label class="input-group-text justify-content-center" for="edit-desc" style="width:90px; font-size: 18px;">내용</label>
		                                            </div>
		                                            <textarea cols="170" rows="6" class="inputModal" name="edit-desc" id="edit-desc"></textarea>
		                                          </div>
		                                        </div>  
			                              	</div> <!-- modal-body-->
	                                     </div>
	                                     
	                                     <div class="modal-footer modalBtnContainer-addEvent">
	                                     	<button class="btn btn-outline-success " type="submit" id="save-event" style="font-size: 18px;">저장</button>
	                                      	<button type="button" class="btn btn-outline-secondary" data-dismiss="modal" style="font-size: 18px;">취소</button>
	                                    </div>
	                                    <div class="modal-footer modalBtnContainer-modifyEvent">
					                        <button type="button" class="btn btn-default" data-dismiss="modal" style="font-size: 18px;">닫기</button>
					                        <button type="button" class="btn btn-danger" id="deleteEvent" style="font-size: 18px;">삭제</button>
					                        <button type="button" class="btn btn-primary" id="updateEvent" style="font-size: 18px;">저장</button>
					                    </div>
	                              </div>
	                        	</div>
	                      	</div>
	                      	<!-- 일정추가 모달 종료 -->
		                      	
						</div>
						<!-- /.col -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer text-center">
			<strong>Copyright &copy; 2020 <a href="#">OJUNG-BANHAP</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

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
<%-- 	<script src="<%=request.getContextPath() %>/resources/plugins/fullcalendar-timegrid/main.min.js"></script>  --%>
	<script src="<%=request.getContextPath() %>/resources/js/main.js"></script> 
	<script src="<%=request.getContextPath() %>/resources/js/addEvent.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/editEvent.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/etcSetting.js"></script>
	
</body>
</html>