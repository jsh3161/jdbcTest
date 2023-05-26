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
	<h2>회원 명단 리스트</h2>
	<hr>
	<%
		String sql="SELECT * FROM members";
	
		
		
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb";//기본 데이터베이스(mysql) 접속 주소
		String username = "root";//mysql 계정 아이디
		String password = "12345";//mysql 계정 비밀번호
		
		Connection conn = null; 
		Statement stmt = null;
		//int successFlag = 0;
		ResultSet rs = null;  // select문 실행시 DB에서 반환해주는 데이터를 받아주기위한 객체
		
		try {
			Class.forName(driverName);//jdbc 드라이버 불러오기
			
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql); // select문은 쿼리로 -> 실행 결과를 Resultset 객체로 받음
			//successFlag = stmt.executeUpdate(sql);//sql문 실행->성공 1을 반환
			
			while(rs.next()) {
				String dbid = rs.getString("id");//레코드의 id필드 값 가져오기
				String dbpw = rs.getString("passwd");
				String dbemail = rs.getString("email");
				String dbsigntime = rs.getString("signuptime");
				
				out.println(dbid + "/" + dbpw + "/" + dbemail + "/" + dbsigntime + "<br>");
			}
	
		} catch(Exception e) {
			e.printStackTrace();//에러의 내용 출력
		
		} finally {
			rs.close();
			stmt.close();//statment 닫아주기
			conn.close();//connection 닫아주기	
		}
	%>
</body>
</html>