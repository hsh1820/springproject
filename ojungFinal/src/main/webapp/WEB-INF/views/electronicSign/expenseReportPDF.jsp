<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title></title>
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
        .tg  {border-collapse:collapse;border-spacing:0; width: 100%;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
        .tg .tg-0pky{border-color:black;text-align:center;vertical-align:middle;}
        .tg .tg-0pky-price{text-align: right;}
    </style>
</head>

<body>
    <h2 style="text-align: center;">지출결의서</h2>

    <div id="wrapper">
        <!-- 첫 번째 div -->
        <div id="header">
            <div id="first-first" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-cly1">문서번호</th>
                        <td style="width: 150px;">99</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">작성일자</th>
                        <td style="width: 150px;">2020/02/29</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">신청부서</th>
                        <td style="width: 150px;">인사팀</td>
                    </tr>
                    <tr>
                        <th class="tg-0lax">신청자</th>
                        <td style="width: 150px;">한송희</td>
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
                        <td class="tg-nrix"></td>
                        <td class="tg-baqh"></td>
                        <td class="tg-baqh"></td>
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
        <!-- 두 번째 div -->
        <div>
            <table class="tg">
                <tr>
                  <th class="tg-0pky">지출금액</th>
                  <td class="tg-0pky" colspan="3">일금 99,999,999 원</td>
                </tr>
                <tr>
                  <th class="tg-0pky">제목</th>
                  <td class="tg-0pky" colspan="3">00부서 00팀 신입사원 컴퓨터 및 주변장치 구매</td>
                </tr>
                <tr>
                  <th class="tg-0pky" rowspan="5" style="vertical-align: middle;">내역</th>
                  <th class="tg-0pky">적요</th>
                  <th class="tg-0pky">금액</th>
                  <th class="tg-0pky">비고</th>
                </tr>
                <tr>
                  <td class="tg-0pky">컴퓨터 본체(조립)	</td>
                  <td class="tg-0pky-price">1,000,000</td>
                  <td class="tg-0pky">00부터 00팀 신입사원</td>
                </tr>
                <tr>
                  <td class="tg-0pky">모니터(lg fld-9000)	</td>
                  <td class="tg-0pky-price">428,000	</td>
                  <td class="tg-0pky">00부터 00팀 신입사원</td>
                </tr>
                <tr>
                  <td class="tg-0pky">tc-lc200	</td>
                  <td class="tg-0pky-price">93,800</td>
                  <td class="tg-0pky">키보드</td>
                </tr>
                <tr>
                  <td class="tg-0pky">로지텍 wq-99		</td>
                  <td class="tg-0pky-price">12,000	</td>
                  <td class="tg-0pky">마우스</td>
                </tr>
                <tr>
                  <td colspan="4"><p>위 금액을 청구하오니 결재바랍니다.	</p><br>
                    <p style="text-align: center;">2020년 02월 29일</p>
                    <p style="text-align: right;"><sub>영수인: 한송희(인)</sub></p>
                </td>
                  
                </tr>
               
              </table>   

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