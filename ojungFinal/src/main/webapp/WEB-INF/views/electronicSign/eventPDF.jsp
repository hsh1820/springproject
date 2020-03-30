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
            text-align: center;
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
            width: 48%;
            height: 100%;
            float: left;
            position: relative;
        }
        #first-third {
            width: 25%;
            height: 100%;
            float: left; 
        }

        
    </style>
</head>
<body>
    <h2 style="text-align: center;">경조사 휴가 신청</h2>

    <div id="wrapper">
        <!-- 첫 번째 div -->
        <div id="header">
            <div id="first-first" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-cly1">문서번호</th>
                        <td style="width: 150px;">10</td>
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
                        <td style="width: 150px;">윤소희</td>
                    </tr>
                </table>
            </div>
            <div id="first-second" ></div>
            <div id="first-third" class="tg-wrap">
              <table class="tg">
                <tbody><tr>
                    <th class="tg-yla0" rowspan="3">결재</th>
                    <th class="tg-nrix">부장</th>
                    <th class="tg-baqh">상무</th>
                    <th class="tg-baqh">사장</th>
                </tr>
                <tr style="height: 60px;">
                    <td class="tg-nrix"></td>
                    <td class="tg-baqh"></td>
                    <td class="tg-baqh"></td>
                </tr>
                <tr>
                    <td class="tg-nrix">2020/02/28</td>
                    <td class="tg-baqh">2020/02/29</td>
                    <td class="tg-baqh">2020/03/02</td>
                </tr>
            </tbody></table>
            </div>

        </div>
        <hr>
        <!-- 두 번째 div -->
        <div>
          <table class="tg" style="undefined;table-layout: fixed; width: 100%">
            <colgroup>
            <col style="width: 111px">
            <col style="width: 101px">
            <col style="width: 106px">
            <col style="width: 101px">
            <col style="width: 93px">
            <col style="width: 101px">
            <col style="width: 142px">
            </colgroup>
              <tr>
                <td class="tg-c3ow " style="color: #333; background-color: #f0f0f0;"rowspan="2">신청인</td>
                <td class="tg-c3ow "style="color: #333; background-color: #f0f0f0;">소속</td>
                <td class="tg-c3ow "></td>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">직위</td>
                <td class="tg-c3ow "></td>
                <td class="tg-c3ow " style="color: #333; background-color: #f0f0f0;">사원번호</td>
                <td class="tg-c3ow "></td>
              </tr>
              <tr>
                <td class="tg-c3ow " style="color: #333; background-color: #f0f0f0;">성명</td>
                <td class="tg-c3ow"></td>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">입사일자</td>
                <td class="tg-c3ow"></td>
                <td class="tg-c3ow " style="color: #333; background-color: #f0f0f0;">연락처</td>
                <td class="tg-c3ow"></td>
              </tr>
              <tr>
                <td class="tg-c3ow" rowspan="3" style="color: #333; background-color: #f0f0f0;">경조내용</td>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">경조구분</td>
                <td class="tg-c3ow"></td>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">지급금액</td>
                <td class="tg-c3ow" colspan="3"></td>
              </tr>
              <tr>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">본인과의 관계</td>
                <td class="tg-c3ow"></td>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">경조일자</td>
                <td class="tg-c3ow" colspan="3"></td>
              </tr>
              <tr>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">경조일자</td>
                <td class="tg-c3ow" colspan="5"></td>
              </tr>
              <tr>
                <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">경조 휴가 기간</td>
                <td class="tg-c3ow" colspan="2">
                  <input type="text" readonly style="background-color: white; border: white; text-align: center;" value="2020-02-20">부터
                </td>
                <td class="tg-c3ow" colspan="2">
                  <input type="text" readonly style="background-color: white; border: white; text-align: center;" value="2020-02-22">까지
                </td>
                <td class="tg-c3ow"  colspan="2">
                   <span>{</span> 
                    2
                  <span>일간)</span></td>
              </tr>
            </table>
        </div>
        <hr>
        <!-- 세 번째 div -->
        <div>
            <h2 style="text-align: center;">경 조 금 영 수 증</h2>
            <table class="tg" style="undefined;table-layout: fixed; width:100%">
                <colgroup>
                <col style="width: 15%">
                <col style="width: 30%">
                <col style="width: 15%">
                <col style="width: 30%">
                </colgroup>
                  <tr>
                    <td class="tg-c3ow" style="color: #333; background-color: #f0f0f0;">영 수 금 액</td>
                    <td class="tg-0pky " colspan="2">
                        <span >일금</span>
                        20000
                    </td>
                    <td>
                        <span >정 ( ￦ </span>
                        20000
                        <span >원) </span>
                    </td>

                  </tr>
                  <tr>
                    <td class="tg-0pky" style="color: #333; background-color: #f0f0f0;">지 급 구 분</td>
                    <td class="tg-0pky" colspan="3" >결혼</td>
                  </tr>
                  <tr >
                    <td class="tg-0pky" style="color: #333; background-color: #f0f0f0;">경 조 일 시</td>
                    <td class="tg-0pky"></td>
                    <td class="tg-0pky" style="color: #333; background-color: #f0f0f0;">지 급 일 자</td>
                    <td class="tg-0pky"></td>
                  </tr>
                </table>
                <p style="text-align: center;">위 금액을 정히 영수합니다.</p>
                <p style="text-align: center;">2020년 02월 29일</p>
                <pre style="text-align: right;">성명 :                  (인)</pre>
               
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