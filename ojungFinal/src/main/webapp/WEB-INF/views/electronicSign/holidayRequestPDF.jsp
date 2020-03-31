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
      <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-cly1 {
            text-align: left;
            vertical-align: middle
        }

        .tg .tg-buh4 {
            background-color: #f9f9f9;
            text-align: left;
            vertical-align: top
        }

        .tg .tg-yjjc {
            background-color: #f9f9f9;
            text-align: left;
            vertical-align: middle
        }

        .tg .tg-0lax {
            text-align: left;
            vertical-align: top
        }

        @media screen and (max-width: 767px) {
            .tg {
                width: auto !important;
            }

            .tg col {
                width: auto !important;
            }

            .tg-wrap {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
        }

        #wrapper {
            width: 1000px;
            height: 800px;

            margin: auto;
        }

        #header {
            width: 100%;
            height: 20%;
        }

        #first-first {
            width: 25%;
            height: 20%;
            float: left;
            position: relative;
        }

        #first-second{
            width: 50%;
            height: 20%;
            float: left;
            position: relative;
        }
        #first-third {
            width: 25%;
            height: 20%;
            float: left; 
            
        }
    



    </style>
</head>
<body>


<body class="hold-transition sidebar-mini">
<div class="wrapper">

 <h2 style="text-align: center;">휴가 신청서</h2>

    <div id="wrapper">
        <!-- 첫 번째 div -->
        <div id="header">
            <div id="first-first" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-cly1">문서번호</th>
                        <td style="width: 150px;">12</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">작성일자</th>
                        <td style="width: 150px;">2020/03/05</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">신청부서</th>
                        <td style="width: 150px;">개발팀</td>
                    </tr>
                    <tr>
                        <th class="tg-0lax">신청자</th>
                        <td style="width: 150px;">김별하</td>
                    </tr>
                </table>
            </div>
            <div id="first-second"></div>
            <div id="first-third" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-yla0" rowspan="3">결재</th>
                        <th class="tg-nrix">과장</th>
                        <th class="tg-baqh">부장</th>
                    </tr>
                    <tr style="height: 60px;">
                        <td class="tg-nrix"></td>
                        <td class="tg-baqh"></td>
                    </tr>
                    <tr>
                        <td class="tg-nrix">2020/02/28</td>
                        <td class="tg-baqh">2020/02/29</td>
                    </tr>
                </table>
            </div>

        </div>
        <hr>
        <!-- 두 번째 div -->
        <div>
          <br>
          <br>

             기안번호 : 2020/03/05-1
             <table class="tg">
              <tr>
                  <th class="tg-cly1">휴가신청일자</th>
                  <td style="width: 421px;"></td>
       
                  <th class="tg-cly1">휴가 종류</th>
                  <td style="width: 420px;"></td>
              </tr>
              </table>

             <div style="width: 992px; height: 180px; border: 1px solid lightgrey;">
                  		<br>
                  		<br>
                  		<p style="text-align: center;">위와 같은 내용으로 휴가 신청서를 제출합니다.</p>
						<p style="text-align: center;">2020년 03 월 06 일</p>
						<p style="text-align: right;">
							<sub>신청인: 김별하(인)</sub>
						</p>
             </div>
 
        <br>
        <br>

        </div>

<hr>
      <br>
   
    <button onclick="printPdf()" style="width: 100px; height: 50px; float: right; border: 1px solid lightgrey">인쇄</button>
    </div>
    
    <script type="text/javascript"> 
	function printPdf(){
		window.print();
	}
	</script>
</div>
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