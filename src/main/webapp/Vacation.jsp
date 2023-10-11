<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
<style>
    table {
        border-collapse: collapse; /* 테두리를 겹치게 함 */
        width: 100%; /* 테이블 너비를 100%로 설정 */
    }
    /* th, td {
        border: 1px solid black; /* 테두리 스타일과 두께를 지정 
        padding: 5px; /* 셀 내부 여백 설정 
    } */
</style>
</head>
<body>
<!-- 인사관리에서 로그인 정보 가져오기 autouser -->
2023 (주)Acorn 인사팀 ㅇㅇㅇ사원, 사용연차현황<br><br><br>
<h1>휴가신청</h1>
신청정보<hr/>
<input type="reset" value="신청취소"/>
	<form action="details.jsp"/>
	<input type="hidden" name="command" value="CONFIRM"/>
    <table>
    	<tr>
        <td>휴가구분
        	<select name="vacationType">
          	<!-- -선택- 눌렀을 때 정보 안 넘어오는거 예외처리 -->
					<option value="" > —선택—
					<option value="월차"> 월차
					<option value="반차"> 반차
					<option value="연차"> 연차
					<option value="경조휴가"> 경조휴가
					<option value="병가"> 병가
					<option value="기타"> 기타
			</select>
	           </td>
         </tr>
        <tr>
        	<td>휴가기간 일 시간</td>
        	<td>신청일수 일</td>
        </tr>
      	<tr>
        	<td>시작/종료시간
            	<input type="time" name="startTime" value="09:00" min="09:00" max="18:00" step="900"/> ~
            	<input type="time" name="endTime" value="18:00" min="09:00" max="18:00" step="900"/>
            </td>
            <td>신청시간
            	<input type="time" id="currentTime" name="currentTime" value="신청시간" 
            		style="width: 120px" readonly/>
            </td>
            <td>파일 업로드 : <input type="file"/></td>
            </tr>
         <tr>
            <td>휴가현황</td>
          </tr>
            <td>잔여휴가 0 일 0 시간</td>
      </tr>
   	</table><br><br>
	(비고)사유 : <textarea name="reason" value="사유" placeholder="휴가 사유를 입력하세요." 
				style="resize:none; height: 80px; width:300px;"></textarea>
	<input type="submit" value="신청완료"/>
	</form>
<br><br>
<hr>

</h1>
<br><br><br>
<%-- <jsp:include page="details.jsp"></jsp:include> --%>
</body>
<!-- 	<script>
		function checkSelection() {
		    let selectElement = document.getElementById("vacationtype");
		    let selectedValue = selectElement.value;

		    if (selectedValue === "") {
		        alert("올바른 휴가 유형을 선택하세요.");
		    }
		}
	</script> -->
	<script>
            // 현재 시간을 가져오는 함수
            function getCurrentTime() {
                var now = new Date();
                var hours = now.getHours().toString().padStart(2, '0'); // 시
                var minutes = now.getMinutes().toString().padStart(2, '0'); // 분
                return hours + ':' + minutes;
            }

            // 현재 시간을 input 요소에 설정
            document.addEventListener("DOMContentLoaded", function() {
                var timeInput = document.getElementById("currentTime");
                timeInput.value = getCurrentTime();
            });
    </script>
</html>