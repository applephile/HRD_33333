<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
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
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = " SELECT SNO, SNAME, " 
						+ " SUBSTR(SNO, 1, 1) hak, "
						+ " SUBSTR(SNO, 2, 2) ban, "
						+ " SUBSTR(SNO, 4, 2) num, "
						+ " DECODE(SGENDER, 'M', '남', 'F', '여') SGENDER, "
						+ " SPHONE, "
						+ " SADDRESS "
					+ " FROM student_tbl_03 ";
			rs = stmt.executeQuery(sql);
		
	%>
	<section>
		<h2>학생목록</h2>
		
		<form>
			<table>
				<tr>
					<td>학번</td>
					<td>이름</td>
					<td>학년</td>
					<td>반</td>
					<td>번호</td>
					<td>성별</td>
					<td>전화번호</td>
					<td>주소</td>
				</tr>
				
				<%
					while(rs.next()) {
						
					
				%>
				<tr>
					<td><%=rs.getString("sno") %></td>
					<td><%=rs.getString("sname") %></td>
					<td><%=rs.getString("hak") %></td>
					<td><%=rs.getString("ban") %></td>
					<td><%=rs.getString("num") %></td>
					<td><%=rs.getString("sgender") %></td>
					<td><%=rs.getString("sphone") %></td>
					<td><%=rs.getString("saddress") %></td>
				</tr>
				
				<%
					}
				
					} catch(Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</form>
	</section>	
			
	<jsp:include page="footer.jsp"/>
</body>
</html>