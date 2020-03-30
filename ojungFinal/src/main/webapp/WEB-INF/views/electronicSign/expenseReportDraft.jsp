<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | General Form Elements</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath }/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

<!-- jQuery -->
<script src="${contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script
	src="${contextPath }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- bs-custom-file-input -->
<script
	src="${contextPath }/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath }/resources/dist/js/adminlte.min.js"></script>

<link href="${contextPath }/resources/plugins/toastr/toastr.min.css">
<script
	src="${contextPath }/resources/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="${contextPath }/resources/plugins/toastr/toastr.min.js"></script>
<style>
.btn-outline-secondary:hover {
	color: #fff !important;
	background-color: #6c757d;
	border-color: #6c757d;
	cursor: pointer;
}

.btn-outline-secondary {
	color: #fff !important;
	background-color: #b0bac2;
	border-color: #6c757d;
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
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<form class="form-horizontal" onsubmit="return isValidSubmit();"
				method="post" action="insertExpenseReport"
				enctype="multipart/form-data" role="form">
				<section class="content">
					<div class="container-fluid">
						<div class="row">
							<!-- left column -->
							<div class="col-md-10">
								<!-- Horizontal Form -->
								<div class="card">
									<div class="card-header bg-navy">
										<h3 class="card-title">지출 결의서 작성</h3>
									</div>
								
								<div style="width: 100%;">

									<!-- /.card-header -->
									<!-- form start -->
									<div class="card-body">
										<div class="form-group row">
										
											<div class="input-group ml-2 mr-2">
												<div class="input-group-prepend">
													<span class="input-group-text">제목</span>
												</div>
													<input type="text" class=" form-control" id="inputPassword3"
														placeholder="제목을 입력해주세요." name="docTitle">
											</div>
										</div>
									

										<div class="form-group row">
											<div class="input-group ml-2 mr-2">
											<div  class="input-group-prepend">
												<span  class="input-group-text" >첨부파일</span>
											</div>
												
											<div class=" input-group-prepend" style="width:1155px;">
												<div class="custom-file input-group-prepend">
													<label class="custom-file-label" for="exampleInputFile">
													</label> <input type="file" class="custom-file-input"
														multiple="multiple" id="exampleInputFile" name="docFile">
												</div>
											</div>
										</div>
										</div>


										<div class="form-group row">
											<div class="input-group col-md-4">
											<div class="input-group-prepend">
												<span class="input-group-text">결재라인</span>
											</div>
											<div class="text-right col-md-7">
												<!-- 결재라인 모달 시작-->
												<a id="modal-12110922" role="button"
													class="btn btn-block btn-outline-secondary"
													data-target="#modal-container-12110922" data-toggle="modal">결재라인</a>
										

												<div class="modal fade " id="modal-container-12110922">
													<div class="modal-dialog modal-lg"
														style="width: 1000px; margin-left: 250px; margin-top: 100px; display: table;"
														role="document">
														<div class="modal-content">
															<!--              id="modal-12110922" -->

															<div class="card">
																<div class="card-header bg-navy">
																	<h3 class="card-title">결재라인</h3>
																</div>
																<div class="card-body">
																	<div class="row">
																		<div class="col-md-3 ml-3" style="text-align: left;">
																			<table class="table" id="selectDepartment"
																				style="width: 100%; border: 1px solid rgba(176, 196, 222, 0.726)">
																				<thead
																					style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
																					<th>부서 선택</th>
																				</thead>
																				<tbody>
																					<tr>
																						<td><input type="radio" id="D1" value="D1"
																							name="group1" class="selectDepartment1">
																							<label for="D1">개발부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D2" value="D2"
																							name="group1" class="selectDepartment1">
																							<label for="D2">경영지원부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D3" value="D3"
																							name="group1" class="selectDepartment1">
																							<label for="D3">회계부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D4" value="D4"
																							name="group1" class="selectDepartment1">
																							<label for="D4">인사부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D5" value="D5"
																							name="group1" class="selectDepartment1">
																							<label for="D5">마케팅부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D6" value="D6"
																							name="group1" class="selectDepartment1">
																							<label for="D6">영업부서</label></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>

																		<div class="col-md-3" style="text-align: left;">
																			<table class="table" id="selectRecieverName"
																				style="height: 100px; overflow-x: scroll; overflow-y: hidden; border: 1px solid rgba(176, 196, 222, 0.726)">
																				<thead
																					style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
																					<th>결재자 & 결재구분 선택</th>
																				</thead>
																				<tbody id="deptListOut"
																					style="height: 100px; overflow-x: scroll; overflow-y: hidden;">

																				</tbody>
																			</table>
																		</div>

																		<div class="col-md-1">
																			<br> <br> <br> <br> <br> <br>
																			<br> <i
																				class="fas fa-angle-double-right fa-2x mr-3"></i>
																		</div>

																		<div class="col-md-4 ml-2" style="text-align: left;">
																			<table class="table" id="checkSignName"
																				style="height: 100px; overflow-x: scroll; overflow-y: hidden; border: 1px solid rgba(176, 196, 222, 0.726)">
																				<thead
																					style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
																					<th>결재목록 확인</th>
																				</thead>
																				<tbody
																					style="height: 100px; overflow-x: scroll; overflow-y: hidden;">
																					<tr>
																				</tbody>
																			</table>
																		</div>

																	</div>
																	<!-- row종료 -->
																</div>
																<!-- 모달 카드바디 종료 -->
														</div>
											<!-- 결재 라인 버튼 넣기 -->


		

															<div class="modal-footer" style="padding-right: 50px;">
																<input type="button" class="btn btn-outline-primary"
																	id="selectBtn" value="선택">
																<button type="button" class="btn btn-outline-secondary"
																	data-dismiss="modal" aria-label="Close">취소</button>
																<button id="makeLine" type="button" data-dismiss="modal"
																	class="btn btn-outline-danger">결재라인 등록</button>
															</div>
													</div>
														</div>
													</div>
												</div>
												<!-- 모달 끝 -->
											</div>
									
										<div class="input-group col-md-8">
											<div class="input-group-prepend">
												<span class="input-group-text">합계 금액</span>
											</div>
											
												<input type="text" id="total" value="0" name="total"
													class="form-control  float-left" size="20"
													style="width: 80%; margin: 0; text-align: right;" readonly>
												&nbsp;&nbsp; <sub style="bottom: 0; left: 0; top: 15px;">원(￦)</sub>
											</div>

											<input type="text" id="save" hidden>

											<script>
					                          function numberWithCommas(x) {
					                            x.value = x.value.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
					                            x.value = x.value.replace(/,/g,'');          // ,값 공백처리
					                            $(x).val(x.value.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
					                          }
					                        </script>
										</div>
										
</div>
										<!--    <label for="inputPassword3" class="col-md-2 col-form-label"
                                 style="text-align: center;">결재구분</label> 품의서
 -->

										<script>
                                 // 수신인  경로;
                                 

                                 $('input[name=group1]')
                                       .click(
                                             function() {
                                                var radioValue = $(
                                                      this)
                                                      .val();

                                                $
                                                      .ajax({
                                                         url : "msgSelectDepartment",
                                                         type : "post",
                                                         data : {
                                                            radioValue : radioValue
                                                         },
                                                         dataType : "json",
                                                         success : function(
                                                               mList) {

                                                            $(
                                                                  "#deptListOut")
                                                                  .html(
                                                                        "");

                                                            var td = "";
                                                            for ( var i in mList) {
                                                               td += "<tr><td>"
                                                                     + "&nbsp"
                                                                     + "<input type='radio' name='group2'  value='"+mList[i].memberNo + "'>"
                                                                     + "<input type='hidden' id='memberName' name='memberName' value='" + mList[i].memberName  + "'>"
                                                                     + "<input type='hidden' value='" + mList[i].jobName  + "'>"
                                                                     + "<lable for = 'selectReciever'>"
                                                                     + mList[i].memberName
                                                                     + "   /   "
                                                                     + mList[i].jobName
                                                                     + "</label>"
                                                                     + "&nbsp;&nbsp;"
                                                                     + "<select class='targetSelect'" + i + " style='width:70px;'>"
                                                                     + "<option value='1'>"
                                                                     + '합의'
                                                                     + "</option>"
                                                                     + "<option value='2'>"
                                                                     + '결재'
                                                                     + "</option>"
                                                                     + "</select>"
                                                                     + "</td></tr>";
                                                            }

                                                            $(
                                                                  "#deptListOut")
                                                                  .html(
                                                                        td);
                                                         }
                                                      });
                                             });
                              </script>

										<script>
                              var printNm = 0;
                              var count = 0;
                              var arr = [];
                              
                                 $("#selectBtn").click(function() {

                                                // 결재자 회원번호
                                                var memberNoVal = $('input[name="group2"]:checked').val();
                                                console.log("memberNoVal : "+ memberNoVal);

                                                // 결재자 이름
                                                var nameVal = $('input[name="group2"]:checked').next().val();
                                                console.log("nameVal : "+ nameVal);
                                                
                                                // 결재자 직급
                                                var jobVal = $('input[name="group2"]:checked').next().next().val();
                                                console.log("jobVal : "+jobVal);
   
                                                
                                                // 결재 구분  1: 합의   2:결재
                                                var checkSign = $(
                                                      'input[name="group2"]:checked')
                                                      .next()
                                                      .next().next()
                                                      .children()
                                                      .children(
                                                            "option:selected")
                                                      .val();
                                                console
                                                      .log("checkSign : "
                                                            + checkSign);

                                                // 결재 구분 이름 (사용자 확인용)
                                                var checkSignName = $('input[name="group2"]:checked').next().next().next().children().children("option:selected").text();
                                                console
                                                      .log("checkSignName : "
                                                            + checkSignName);
                                                var index = $(
                                                      "#checkSignName option")
                                                      .index(
                                                            $("#checkSignName option:selected"));
                                                console
                                                      .log("index : "
                                                            + index);

                                                var td = "";

                                                var $tr = $("<tr>");
                                                //$('input[name="group2"]:checked').next().next().children().children("option:selected").val();

                                                $tr
                                                      .append("<td>"
                                                            + "<span name='group2'>"
                                                            + nameVal
                                                            + "/"
                                                            + jobVal
                                                            + "["
                                                            + checkSignName
                                                            + "]"
                                                            + "<input type='hidden' name='memberNo' value='" + memberNoVal + ">"
                                                            + "<input type='hidden' name='checkSign' value='" + checkSign + "'>"
                                                            + "</span>"
                                                            + "<i id='test' onclick='removeLine();' class='far fa-minus-square' style='color:red; padding-left:150px;'>삭제</i>"
                                                            + "</td>");
                                                $("#checkSignName tbody").append($tr);
                                                var isEmpty = function(value){ 
                                                   if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
                                                      return true 
                                                   }else{ 
                                                      return false }
                                                };

                                                if(isEmpty(arr)){
                                                    arr.push(memberNoVal +":"+ nameVal +":"+ count +":"+jobVal +":" + checkSign);}
                                                    else{arr.push("||"+memberNoVal +":"+ nameVal +":"+ count +":"+jobVal +":" + checkSign);
                                                    }
                                                
                                                printNm = count;
                                                count +=1;
                     
                                             });

                                 function selectNo() {
                                    return memberNoVal;
                                 };
                                 
                                 function removeLine(){
                                    
                                    console.log(printNm);
                                 };
                                 $("#makeLine").on("click",function(){
                                    console.log(arr);
                                    for(var i in arr){
                                    	
                                    var afterStr = arr[i].split(":");
                                    console.log(afterStr[1]);
                                    var $li = $("<li>").prop
                                    ("class","list-group-item d-flex justify-content-between align-items-center")
                                    .text(afterStr[1]);
                                    var $arrow =$("<i>").prop
                                    ("class", "fas fa-angle-down fa-2x mt-2 mb-2 ml-5");
                                    
                                    $("#lines").append($arrow);
                                    $("#lines").append($li);
                                    }
                                    $("#docSignPath").val(arr);
                                 });
                                 
                              </script>

										<hr class="ml-5">


										<!-- 요소추가 적요 5, 금액3, 비고3, 삭제 1-->
										<div class="form-group row ml-5 mr-5" style="text-align: center; background-color:lightgrey;" >
											<div class="col-sm-5 col-form-label" >
												<b>적요</b>
											</div>
											<div class="col-sm-3 col-form-label">
												<b>금액</b>
											</div>
											<div class="col-sm-3 col-form-label">
												<b>비고</b>
											</div>
											<a
												class="btn btn-s align-content-sm-center fas fa-minus-square mr-2"
												style="width: 100px; display: none;" id="delBtn"></a>
										</div>
									</div>
									
									<input type="hidden" id="docRemark" name="docRemark">
									
									<div id="hiddenRow"></div>

									<div class="form-group row ml-5" style="text-align: center;">
										<div class="col-sm-12">
											<a
												class="btn btn-outline-secondary btn-sm align-content-sm-center"
												style="width: 100px;" id="addBtn"> <i
												class="fas fa-plus mr-2" style="text-align: center;">&nbsp;항목추가</i>
											</a>
										</div>
									</div>

									<hr class="ml-5">
									<br>
									<!-- 
									<div class="form-group row">
										<label class="col-sm-2 col-form-label"
											style="text-align: center;">비&nbsp;&nbsp;&nbsp;고</label>
										<div class="col-sm-10">
											<textarea class="form-control "
												style="height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px; resize: none;"></textarea>
										</div>
									</div> -->

									<table style="width: 100%;">
										<tr>
											<td colspan="3">&nbsp;&nbsp;</td>
											<td><textarea class="textarea" name="docContents"
													placeholder="Place some text here"
													style="width: 99%; height: 500px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px; resize: none;"></textarea>
											</td>
										</tr>
									</table>


									<br>

									<div class="card-footer mb-1">
										<button type=submit class="btn btn-outline-primary" onclick="test()"
											style="float: right;  width: 150px; height: 40px;">
											결재 등록</button>
									</div>

									<script>
										function test(){
										var	briefs  = document.getElementsByName("briefs");  
										var	amounts = document.getElementsByName("amounts");  
										var	remarks = document.getElementsByName("remarks");  
										/* console.log(briefs);
										console.log(amounts);
										console.log(remarks); */
										
										var remarks2 = new Array();
										
										for( var i=0; i<briefs.length ; i++) {
											remarks2.push(briefs[i].value);
											remarks2.push(":");
											remarks2.push(amounts[i].value);
											remarks2.push(":");
											remarks2.push(remarks[i].value);
											remarks2.push("||");
										}
											console.log(remarks2);
											$("#docRemark").val(remarks2);
											
										}
									 </script>

								</div>
								<!-- /.card-body -->
							</div>
							<div class="col-md-2 pl-2 pr-3">
								<div class="card row">
									<div class="card-header bg-navy">
										<h3 class="card-title">
											<i class="fas fa fa-book-reader"></i>&nbsp; 결재선
										</h3>
									</div>
									<!-- /.card-header -->
									<!-- form start -->
									<div class="card-body">
										<!--               
              					<span class="badge badge-info badge-pill">기안</span> 
                                 <span class="badge badge-warning badge-pill">열람</span> 
                                 <span class="badge badge-primary badge-pill">미열람</span>
                                 <span class="badge badge-success badge-pill">승인</span>
                                 <span class="badge badge-danger badge-pill">반려</span>
                                 -->
										<ul class="list-group" id="lines">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												${loginMember.memberName } <!--  <span class="badge badge-info badge-pill">기안</span> -->
											</li>

											<!--    <li class="list-group-item d-flex justify-content-between align-items-center">
                                       결재선 1번 
                                    </li>

                                    <i class="fas fa-angle-down fa-2x mb-2 ml-5"></i>

                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                       결재선 2번
                                       홍부장 
                                       <span class="badge badge-primary badge-pill">
                                          미열람
                                    </span>
                                    </li>

                                    <i class="fas fa-angle-down fa-2x mb-2 ml-5"></i>

                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                       결재선 3번
                                        <span class="badge badge-primary badge-pill">
                                          미열람
                                    </span>
                                    </li> -->
										</ul>


									</div>
									<!-- cardBody-->
								</div>
								<!--card row 종료 -->
								<!-- row 종료 -->
								<input type="hidden" style="display: none" name="docSignPath"
											id="docSignPath">
											

							</div>
							<!--결재라인 row 끝-->
						</div>
					</div>

					<!--col-md 2 종료 -->
				</section>
			</form>
		</div>
		<!--content-wrapper"  -->
	<jsp:include page="../common/footer.jsp" />
	</div>
	
	<!-- wrapper  -->

	<!-- 기안서 작성 화면 끝-->



	<script>
      const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000 });

      var briefs = document.getElementsByName("briefs");

    $(function () {

      //Enable check and uncheck all functionality
      $('.checkbox-toggle').click(function () {
        var clicks = $(this).data('clicks')
        if (clicks) {
          //Uncheck all checkboxes
          $('.noticeList input[type=\'checkbox\']').prop('checked', false)
          $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
        } else {
          //Check all checkboxes
          $('.noticeList input[type=\'checkbox\']').prop('checked', true)
          $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
        }
        $(this).data('clicks', !clicks)
      });

      var count=1;
      
      function addDivRow(){
      
      var strBrief = "<div class='col-sm-5 col-form-label'><input type='text' class='form-control'  name='briefs' maxlength='20'></div>";
      var strAmount = "<div class='col-sm-3 col-form-label'><input type='text' class='form-control amount' name='amounts' style='width: 80%; margin: 0;float: left;' maxlength='15' onkeyup='numberWithCommas(this)'><sub>원(￦)</sub></input></div>";
      var strRemark = "<div class='col-sm-3 col-form-label'><input type='text' class='form-control' maxlength='20' name='remarks'></div>";
      var strDelBtn = "<a id='delBtn' style='display:none;'></a>";
      var hiddenRow = document.getElementById('hiddenRow');

      var addedDiv = document.createElement("div");
      addedDiv.id ="divRows";
      addedDiv.className="form-group row ml-5";
      addedDiv.style="text-align: center;";
      addedDiv.innerHTML= strBrief+strAmount+strRemark+strDelBtn;
      hiddenRow.appendChild(addedDiv);
      
      count++;
    };

    $(addBtn).on("click", function (){
      addDivRow();
    });
    
    $(document).keydown(function(e){
      if(e.ctrlKey && e.which == 13){
        addDivRow();
      }
    });
    
    
    
  });
    $("#hiddenRow").on("mouseover","#divRows",function(){
      $(this).find("#delBtn").addClass('btn btn-s  fas fa-minus-square').fadeIn(200);
    });
    $("#hiddenRow").on("click","#delBtn",function(){
      // hidden value에 keyup할때마다 value 갱ㅅ인하는 메소드 만들고 
      // remove하면 hidden에 있는 값이랑 total값 빼서 total값 갱신하고, 
      // remove() 하기
      $(this).parent().remove();
    })
      

    $("#hiddenRow").on("mouseleave","#divRows",function(){
      $(this).find("#delBtn").fadeOut(200); 
    }); 
     
  function isValidSubmit(){
        if(briefs.length >0){
          console.log("1");
          return 1;
        }else{
          
          console.log("0");
          return 0;
        }
      };

 
      
    var save = document.getElementById("save");
    
    // 현재(currentAmtArr)amount에 있는 값들을 배열로 받아와서
    // 똑같이 복사(copyAmtArr)해서
    // 포커스 아웃 될때 마다 배열 안의 값을 서로 값 비교
    // 같으면 현재 배열 안에있는 값 전부 더하고
    // 다르면 복사한 배열의 값을 현재로 갱신
    // 복사한 배열안의 값들을 합산
    var preInput = 0;
    var currentIn = 0;
    var result = 0;
    currentAmtArr = document.getElementsByName("amounts");
    compAmtArr = currentAmtArr;

    $("#hiddenRow").on("focusout",".amount",function(){
    var total = parseInt($("#total").val().replace(/,/g,""));
    var input = parseInt($(this).val().replace(/,/g,""));
      console.log(compAmtArr[0].value);
      console.log(currentAmtArr[0].value);
    
    
    $.each(currentAmtArr,function(index,item){
      result += parseInt(item.value);
      
      //  result += item;
    });
    console.log(result);
    //preInput = input;
    
    // if(preInput != currentIn ){
    //   currentIn = preInput;
    // }
    // save.value = currentIn;
    // result = total + (save.value*1);

    //total = (total+"").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    //$("#total").val(result);
    });


</script>
	<!— AdminLTE for demo purposes —>
	<script src="${contextPath }/resources/dist/js/demo.js"></script>
	<script type="text/javascript">
    $(document).ready(function () {
      bsCustomFileInput.init();
    });
  </script>

</body>

</html>