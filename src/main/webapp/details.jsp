<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 내역</title>
</head>
<body>
<h1>신청내역</h1><input type="button" value="삭제"/>
<hr/>
	<table border="1">
		<tr>
			<th>No</th>
			<th><input type="checkbox" name="selectbox"></th>
			<th>부서</th>
			<th>이름</th>
			<th>근태 구분 </th>
			<th>신청 기간</th>
			<th>시간</th>
			<th>신청 일수</th>
			<th>신청 시간</th>
			<th>연차 차감</th>
			<th>사유</th>
       </tr>
       		<td>0</td>
       		<td><input type="checkbox" name="selectbox"></td>
	       	<td>
	       		
	       	</td>
	       	<td></td>
	       	<td>
		       	<%
				String type = request.getParameter("vacationType");
				%>
	       		<%= type%>
	       	</td>
	       	<td></td>
	       	<td></td>
	       	<td></td>
	       	<td><% 
	       		String currentTime = request.getParameter("currentTime"); 
	       		%>
	       		<%= currentTime%></td>
	       	<td></td>
	       	<td>
	       		<% 
	       		String reason = request.getParameter("reason"); 
	       		%>
	       		<%= reason%>
	       	</td>
    </table>
    <form>
		<input type="submit" value="신청 완료" />&nbsp;&nbsp;&nbsp;
		<input type="button" value="뒤로" />
	</form>
</body>
</html>