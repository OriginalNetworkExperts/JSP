<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<%
String id = request.getParameter("id");
String sql = "";
String token = "";
String requestMethod = "";
token = request.getParameter("Token");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"****","*****");
PreparedStatement pstmt = null;
Statement stmt = conn.createStatement();

if(token.equals("")) {
	out.println("토큰값이 전달되지 않았습니다.");
}else {
	//토큰값 전달시 쿼리문 입력할곳
	sql = "insert into users(id,Token) values('"+id+"','"+token+"');";
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
}
pstmt.close();
conn.close();
%>

</body>
</html>
