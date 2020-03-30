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
            height: 100%;
            float: left;
            position: relative;
        }

        #first-second{
            width: 50%;
            height: 100%;
            float: left;
            position: relative;
        }
        #first-third {
            width: 25%;
            height: 100%;
            float: left; 
        }
        .tg  {
            border-collapse:collapse;
            border-spacing:0;
        }
        .tg td{
            font-family:Arial, sans-serif;
            font-size:14px;
            padding:10px 5px;
            border-style:solid;
            border-width:1px;
            overflow:hidden;
            word-break:normal;
            border-color:black;
        }
        .tg th{
            font-family:Arial, sans-serif;
            font-size:14px;
            font-weight:normal;
            padding:10px 5px;
            border-style:solid;
            border-width:1px;
            overflow:hidden;
            word-break:normal;
            border-color:black;
        }
        .tg .tg-0pky{
            border-color:inherit;
            text-align:left;
            vertical-align:top
        }
        .tg .tg-0lax{
            text-align:left;
            vertical-align:top
            }
        #content{
            width: 100%;
            height: 60%;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">사직서</h2>

    <div id="wrapper">
        <div id="header">
            <div id="first-first" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-cly1">문서번호</th>
                        <td style="width: 150px;">5</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">작성일자</th>
                        <td style="width: 150px;">2020/02/28</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">신청부서</th>
                        <td style="width: 150px;">인사팀</td>
                    </tr>
                    <tr>
                        <th class="tg-0lax">신청자</th>
                        <td style="width: 150px;">김희원</td>
                    </tr>
                </table>
            </div>
            <div id="first-second"></div>
            <div id="first-third" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-yla0" rowspan="3">결재</th>
                        <th class="tg-nrix">부장</th>
                        <th class="tg-baqh">상무</th>
                        <th class="tg-baqh">사장</th>
                    </tr>
                    <tr>
                        <td class="tg-nrix" style="height: 50px;"></td>
                        <td class="tg-baqh" style="height: 50px;"></td>
                        <td class="tg-baqh" style="height: 50px;"></td>
                    </tr>
                    <tr>
                        <td class="tg-nrix">2020/02/28</td>
                        <td class="tg-baqh">2020/02/29</td>
                        <td class="tg-baqh">2020/03/02</td>
                    </tr>
                </table>
            </div>

        </div>
        <hr>
        <table class="tg" style="width: 100%;">
            <tr>
              <th class="tg-cly1" style="width: 12%; text-align: center;">소속</th>
              <td class="tg-cly1" style="width: 38%;"></td>
              <th class="tg-cly1" style="width: 12%; text-align: center;">직위</th>
              <td class="tg-cly1" style="width: 38%;"></td>
            </tr>
            <tr>
              <th class="tg-cly1" style="width: 12%; text-align: center;">성명</th>
              <td class="tg-cly1"></td>
              <th class="tg-cly1" style="width: 12%; text-align: center;">주민등록번호</th>
              <td class="tg-cly1"></td>
            </tr>
            <tr>
              <th class="tg-cly1" style="width: 12%; text-align: center;">입사일자</th>
              <td class="tg-cly1"></td>
              <th class="tg-cly1" style="width: 12%; text-align: center;">퇴사예정일</th>
              <td class="tg-cly1"></td>
            </tr>
            <tr>
              <th class="tg-cly1" style="width: 12%; text-align: center;">퇴사후연락처</th>
              <td class="tg-cly1"></td>
              <th class="tg-cly1" style="width: 12%; text-align: center;">주소</th>
              <td class="tg-cly1"></td>
            </tr>
          </table>
          <br>
          <div id="content">
              <div id="content-1" style="height: 15%;">
                <p style="font-size: 12px;"> 
                    &nbsp;&nbsp;
                    상기 본인은 아래와 같은 사유로 퇴직하고자 하오니 허락하여 주시기 바랍니다.
                    (퇴직사유는 상세하게 기록)
                </p>
               </div>

               <div id="content-2" style="height: 50%;">

               </div>

               <div id="content-3" style="height: 35%;">

                <p style="text-align: center;">
                2020년  02월  29일
           
                </p>
                <pre style="float: right; margin-right: 3%;">
                    위 본 인                         (인)
                    <br>
                    (주)오정상사 대표                귀하
                </pre>
               </div>


                

          </div>
          <br>
<br>
<hr>
<br>
 <button onclick="printPdf()" style="width: 100px; height: 50px; float: right; border: 1px solid lightgrey">인쇄</button>
    </div>
    
    <script type="text/javascript"> 
	function printPdf(){
		window.print();
	}
	</script>
</body>
</html>