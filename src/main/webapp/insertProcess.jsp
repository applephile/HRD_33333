<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement psmt = null;
	int result = 0;
	
	String sno = request.getParameter("sno");
	String ekor = request.getParameter("ekor");
	String emath = request.getParameter("emath");
	String eeng = request.getParameter("eeng");
	String ehist = request.getParameter("ehist");
	
	try {
		conn = JDBConnection.getConnection();
		
		String sql = "insert into exam_tbl_03 "
					+ " values(?, ?, ?, ?, ?) ";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, sno);
		psmt.setString(2, ekor);
		psmt.setString(3, emath);
		psmt.setString(4, eeng);
		psmt.setString(5, ehist);
		
		result = psmt.executeUpdate();
		
		response.sendRedirect("studentList.jsp");
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
    