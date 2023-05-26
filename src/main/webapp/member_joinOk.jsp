<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("userid");
		String upw = request.getParameter("userpw");
		String uemail = request.getParameter("email");
		
		String sql = "INSERT INTO members (id, passwd, email) VALUES ('"+uid+"','"+upw+"','"+uemail+"')";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb"; //기본 데이터베이스 접속 주소
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		Class.forName(driverName); // jdbc 드라이버 불러오기
		
		conn = DriverManager.getConnection(url, username, password); // DB 연동
		
		Statement stmt = conn.createStatement();
		
		stmt = conn.createStatement();
		
		int successFlag = stmt.executeUpdate(sql);
		
		if(successFlag == 1) {
			out.println("회원 가입 성공"+successFlag);
		} else {
			out.println("회원 가입 실패"+successFlag);
		}
		
		stmt.close(); // statement 닫아주기
		conn.close(); // connection 닫아주기
	%>
	
</body>
</html>