<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<section>
		<h2>성적입력</h2>
		
		<form method="post" action="insertProcess.jsp" name="frm">
			<table>
				<tr>
					<td align="center">학번</td>
					<td><input type="text" name="sno"/></td>
				</tr>
				<tr>
					<td align="center">국어점수</td>
					<td><input type="text" name="ekor" style="width: 80px;"/></td>
				</tr>
				<tr>
					<td align="center">수학점수</td>
					<td><input type="text" name="emath" style="width: 80px;"/></td>
				</tr>
				<tr>
					<td align="center">영어점수</td>
					<td><input type="text" name="eeng" style="width: 80px;"/></td>
				</tr>
				<tr>
					<td align="center">역사점수</td>
					<td><input type="text" name="ehist" style="width: 80px;"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록하기" onclick="return fn_submit()"/></td>
				</tr>
			</table>
		</form>
		
	</section>	
	<script src="check.js"></script>			
	<jsp:include page="footer.jsp"/>
</body>
</html>