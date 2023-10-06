<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<style>
	/* 네모의 스타일 */
	.nemo {
	    width: 20px; /* 네모의 너비 */
	    height: 20px; /* 네모의 높이 */
	    background-color: #fff; /* 네모의 배경색 */
	    border: 1px solid #999; /* 네모의 테두리 스타일 */
	}
</style>
</head>
<body>
<h1>휴가신청&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="신청취소"/></h1>
신청정보<hr/>
    <table>
        <tr>
            <td>휴가현황</td>
            <td>휴가신청</td>
            </tr>
        <tr>
            <td>휴가기간</td>
	           <td>휴가유형
	           		<select>
							<option> —선택—
							<option> 월차
							<option> 연차
							<option> 경조휴가
							<option> 병가
							<option> 공가
					</select>
	           </td>
         </tr>
            <th>신청일수</th>
	            <th>신청시간
	            	<input type="datetime-local" id="datetime" name="datetime" readonly/>
	            </th>
            <th>잔여휴가 일 시간</th>
            <th>시작/종료시간
            	<input type="datetime-local"/>
            </th>
      </tr>
          <!-- <tr>
            <td>휴가 상태</td>
            <td>휴가 신청 내용</td>
            <td>휴가 시작일 - 휴가 종료일</td>
            <td>신청된 휴가 일수</td>
            <td>신청된 휴가 시간</td>
            <td>잔여 휴가 일수</td>
            <td>시작 시간 - 종료 시간</td>
        </tr>  -->
   	</table>
휴가 사유 : <textarea value="사유"></textarea><br><br>
<hr>
<input type="button" value="신청완료"/>
</h1>
<br><br><br>
<h1>신청내역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="삭제"/></h1><hr/>
<table>
        <tr>
            <th>부서 이름 |</th>
            <th>근태 구분 |</th>
            <th><div class="nemo"></div></th>
            <th>신청 기간 |</th>
            <th>시간 |</th>
            <th>신청 일수 |</th>
            <th>신청 시간 |</th>
            <th>연차 차감 |</th>
            <th>사유</th>
        </tr>
        </table>
</body>
	<script>
		document.getElementById('datetime').value= new Date().toISOString().slice(0, 16);
	</script>
</html>