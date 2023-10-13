<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청내역</title>
</head>
<body>
	<h1>신청내역</h1>
	
		<div>
			<input type="button" value="삭제"/>
		</div>
		
	<table border="1">
		<tr>
			<th>No</th>
			<th><input type="checkbox"></th>
			<th>부서</th>
			<th>이름</th>
			<th>근태 구분 </th>
			<th>신청 기간</th>
			<th>시간</th>
			<th>신청 일수</th>
			<th>신청 시간</th>
			<th>사유</th>
       	</tr>
       	<c:forEach var="dto" items="${vacList}" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td><input type="checkbox" name="selectbox"></td>
            <td>
                <!-- 부서 정보 출력 -->
               	${dto.department}
            </td>
            <td>
                <!-- 이름 정보 출력 -->
               	${dto.name}
            </td>
            <td>
                <!-- 근태 구분 정보 출력 -->
                ${dto.vacationtype}
            </td>
            <td>
                <!-- 기간 정보 출력 -->
                ${dto.startday} ~ ${dto.endday}
            </td>
            <td>
                <!-- 시간 정보 출력 -->
                ${dto.starttime} ~ ${dto.endtime}
            </td>
            <td>
                <!-- 일수 정보 출력 -->
                ${dto.numberofdays}
            </td>
            <td>
                <!-- 신청 시간 정보 출력 -->
                <c:out value="${dto.currentTime}" />
            </td>
            <td>
                <!-- 사유 정보 출력 -->
                ${dto.reason}
            </td>
       	</tr>
     	 </c:forEach>
    </table>
	<br>
	<form method="post" action="/HieVacation/vac">
		<input type="hidden" name="command" value="RETURN" />
		<input type="submit" value="신청완료" />
	</form>
</body>
</html>