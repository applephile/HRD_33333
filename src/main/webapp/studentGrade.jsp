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
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int korSum = 0, mathSum = 0, engSum = 0, histSum = 0;
	float totalSum = 0.0f, avgSum = 0.0f;
	int cnt = 0;
	
	try {
		conn = JDBConnection.getConnection();
		stmt = conn.createStatement();
		
		String sql = "SELECT  substr(s.sno, 1, 1) hak, "
				+ " substr(s.sno, 2, 2) ban, "
				+ " substr(s.sno, 4, 2) num, "
				+ " s.sname sname, e.ekor ekor, "
				+ " e.emath emath, e.eeng eeng, "
				+ " e.ehist ehist, "
				+ " (e.ekor+e.emath+e.eeng+e.ehist) sum, "
				+ " ((e.ekor+e.emath+e.eeng+e.ehist)/4) avg, "
				+ " DECODE(e.ekor, null, '', DENSE_RANK() over (order by (e.ekor+e.emath+e.eeng+e.ehist) desc nulls last)) rank "
				+ " FROM student_tbl_03 s left join exam_tbl_03 e "
				+ " on s.sno = e.sno ";
		
		rs = stmt.executeQuery(sql);
	
%>
<section>
	<h2>학생성적</h2>
	
	<form>
		<table>
			<tr>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>이름</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>순위</td>
			</tr>
			
			<%
				while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("hak") %></td>			
				<td><%=rs.getString("ban") %></td>			
				<td><%=rs.getString("num") %></td>			
				<td><%=rs.getString("sname") %></td>
				<% if(rs.getString("ekor") != null) {
					cnt+=1;
				%>			
				<td><%=rs.getString("ekor") %></td>			
				<td><%=rs.getString("emath") %></td>			
				<td><%=rs.getString("eeng") %></td>			
				<td><%=rs.getString("ehist") %></td>			
				<td><%=rs.getString("sum") %></td>			
				<td><%=rs.getString("avg") %></td>			
				<td><%=rs.getString("rank") %></td>	
				<%
					korSum += Integer.parseInt(rs.getString("ekor"));
					mathSum += Integer.parseInt(rs.getString("emath"));
					engSum += Integer.parseInt(rs.getString("eeng"));
					histSum += Integer.parseInt(rs.getString("ehist"));
					totalSum += Integer.parseInt(rs.getString("sum"));
					avgSum += Float.parseFloat(rs.getString("avg"));
				%>
				<%} else {%>
				<td></td>		
				<td></td>		
				<td></td>		
				<td></td>		
				<td></td>		
				<td></td>		
				<td></td>		
				<%} %>		
			</tr>
			<%
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			%>
			<tr>
				<td colspan="4">총합</td>
				<td><%=korSum %></td>
				<td><%=mathSum %></td>
				<td><%=engSum %></td>
				<td><%=histSum %></td>
				<td><%=totalSum %></td>
				<td><%=avgSum %></td>
			</tr>
			<tr>
				<td colspan="4">총평균</td>
				<td><%=korSum/cnt %></td>
				<td><%=mathSum/cnt %></td>
				<td><%=engSum/cnt %></td>
				<td><%=histSum/cnt %></td>
				<td><%=totalSum/cnt %></td>
				<td><%=avgSum/cnt %></td>
			</tr>
		</table>
	</form>
	
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>