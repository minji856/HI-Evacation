<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<style>
    table {
        border-collapse: collapse; /* 테두리를 겹치게 함 */
        width: 100%; /* 테이블 너비를 100%로 설정 */
    }
    th, td {
        border: 1px solid black; /* 테두리 스타일과 두께를 지정 */
        padding: 5px; /* 셀 내부 여백 설정 */
    }
</style>
</head>
<body>
2023 (주)Acorn 인사팀 ㅇㅇㅇ사원, 사용연차현황<br><br><br>
<h1>휴가신청</h1>
<input type="reset" value="신청취소"/>
신청정보<hr/>
    <table>
        <tr>
            <td>휴가현황</td>
            <td>휴가신청</td>
            </tr>
        <tr>
            <td>휴가기간</td>
	           <td>휴가유형
	           		<select id="vacationtype">
	           				<!-- -선택- 눌렀을 때 정보 안 넘어오는거 예외처리 -->
							<option value=""> —선택—
							<option value="monthlyleave"> 월차
							<option value="halfdayleave"> 반차
							<option value="annualleave"> 연차
							<option value=""> 경조휴가
							<option value="sickleave"> 병가
							<option value=""> 기타
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
   	</table><br><br>
휴가 사유 : <textarea value="사유"></textarea><br><br>
<hr>
<input type="button" value="신청완료"/>
</h1>
<br><br><br>
<jsp:include page="details.jsp"></jsp:include>
</body>
	<script>
		document.getElementById('datetime').value= new Date().toISOString().slice(0, 16);
	</script>
</html>