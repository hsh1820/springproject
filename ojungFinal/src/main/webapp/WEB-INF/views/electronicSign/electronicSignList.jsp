<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 전자결재 </title>
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


<body class="hold-transition sidebar-mini">
<div class="wrapper">

<jsp:include page="../common/nav.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->


<!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        
        <!-- /.row -->
        <div class="row">
          <div class="col-12">
            <div class="card">
                <div class="card-header bg-navy">
                  <h3 class="card-title">기안서작성</h3>
                </div>
            <ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" aria-controls="custom-content-above-home" aria-selected="true">전체</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" aria-controls="custom-content-above-profile" aria-selected="false">진행중</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="custom-content-above-messages-tab" data-toggle="pill" href="#custom-content-above-messages" role="tab" aria-controls="custom-content-above-messages" aria-selected="false">미열람</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="custom-content-above-settings-tab" data-toggle="pill" href="#custom-content-above-settings" role="tab" aria-controls="custom-content-above-settings" aria-selected="false">결재완료</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="custom-content-above-settings-tab" data-toggle="pill" href="#custom-content-above-setting" role="tab" aria-controls="custom-content-above-settings" aria-selected="false">반려</a>
              </li>
            </ul>
           
            <div class="tab-content" id="custom-content-above-tabContent">
              <div class="tab-pane fade show active" id="custom-content-above-home" role="tabpanel" aria-labelledby="custom-content-above-home-tab">
                <table class="table table-hover text-nowrap" style="text-align:center">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>기안일자</th>
                        <th>제목</th>
                        <th>구분</th>
                        <th>기안자</th>
                        <th>진행상태</th>
                        <th>결재</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                          <td>1</td>
                          <td>2020/02/14</td>
                          <td>휴가신청서_김사원</td>
                          <td>휴가신청서</td>
                          <td>김사원</td>
                          <td>진행중</td>
                          <td><a href="holidayRequestPDF">보기</a></td>
                      </tr>
                      <tr>
                          <td>2</td>
                          <td>2020/02/13</td>
                          <td>지출결의서_김사원</td>
                          <td>지출결의서</td>
                          <td>김사원</td>
                          <td>미열람</td>
                          <td><a href="expenseReportPDF">보기</a></td>
                      </tr>
                      <tr>
                          <td>3</td>
                          <td>2020/02/14</td>
                          <td>건강검진신청서_김사원</td>
                          <td>건강검진신청서</td>
                          <td>김사원</td>
                          <td>결재</td>
                          <td><a href="physicalExamPDF">보기</a></td>
                      </tr>
                      <tr>
                          <td>4</td>
                          <td>2020/02/14</td>
                          <td>경조사지원신청서_김사원</td>
                          <td>경조사지원신청서</td>
                          <td>김사원</td>
                          <td>반려</td>
                          <td><a href="eventPDF">보기</a></td>
                      </tr>
                      <tr>
                          <td>5</td>
                          <td>2020/02/14</td>
                          <td>결근사유서_김사원</td>
                          <td>결근사유서</td>
                          <td>김사원</td>
                          <td>진행중</td>
                          <td><a href="absentDocPDF">보기</a></td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td>2020/02/14</td>
                        <td>야근식대_김사원</td>
                        <td>결근사유서</td>
                        <td>김사원</td>
                        <td>결재</td>
                        <td><a href="nightMealPDF">보기</a></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>2020/02/14</td>
                        <td>야근식대_김사원</td>
                        <td>결근사유서</td>
                        <td>김사원</td>
                        <td>결재</td>
                        <td><a href="nightMealPDF">보기</a></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>2020/02/14</td>
                        <td>품의서_김사원</td>
                        <td>품의서</td>
                        <td>김사원</td>
                        <td>결재</td>
                        <td><a href="expenditurePDF">보기</a></td>
                    </tr>
                     <tr>
                        <td>6</td>
                        <td>2020/02/14</td>
                        <td>사직서_김사원</td>
                        <td>결근사유서</td>
                        <td>김사원</td>
                        <td>결재</td>
                        <td><a href="resignationPDF">보기</a></td>
                    </tr>
                    
                    
                    </tbody>
                  </table>
              </div>
              <div class="tab-pane fade" id="custom-content-above-profile" role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
                <table class="table table-hover text-nowrap" style="text-align:center">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>기안일자</th>
                        <th>제목</th>
                        <th>구분</th>
                        <th>기안자</th>
                        <th>진행상태</th>
                        <th>결재</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                          <td>1</td>
                          <td>2020/02/14</td>
                          <td>휴가신청서_김사원</td>
                          <td>휴가신청서</td>
                          <td>김사원</td>
                          <td>진행중</td>
                          <td><a href="#">보기</a></td>
                      </tr>
                      <tr>
                          <td>5</td>
                          <td>2020/02/14</td>
                          <td>결근사유서_김사원</td>
                          <td>결근사유서</td>
                          <td>김사원</td>
                          <td>진행중</td>
                          <td><a href="#">보기</a></td>
                      </tr>
                    </tbody>
                  </table>
              </div>
              <div class="tab-pane fade" id="custom-content-above-messages" role="tabpanel" aria-labelledby="custom-content-above-messages-tab">
                <table class="table table-hover text-nowrap" style="text-align:center">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>기안일자</th>
                        <th>제목</th>
                        <th>구분</th>
                        <th>기안자</th>
                        <th>진행상태</th>
                        <th>결재</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                          <td>2</td>
                          <td>2020/02/13</td>
                          <td>지출결의서_김사원</td>
                          <td>지출결의서</td>
                          <td>김사원</td>
                          <td>미열람</td>
                          <td><a href="expenseReportPDF">보기</a></td>
                      </tr>
                    </tbody>
                  </table>
              </div>
              <div class="tab-pane fade" id="custom-content-above-settings" role="tabpanel" aria-labelledby="custom-content-above-settings-tab">
                <table class="table table-hover text-nowrap" style="text-align:center">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>기안일자</th>
                        <th>제목</th>
                        <th>구분</th>
                        <th>기안자</th>
                        <th>진행상태</th>
                        <th>결재</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                          <td>3</td>
                          <td>2020/02/14</td>
                          <td>건강검진신청서_김사원</td>
                          <td>건강검진신청서</td>
                          <td>김사원</td>
                          <td>결재</td>
                          <td><a href="#">보기</a></td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td>2020/02/14</td>
                        <td>결근사유서_김사원</td>
                        <td>결근사유서</td>
                        <td>김사원</td>
                        <td>결재</td>
                        <td><a href="#">보기</a></td>
                    </tr>
                    </tbody>
                  </table>
              </div>
              <div class="tab-pane fade" id="custom-content-above-setting" role="tabpanel" aria-labelledby="custom-content-above-settings-tab">
                <table class="table table-hover text-nowrap" style="text-align:center">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>기안일자</th>
                        <th>제목</th>
                        <th>구분</th>
                        <th>기안자</th>
                        <th>진행상태</th>
                        <th>결재</th>
                      </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>4</td>
                            <td>2020/02/14</td>
                            <td>경조사지원신청서_김사원</td>
                            <td>경조사지원신청서</td>
                            <td>김사원</td>
                            <td>반려</td>
                            <td><a href="#">보기</a></td>
                        </tr>
                    </tbody>
                  </table>
              </div>
             
                
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default"  style="float: right;">
                  결재 등록
                </button>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>

        <!-- 결재구분 모달 -->
        <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">결재구분</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="tab-pane fade show active" id="custom-content-above-home" role="tabpanel"
                aria-labelledby="custom-content-above-home-tab">
                <table class="table table-hover text-nowrap" style="text-align:center">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>분류</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td><a href="nightMealDraft">야근식대전표</a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td><a href="expenseReportDraft">지출결의서</a></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td><a href="expenditureDraft">품의서</a></td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td><a href="resignationDraft">사직서</a></td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td><a href="physicalExamDraft">건강검진신청서</a></td>
                    </tr>
                    <tr>
                      <td>6</td>
                      <td><a href="holidayRequestDraft">휴가신청서</a></td>
                    </tr>
                    <tr>
                      <td>7</td>
                      <td><a href="eventDraft">경조사신청</a></td>
                    </tr>
                    <tr>
                      <td>8</td>
                      <td><a href="absentDocDraft">결근사유서</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</div>


  <jsp:include page="../common/footer.jsp"/>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="<%=request.getContextPath() %>/resources/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="<%=request.getContextPath() %>/resources/plugins/chart.js/Chart.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/pages/dashboard3.js"></script>


</body>
</html>