<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 쪽지함</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery -->
<script
   src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
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

<style>
   td > a{
      color:black;
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
               <div class="card ">
                  <div class="card-header bg-navy">

                     <h3 class="card-title">쪽지함</h3>

                     <div class="card-tools">
                     <form method="post" action="searchMsg">
                        <div class="input-group input-group-sm" style="width: 300px;">
                           <input type="text" name="searchValue"
                              class="form-control float-right" placeholder="발송자 입력">
                           <div class="input-group-prepend">
                              <button type="submit" class="btn btn-default">
                  
                                 <i class="fas fa-search">&nbsp;검색</i>
                              </button>
                           </div>
                        </div>
                     </form>
                     </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body p-0"
                     style="width: 100%; height: 650px; overflow: scroll">

                     <table class="table table-hover text-center">
                        <thead>
                           <tr>
                              <th class="fixedHeader">쪽지번호</th>
                              <th class="fixedHeader">제목</th>
                              <th class="fixedHeader">발송인</th>
                              <th class="fixedHeader">받은 날짜</th>
                              <th class="fixedHeader">답장여부</th>
                           </tr>
                        </thead>
                        <tbody class="text-center" style="height: 600px;">

                           <c:if test="${empty list }">
                              <tr>
                                 <td colspan="5">존재하는 쪽지가 없습니다.</td>
                              </tr>
                           </c:if>

                           <c:if test="${!empty list }">
                              <c:forEach var="personalMsg" items="${list}" varStatus="vs">
                                 <tr>
                                    <td>${personalMsg.msgNo}</td>
                                    <td>
                                    <a id="modal-1212${vs.index}"
                                       href="#modal-container-1212${vs.index}" data-toggle="modal">
                                          ${personalMsg.msgTitle}</a>
                                       <div class="modal fade "
                                          id="modal-container-1212${vs.index}" role="dialog"
                                          aria-labelledby="myModalLabel" aria-hidden="true">
                                          <div class="modal-dialog" role="document">
                                             <div class="modal-content" id="modal-1212${vs.index}">
                                                <form class="form-signin card-body" method="POST"
                                                   action="sendReply">
                                                   <input type="hidden" name="msgNo"
                                                      value="${personalMsg.msgNo}">
                                                   <!--  쪽지 번호  -->
                                                   <input type="hidden" name="memberNo2"
                                                      value="${personalMsg.msgSender}">
                                                   <!--받는 사람  -->
                                                   <input type="hidden" name="msgSender"
                                                      value="${loginMember.memberNo}">
                                                   <!--보내는 사람(답장하는 사람) -->
                                                   <p
                                                      style="color: gray; font-size: small; text-align: left;">
                                                      ${personalMsg.memberName} ( ${personalMsg.deptName} /
                                                      ${personalMsg.jobName} ) 님이 보냄</p>

                                                   <div class="card">
                                                      <div class="card-header"
                                                         style="background-color: rgba(176, 196, 222, 0.726);">
                                                         <h3 class="card-title ">받은 쪽지</h3>
                                                      </div>

                                                      <div class="modal-body">
                                                         <textarea rows="6" cols="61" readonly>${personalMsg.msgContent}</textarea>
                                                      </div>

                                                      <div class="card-header"
                                                         style="background-color: rgba(176, 196, 222, 0.726);">
                                                         <h3 class="card-title">답장 작성</h3>
                                                      </div>

                                                      <div class="modal-body">
                                                         <input type="text" name="msgTitle"
                                                            style="width: 432px;"
                                                            value="[Re] ${personalMsg.msgTitle} ">
                                                         <textarea rows="6" cols="61" name="msgContent"></textarea>
                                                      </div>

                                                      <div class="modal-footer">
                                                         <button class="btn btn-outline-success "
                                                            type="submit">전송</button>
                                                         <button type="button"
                                                            class="btn btn-outline-secondary"
                                                            data-dismiss="modal">취소</button>
                                                      </div>
                                                   </div>

                                                </form>
                                             </div>
                                             <!-- /.card -->
                                          </div>
                                       </div>
                                    </td>
                                    <td>${personalMsg.memberName}</td>
                                    <td>${personalMsg.msgDate}</td>
                                    <td>${personalMsg.msgStatus}</td>
                                 </tr>
                              </c:forEach>
                           </c:if>

                        </tbody>
                     </table>
                  </div>


                  <div class="card-footer text-right">
                     <!-- 쪽지보내기 모달 시작-->
                     <a id="modal-12110922" href="#modal-container-12110922"
                        role="button" class="btn btn btn-outline-success"
                        data-toggle="modal">쪽지 보내기</a>

                     <div class="modal fade " id="modal-container-12110922"
                        role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                           <div class="modal-content" id="modal-12110922">
                              <form class="form-signin card-body" method="POST"
                                 action="sendNewMsg">

                                 <div class="card">
                                    <div class="card-header bg-navy">
                                       <h3 class="card-title">쪽지 발송</h3>
                                    </div>
                                 </div>



                                 <div class="card card-primary card-outline card-outline-tabs">
                                    <div class="card-header p-0 border-bottom-0">
                                       <ul class="nav nav-tabs nav-fill"
                                          id="custom-tabs-three-tab" role="tablist">
                                          <li class="nav-item"><a class="nav-link active"
                                             id="custom-tabs-three-home-tab-1" data-toggle="pill"
                                             href="#custom-tabs-three-home-1" role="tab"
                                             aria-controls="custom-tabs-three-home-1"
                                             aria-selected="true">수신인 선택</a></li>
                                          <li class="nav-item"><a class="nav-link"
                                             id="custom-tabs-three-profile-tab" data-toggle="pill"
                                             href="#custom-tabs-three-profile" role="tab"
                                             aria-controls="custom-tabs-three-profile"
                                             aria-selected="false" >쪽지 작성</a></li>
                                       </ul>


                                       <div class="card-body">
                                          <div class="tab-content" id="custom-tabs-three-tabContent">

                                             <!-- 수신인찾기 탭 시작-->
                                             <!-- AJAX -->
                                             <div class="tab-pane fade show active"
                                                id="custom-tabs-three-home-1" role="tabpanel"
                                                aria-labelledby="custom-tabs-three-home-tab-1">

                                                <div class="row">
                                                   <div class="col-md-5" style="text-align: left;">
                                                      <table class="table" id="selectDepartment"
                                                         style="width: 100%; border: 1px solid rgba(176, 196, 222, 0.726)">
                                                         <thead
                                                            style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
                                                            <th>부서 선택</th>
                                                         </thead>
                                                         <tbody>
                                                            <tr>
                                                               <td><input type="radio" value="D1"
                                                                  name="group1" class="selectDepartment1">&nbsp;개발부서</td>
                                                            </tr>
                                                            <tr>
                                                               <td><input type="radio" value="D2"
                                                                  name="group1" class="selectDepartment1">&nbsp;경영지원부서</td>
                                                            </tr>
                                                            <tr>
                                                               <td><input type="radio" value="D3"
                                                                  name="group1" class="selectDepartment1">&nbsp;회계부서</td>
                                                            </tr>
                                                            <tr>
                                                               <td><input type="radio" value="D4"
                                                                  name="group1" class="selectDepartment1">&nbsp;인사부서</td>
                                                            </tr>
                                                            <tr>
                                                               <td><input type="radio" value="D5"
                                                                  name="group1" class="selectDepartment1">&nbsp;마케팅부서</td>
                                                            </tr>
                                                            <tr>
                                                               <td><input type="radio" value="D6"
                                                                  name="group1" class="selectDepartment1">&nbsp;영업부서</td>
                                                            </tr>
                                                         </tbody>
                                                      </table>

                                                   </div>



                                                   <div class="col-md-2">
                                                      <br> <br> <br> <br> <br> <br>
                                                      <br> <i class="fas fa-angle-double-right fa-2x"></i>
                                                   </div>


                                                   <div class="col-md-5" style="text-align: left;">
                                                      <table class="table" id="selectRecieverName"
                                                         style="height: 100px; overflow-x: scroll; overflow-y: hidden; border: 1px solid rgba(176, 196, 222, 0.726)">
                                                         <thead
                                                            style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
                                                            <th>수신인 선택</th>
                                                         </thead>
                                                         <tbody
                                                            style="height: 100px; overflow-x: scroll; overflow-y: hidden;">
                                                            
                                                         </tbody>
                                                      </table>
                                                         
                                                   </div>
                           <div class="modal-footer" style="padding-left:280px;">
                                 <input type="button"  class="btn btn-outline-primary"  id="selectBtn" value="선택">
                                 <button type="button" class="btn btn-outline-secondary"
                                    data-dismiss="modal">취소</button>
                              </div>


                                                </div>
                                                <!-- row 끝 -->
                                             </div>
                                             <!-- 첫번째 탭 끝-->


                                             <script>
                                                      // 수신인  경로;

                                                               $('input[name=group1]').click(function() {

                                                                     var radiovalue = $(this).val();

                                                                     console.log(radiovalue);

                                                                   $.ajax({
                                                                        url : "msgSelectDepartment",
                                                                        type : "post",
                                                                        data : {radiovalue:radiovalue},
                                                                        dataType:"json",
                                                                        success : function(mList) {
                                                                           console.log("success");
                                                                           /*$.each(mList, function(item, index){
                                                                              console.log(item.memberName);
                                                                           });*/
                                                                           $("#selectRecieverName tbody").html("");
                                                                           
                                                                           var td ="";
                                                                           
                                                                           for(var i in mList){
                                                                              console.log(mList[i].memberName);
                                                                              console.log(mList[i].memberNo);
                                                                              console.log(mList[i].jobName);
                                                                              
                                                                              //var $td = $("td").append(mList[i].memberName);
                                                                                 
                                                                              //$("#selectRecieverName tbody").append($td);
                                                                              
                                                                                /*td += "<tr><td>" + "<input type='radio' name='group2'  value='"+mList[i].memberName + "'>" + "<lable for = 'selectReciever'>" +  mList[i].memberName  +"   /   "+ mList[i].jobName + "</label>"
                                                                                 + "<input type='hidden' id='" + mList[i].memberName + "' value='"+    mList[i].memberNo  + "'>" + "</td></tr>";
                                                                             */
                                                                              td += "<tr><td>" + "<input type='radio' name='group2'  value='"+mList[i].memberNo + "'>" 
                                                                                 + "<input type='hidden' value='" + mList[i].memberName  + "'>"
                                                                                 + "<lable for = 'selectReciever'>" +  mList[i].memberName  +"   /   "+ mList[i].jobName + "</label>"
                                                                                 + "</td></tr>";
                                                                             
                                                   

                                                                           }
                                                                              
                                                                           
                                                                           $("#selectRecieverName tbody").html(td);
                                                                        }
                                                                   });
                                                               /*          var str = "";
                                                                           for ( var memberName in mList) {
                                                                              str += '<li>'+ mList[memberName]+ '/' + mList[deptName] + '</li>';
                                                                              }

                                                                              $('selectRecieverName').html('<ul>'+ str+ '</ul>');

                                                                           } */
                                                                     

                                                               });
                                                   </script>

         
                                                   <script>
                                                   
                                                         
                                                         $("#selectBtn").click(function(){
                                                            var memberNoVal = $('input[name="group2"]:checked').val();
                                                                console.log("memberNoVal : " + memberNoVal);
                                                                
                                                              var nameVal = $('input[name="group2"]:checked').next().val();
                                                              
                                                              console.log("nameVal : " + nameVal);
                                                               // var memberNoVal = $("#"+nameVal).val();
                                                               // console.log("memberNoVal : " +  memberNoVal);
                                                                
      
                                                                $("#memberName").text(nameVal);
                                                                $("#msgSender").val(memberNoVal);
                                                                
                                                                
                                                               // $("#memberName").text(radioVal);
                                                               
                                                              //  .focus("#custom-tabs-three-profile-tab");
                                                            
                                                               
                                                            /*     document.querySelectAll('.nav-tabs li')[0].classList.remove('active');

                                                                document.querySelectAll('.nav-tabs li')[1].classList.add('active');
                                                            
                                                            
                                                            
                                                                document.querySelectAll('.tab-content .tab-pane')[0].classList.remove('active');
                                                            
                                                                document.querySelectAll('.tab-content .tab-pane')[1].classList.add('active');
                                                        
                                                              */
                                                          
                                                    $('.nav-tabs a[href="#custom-tabs-three-profile"]').tab('show');

                                                         });
                                                      
                                                      
                                                         
                                                         function selectNo(){
                                                            
                                                                return memberNoVal;
                                                         };
                                                         
                                                         
                                                         
                                                   </script>


                                             <!-- 쪽지 작성 탭 시작 -->
                                             <div class="tab-pane fade" id="custom-tabs-three-profile"
                                                role="tabpanel"
                                                aria-labelledby="custom-tabs-three-profile-tab">
                                                <div>
                           
                                                   
                                                   <input type="hidden" name="memberNo2" value="${loginMember.memberNo}">
                                                   <!--보내는 사람  -->
                                          
                                                   <p style="color:grey; font-size:small; text-align:left;"> <span id="memberName"> </span> 님에게 보내는 쪽지 </p>
                                          
                                                      <input type="hidden" id="msgSender" name="msgSender" > <!-- 받는 사람 -->
                                             
                                                
                                                   <input type="text" name="msgTitle" style="width: 432px;">
                                                   <textarea cols="61" rows="6" name="msgContent"></textarea>
      
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                   <button class="btn btn-outline-primary " type="submit">발송</button>
                                                   <button type="button" class="btn btn-outline-secondary"
                                                      data-dismiss="modal">취소</button>
                                                </div>
                                             </div>
                                             <!-- 쪽지작성 탭  끝 -->

                                          </div>
                                          <!-- 탭 끝 -->



                                       </div>
                                    </div>

                                    <!-- /.card -->
                                 </div>
                              </form>
                        
                           </div>
                        </div>
                     </div>
                  </div>


               </div>
               <!-- /.row-->
            </div>
            <!-- /.container-fluid -->
         </div>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->



      <jsp:include page="../common/footer.jsp" />
   </div>
   </div>
   <!-- ./wrapper -->


   <script>
      
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
      src="<%=request.getContextPath()%>/resources/dist/js/pages/dashboard3.js"></script>


</body>
</html>