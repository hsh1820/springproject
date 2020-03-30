<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 전자결재 </title>

	<!-- jQuery -->
	<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
 <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body>


<body class="hold-transition sidebar-mini" id="dropZone">
<div class="wrapper">

<jsp:include page="../common/nav.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<div class="content-wrapper p-3">
      <!-- Content Header (Page header) -->
      <section class="content-header">

      <!-- Content Header (Page header) -->
  
        <div class="card">
          <div class="card-header bg-navy">

            <h3 class="card-title">협업게시판</h3>
              
        </div>
       
  
      <!-- Content Wrapper. Contains page content -->

      <!-- Main content -->
      <form action="update?no=${cBoard.collaboNo}"  name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="POST">
        <section class="content">
          <div class="row">
             <div class="col-md-12">
                     <div class="card card-outline card-primary">
                        <div class="card-header">
                           <div class="form-group row" style="margin-bottom: 0;">
                              <label for="inputTitle3" class="col-md-1 col-form-label"
                                 style="text-align: center;" style="margin-bottom: 0;">제목</label>
                              <div class="col-md-11">
                                 <input type="text" class="form-control" id="inputTitle3" name="collaboTitle" value=${cBoard.collaboTitle }>
                                 <br>
                              </div>
                              
                              <label for="inputTitle3" class="col-md-1 col-form-label"
                                 style="text-align: center;" style="margin-bottom: 0;">첨부파일</label>
                              <div class="col-md-11">
                                 <div class="input-group">
                                    <div class="custom-file">
                                       <label  class="custom-file-label" for="exampleInputFile">
                                    <c:forEach var="files" items="${files}" varStatus="vs">
                                    ${files.fileOriginNm}
                                    </c:forEach>
                                    </label> 
                                       <input multiple="multiple" type="file" class="custom-file-input" id="exampleInputFile" name="fileUpload" >
                                    </div>
                                 </div>
                              </div>
                              </div></div>
                <div class="card-body pad" >
                   <table style="width:100%;">
                      <tr>
                        <!-- 협업 대상 체크박스 -->
                        <!-- 로그인 멤버의 부서번호 세팅 -->
                        <c:set var="loginDeptCode" value="${loginMember.deptCode}"/>
                        <th style="text-align : center;">대상</th>
                        <td >
                        <c:forEach var="dList" items="${deptList }" varStatus="vs"> 
                        <c:if test="${loginMember.deptCode != dList.deptCode}">
                          <div class="icheck-primary d-inline mr-5" style="width:100%">
                            <input type="checkbox" name="collaboDept" id="checkDept${vs.index+1}" value="${dList.deptCode }">
                            <label for="checkDept${vs.index+1}">${dList.deptName }</label>
                          </div>
                          </c:if>
                        </c:forEach>
                        <script>
                        <c:forEach var="ct" items="${selectDepts}" varStatus="vs">
							$.each($("input[name=collaboDept]"), function(index, item){
								if($(item).val() == "${ct}"){
									$(item).prop("checked","true");
								} 
							});
							
						</c:forEach>
						</script>
                        </td>
                      </tr>

                      <!-- 작성자, 작성자 이름은 로그인 한 사람 이름 session에서 받아와서 자동으로 들어가게 하면 좋을거같아요 -->
                      <tr>
                        <th style="text-align : center;">작성자</th>
                        <td >${loginMember.memberName}</td>
                      </tr>

                      <!-- 업무기한 -->
                      <tr>
                        <th style="text-align : center;">업무기한</th>
                        <td style="padding-left:.5%;">
                          <div class="form-group row">
		                     	<div class="align-items-center justify-content-between" style="text-align: center;">
			                      <input type="date" id="from" name="collaboStartDate" class="" style="width: 250px;"> 
			                    </div>&nbsp;&nbsp;-&nbsp;&nbsp;
			                    <div class="">
			                      <input type="date" id="to" name="collaboEndDate" class="mr-5" style=" width: 250px;"> 
			                    </div>
			                    <span id="betweenDt"> 일간</span>
		                  </div>
                          <script>
                          	document.getElementById("from").valueAsDate = new Date('${cBoard.collaboStartDate}');
                          	document.getElementById("to").valueAsDate = new Date('${cBoard.collaboEndDate}');
                          </script>
                        </td>
                      </tr>
                      <!-- 내용 작성 -->
                      <tr>
                        <th style="text-align : center;">내용</th>
                        <td colspan="5" >
                          <textarea name="collaboContent" class="textarea" placeholder="Place some text here"
                            style="width: 100%; height: 300px; font-size: 14px; 
                            line-height: 18px; border: 1px solid #dddddd; padding: 10px; resize: none;">${cBoard.collaboContent }
                            </textarea>
                        </td>
                      </tr>
                  </table>
                  <a class="btn btn-primary float-right"
						href="${header.referer}" >목록으로
                	</a>
                  <button type="submit" id="subBtn" class=" mt-5 btn btn-block btn-outline-secondary"
                    style="float: right; margin-right: 2%; width: 100px; height: 40px;">수정 등록</button>
                    <input type="hidden" id="attachCheck" value=""/>
                </div>
              </div>
            </div>
            <!-- /.col-->
          </div>
          <!-- ./row -->
        </section>
      </form>
      </section>
       </div>


    </div>
      <!-- /.content -->
    <!-- /.content-wrapper -->
    
	<jsp:include page="../common/footer.jsp"/>
    
  </div>
  <!-- ./wrapper -->
<!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
  <!-- jQuery -->
  <script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="<%=request.getContextPath() %>/resources/dist/js/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
  <!-- Summernote -->
  <script src="<%=request.getContextPath() %>/resources/plugins/summernote/summernote-bs4.min.js"></script>
  <!-- Select2 -->
  <script src="<%=request.getContextPath() %>/resources/plugins/select2/js/select2.full.min.js"></script>
  <!-- Bootstrap4 Duallistbox -->
  <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
  <!-- InputMask -->
  <script src="<%=request.getContextPath() %>/resources/plugins/moment/moment.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
  <!-- date-range-picker -->

  <!-- bootstrap color picker -->
  <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  <script src="<%=request.getContextPath() %>/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
  <!-- Bootstrap Switch -->
  <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>

  <script>
    // $(function () {
    //   // Summernote
    //   $('.textarea').summernote({
    //     height: 500
    //   })
    // });

    $(function () {
      //Initialize Select2 Elements
      $('.select2').select2()

      //Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4'
      })

      //Datemask dd/mm/yyyy
      $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
      //Datemask2 mm/dd/yyyy
      $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
      //Money Euro
      $('[data-mask]').inputmask()

      //Date range picker
      $('#reservation').daterangepicker()

      //Bootstrap Duallistbox
      $('.duallistbox').bootstrapDualListbox()

      //Colorpicker
      $('.my-colorpicker1').colorpicker()
      //color picker with addon
      $('.my-colorpicker2').colorpicker()

      $('.my-colorpicker2').on('colorpickerChange', function (event) {
        $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
      });

      $("input[data-bootstrap-switch]").each(function () {
        $(this).bootstrapSwitch('state', $(this).prop('checked'));
      });

    })
  </script>

  <!-- bs-custom-file-input -->
  <script src="<%=request.getContextPath() %>/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="<%=request.getContextPath() %>/resources/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="<%=request.getContextPath() %>/resources/plugins/chart.js/Chart.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/pages/dashboard3.js"></script>
<script src="<%=request.getContextPath() %>/resources/plugins/daterangepicker/daterangepicker.js"></script>

  <script type="text/javascript">
    $(document).ready(function () {
      bsCustomFileInput.init();
 	  selectCflist();
    });
    function selectCflist(){
    	var boardNo = "${cBoard.collaboNo}";
    	$.ajax ({
    		url: "selectCflist",
    		type : "GET",
    		data : {"collaboNo": boardNo},
    		dataType : "json",
    		success : function(cfList){
    			var $fArea = $("#cflistArea"); // ul
    			
    			if(cfList == ""){
    				console.log("testnull");
					$fArea.html("<li><br><small style='color:grey;'>등록된 첨부파일이 없습니다.</small><li>");
    			}else{
    				console.log("test");
    				$fArea.html("");
    				$.each(cfList, function(i){
    					var $li = $("<li>");
    					var $small = $("<small>").css("color", "grey").text(cfList[i].fileOriginNm);
    					$li.append($small);
    					$fArea.append($li);
    					
    				});
    			}
				
    		}
    	});
    }
    function removeFile(e){
    	alert(e.target);
    	var fileName = "";
      };
      
    $("#subBtn").on("click", function(e){
    	/* 제목 입력 유효성 */
    	if($("#inputTitle").val() == ''){
    		alert('제목을 입력해주세요.');
    		$("#inputTitle").focus();
    		var checkColla = document.getElementsByName('depts');
    		return ;
    	}
    	
    	/* 대상 부서 선택 유효성 */
    	/* if(){
    		alert('협업 대상 부서를 1개 이상 선택해주세요.');
    		return false;
    	}   */
    	
    	/* 업무기한 시작일 유효성 */
    	if($('input#from').val() == ''){
    		alert('시작일을 선택해주세요.');
    		$('input#from').focus();
    		return ;
    		
    	}else if($('input#to').val() == ''){
    		alert('종료일을 선택해주세요.');
    		$('input#to').focus();
    		return ;
    	} else if($('input#from').val() != '' && $('input#to').val() != '' ){
			var toArr = $('input#to').val().split('-');
	   		var fromArr =  $('input#from').val().split('-');  	
	   		var toDt = new Date(toArr[0], Number(toArr[1])-1, toArr[2]);
	   		var fromDt = new Date(fromArr[0], Number(fromArr[1])-1, fromArr[2]);
	   		var betweenDt = // (toDt.getTime() - fromDt.getTime())/1000/60/60/24; 
	   		Math.ceil((toDt.getTime()-fromDt.getTime())/(1000*3600*24));

	   	/* 	for(var i=0;i<toArr.length;i++){
	   			if(fromArr[i]>toArr[i]){
	   				alert("종료일은 시작일 보다 작을 수 없습니다.");
		    		$('input#to').focus();
	   				return false;
	   				}
	   			} */
	   		
	   		console.log(betweenDt);
    		$("#betweenDt").text(betweenDt+" 일간");
	   		
   		}
            
    });
  </script>
</body>
</html>
