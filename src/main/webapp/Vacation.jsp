<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>휴가 신청</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
		<link type="text/css" rel="stylesheet" href="css/sb-admin-2.min.css"/>
		<link type="text/css" rel="stylesheet" href="css/sb-admin-2.css"/>
		<!-- 아이콘 -->
		<link rel="stylesheet"
		    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>

<body>
	<div id="wrapper">
		<!-- sidebar 삽입 -->
		<%@ include file="inc/sidebar.jsp" %>
	
	<div id="content-wrapper" class="d-felx flex-column">
	
		<div id="content">
			<%@ include file="inc/topbar.jsp" %>
		</div>
	2023 (주)Acorn 인사팀 ${dto.name}사원, 사용연차현황
		<div class="container-fluid">
			<!-- 캘린더 -->
			<jsp:include page="calendar.jsp" flush="true"/>
			
			<!-- 페이지 Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">	
			<h1 class="h3 mb-0 text-gray-800">휴가신청</h1>
		</div>
		
		<div class="row">
			<div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4">
			
				<!-- header -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary"> 신청정보 </h6>
				</div>
			</div>
		</div>
		
			<div class="card-body">
		<form method="post" action="/HieVacation/vac">
				<input type="reset" value="신청취소"/>
			<!-- hidden 태그로 값 전달 -->
			<input type="hidden" name="command" value="CONFIRM"/>
	    <table>
	    	<tr>
		    	<td>휴가구분
		        	<select name="vacationtype">
							<option value="" > —선택— <!-- -선택- 눌렀을 때 정보 안 넘어오는거 예외처리 -->
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
	        	<td>휴가 기간
	        		<input type="date" name="startday" required/> ~
	        		<input type="date" name="endday" required/>
	        	</td>
	        	<td>신청일수 일</td>
	        </tr>
	      	<tr>
	        	<td>휴가 시작 / 종료시간
	        			<!-- 15분 단위로만 입력이 가능하게끔 -->
	            	<input type="time" name="starttime" value="09:00" 
	            				min="09:00" max="18:00" step="900"/> ~
	            	<input type="time" name="endtime" value="18:00" 
	            				min="09:00" max="18:00" step="900"/>
	            </td>
	            <td>신청시간
	            		<!-- 신청시간은 사용자가 별도로 입력 할 수 없다 -->
	            	<input type="time" id="currentTime" name="currentTime" 
	            		value="신청시간" style="width: 120px" readonly/>
	            </td>
	            <td>첨부 파일 : <input type="file"/></td>
             </tr>
	         <tr>
	            <td colspan='3'>휴가현황</td>
	         </tr>
	            <td colspan='3'>잔여휴가 0 일 0 시간</td>
	         </tr>
	         	<td colspan='3'>
	            (비고)사유 : <textarea name="reason" value="사유" placeholder="휴가 사유를 입력하세요." 
						style="resize:none; height: 80px; width:300px;"></textarea>
				</td>
   			</table>
   				<input type="submit" value="신청완료"/>
			</form> <!-- 휴가신청란 끝 -->
		</div>
			<br><br>
			<hr>
			<jsp:include page="application.jsp" />
		</div>
		</div>
	</div>
</div> <!-- End of wrapper -->
	<%@ include file="inc/footer.jsp" %> 

<!-- 	<script>
		function checkSelection() {
		    let selectElement = document.getElementById("vacationtype");
		    let selectedValue = selectElement.value;

		    if (selectedValue === "") {
		        alert("올바른 휴가 유형을 선택하세요.");
		    }
		}
	</script> -->
		<!-- Bootstrap -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/bootstarp.min.js"></script>
		<script type="text/javascript" src="js/sb-admin-2.min.js"></script>
		<script type="text/javascript" src="js/sb-admin-2.js"></script>
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
            /*
            // 휴가 시작날을 현재 날짜 +7
            document.getElementById('startday').valueAsDate = new Date();
            
            var today = new Date();
            
            // 7일 후의 날짜 계산
            var nextWeek = new Date(today);
            nextWeek.setDate(today.getDate() + 7);
            
            // 날짜를 yyyy-mm-dd 형식으로 변환
            var year = nextWeek.getFullYear();
            var month = String(nextWeek.getMonth() + 1).padStart(2, '0');
            var day = String(nextWeek.getDate()).padStart(2, '0');
            var formattedDate = year + '-' + month + '-' + day;
            
            // 날짜 입력 필드의 값 설정
            document.querySelector('input[name="startday"]').value = formattedDate; */
    </script>
</body>
</html>