<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Mypage2</title>
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
        <div class="row">
          <div class="col-md-3">

            <!-- Profile 영역 -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                </div>

                <!-- 로그인멤버 이름 -->
                <h3 class="profile-username text-center">김관리</h3>

                <!-- 로그인멤버 소속 /  직급 -->
                <p class="text-muted text-center">programmer</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Tel</b> <a class="float-right">070-7777-4454</a>
                  </li>
                  <li class="list-group-item">
                    <b>Email</b> <a class="float-right">kim44@ojung.com</a>
                  </li>
                </ul>

              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">개인 정보</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-star mr-1"></i> 소속</strong>

                <p class="text-muted">개발 1팀</p>

                <hr>

                <strong><i class="fas fa-user mr-1"></i> 직급</strong>

                <p class="text-muted">사원</p>

                <hr>

                <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>

                <p class="text-muted">
                  <span class="tag tag-danger">UI Design</span>
                  <span class="tag tag-success">Coding</span>
                  <span class="tag tag-info">Javascript</span>
                  <span class="tag tag-warning">PHP</span>
                  <span class="tag tag-primary">Node.js</span>
                </p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" aria-controls="custom-content-above-home" aria-selected="true">부서정보</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" aria-controls="custom-content-above-profile" aria-selected="false">내 근태현황</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-content-above-messages-tab" data-toggle="pill" href="#custom-content-above-messages" role="tab" aria-controls="custom-content-above-messages" aria-selected="false">개인정보 변경</a>
                  </li>
                  </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <!-- 부서정보  -->
                  <div class="tab-pane fade show active" id="custom-content-above-home" role="tabpanel" aria-labelledby="custom-content-above-home-tab">
                    <!-- /.row -->
                    <div class="row">
                      <div class="col-12">
                        <div class="card">
                          <div class="card-header">
                            <div class="card-tools">
                              <div class="input-group input-group-sm" style="width: 150px;">
                                <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                <div class="input-group-append">
                                  <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- /.card-header -->
                          <div class="card-body table-responsive p-0" style="height: 550px;">
                            <table class="table table-head-fixed text-nowrap">
                              <thead>
                                <tr>
                                  <th>사번</th>
                                  <th>이름</th>
                                  <th>직급</th>
                                  <th>내선</th>
                                  <th>이메일</th>
                                  <th>출근상태</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>김일일</td>
                                  <td>사원</td>
                                  <td>070-7777-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>-</td>
                                </tr>
                                <tr>
                                  <td>1</td>
                                  <td>김이이</td>
                                  <td>대리</td>
                                  <td>070-7777-4254</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:45</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김삼삼</td>
                                  <td>과장</td>
                                  <td>070-7767-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:40</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김사사</td>
                                  <td>차장</td>
                                  <td>070-7747-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:41</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김관리</td>
                                  <td>부장</td>
                                  <td>070-7777-4444</td>
                                  <td>asdf@naver.com</td>
                                  <td>09:20</td>
                                </tr>
                                <tr>
                                  <td>1</td>
                                  <td>김일일</td>
                                  <td>사원</td>
                                  <td>070-7777-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>-</td>
                                </tr>
                                <tr>
                                  <td>1</td>
                                  <td>김이이</td>
                                  <td>대리</td>
                                  <td>070-7777-4254</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:45</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김삼삼</td>
                                  <td>과장</td>
                                  <td>070-7767-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:40</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김사사</td>
                                  <td>차장</td>
                                  <td>070-7747-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:41</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김관리</td>
                                  <td>부장</td>
                                  <td>070-7777-4444</td>
                                  <td>asdf@naver.com</td>
                                  <td>09:20</td>
                                </tr>
                                <tr>
                                  <td>1</td>
                                  <td>김일일</td>
                                  <td>사원</td>
                                  <td>070-7777-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>-</td>
                                </tr>
                                <tr>
                                  <td>1</td>
                                  <td>김이이</td>
                                  <td>대리</td>
                                  <td>070-7777-4254</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:45</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김삼삼</td>
                                  <td>과장</td>
                                  <td>070-7767-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:40</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김사사</td>
                                  <td>차장</td>
                                  <td>070-7747-4454</td>
                                  <td>asdf@naver.com</td>
                                  <td>08:41</td>
                                </tr>                                
                                <tr>
                                  <td>1</td>
                                  <td>김관리</td>
                                  <td>부장</td>
                                  <td>070-7777-4444</td>
                                  <td>asdf@naver.com</td>
                                  <td>09:20</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>
                    </div>
                    <!-- /.row -->
                  </div>
                  <!-- 내 근태현황 -->
                  <div class="tab-pane fade" id="custom-content-above-profile" role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
                    <div class="row">
                      <div class="col-12">
                        <div class="card">
                          <div class="card-header">
                            <span class="info-box-icon"><i class="far fa-calendar-alt"></i> 남은 연차수 : 3.5</span>
                            <div class="card-tools">
                              <div class="input-group input-group-sm" style="width: 150px;">
                                <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                <div class="input-group-append">
                                  <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- /.card-header -->
                          <div class="card-body table-responsive p-0" style="height: 550px;">
                            <table class="table table-head-fixed text-nowrap">
                              <thead>
                                <tr>
                                  <th>날짜</th>
                                  <th>출근 시간</th>
                                  <th>퇴근 시간</th>
                                  <th>상태</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>09:01</td>
                                  <td>19:00</td>
                                  <td><span class="badge bg-danger">지각</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>08:01</td>
                                  <td>19:00</td>
                                  <td><span class="badge bg-primary">정상</span></td>
                                </tr>                                
                                <tr>
                                  <td>2020/02/20</td>
                                  <td> - </td>
                                  <td> - </td>
                                  <td><span class="badge bg-warning">연차</span></td>
                                </tr>                                
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>13:00</td>
                                  <td>18:00</td>
                                  <td><span class="badge bg-warning">오전</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>08:50</td>
                                  <td>13:00</td>
                                  <td><span class="badge bg-warning">오후</span></td>
                                </tr>                               
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>09:01</td>
                                  <td>21:00</td>
                                  <td><span class="badge bg-info">야근</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>09:01</td>
                                  <td>19:00</td>
                                  <td><span class="badge bg-danger">지각</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>08:01</td>
                                  <td>19:00</td>
                                  <td><span class="badge bg-primary">정상</span></td>
                                </tr>                                
                                <tr>
                                  <td>2020/02/20</td>
                                  <td> - </td>
                                  <td> - </td>
                                  <td><span class="badge bg-warning">연차</span></td>
                                </tr>                                
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>13:00</td>
                                  <td>18:00</td>
                                  <td><span class="badge bg-warning">오전</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>08:50</td>
                                  <td>13:00</td>
                                  <td><span class="badge bg-warning">오후</span></td>
                                </tr>                               
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>09:01</td>
                                  <td>21:00</td>
                                  <td><span class="badge bg-info">야근</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>09:01</td>
                                  <td>19:00</td>
                                  <td><span class="badge bg-danger">지각</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>08:01</td>
                                  <td>19:00</td>
                                  <td><span class="badge bg-primary">정상</span></td>
                                </tr>                                
                                <tr>
                                  <td>2020/02/20</td>
                                  <td> - </td>
                                  <td> - </td>
                                  <td><span class="badge bg-warning">연차</span></td>
                                </tr>                                
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>13:00</td>
                                  <td>18:00</td>
                                  <td><span class="badge bg-warning">오전</span></td>
                                </tr>
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>08:50</td>
                                  <td>13:00</td>
                                  <td><span class="badge bg-warning">오후</span></td>
                                </tr>                               
                                <tr>
                                  <td>2020/02/20</td>
                                  <td>09:01</td>
                                  <td>21:00</td>
                                  <td><span class="badge bg-info">야근</span></td>
                                </tr>                    
                              </tbody>
                            </table>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>
                    </div>
                  </div>
                  <!-- 개인정보 확인 / 변경 -->
                  <div class="tab-pane fade" id="custom-content-above-messages" role="tabpanel" aria-labelledby="custom-content-above-messages-tab">
                    <form class="form-horizontal">
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">비밀번호 변경</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" id="inputName2" placeholder="password">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">비밀번호 변경 재확인</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" id="inputName2" placeholder="password recheck">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">주소 변경</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputName2" placeholder="address">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">연락처 변경</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputName2" placeholder="phone">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">서명 업로드</label>
                        <div class="btn btn-default btn-file ml-2 ">
                          <i class="fas fa-paperclip "></i> attachment
                          <input type="file" name="attachment">
                        </div>
                        <!-- <p class="help-block">Max. 32MB</p> -->
                      </div>
                      <!-- <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">Experience</label>
                        <div class="col-sm-10">
                          <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                        </div> -->
                        <div class="form-group row ">
                          <div class="offset-sm-2 col-sm-10">
                            <button type="submit" class="btn btn-primary float-right ml-2">Submit</button>
                            <button type="reset" class="btn btn-danger float-right">Reset </button>
                          </div>
                        </div>
                      </form>
                  </div>

                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
	    </section>
      </div><!-- /.container-fluid -->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->



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