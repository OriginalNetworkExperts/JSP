<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
int iotstatus  = Integer.parseInt(request.getParameter("iotstatus"));
String iotnum = request.getParameter("iotnum");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";


Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"****","*****");
Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;

pstmt = conn.prepareStatement("UPDATE iot SET iotstatus=? WHERE iotnum=?");
pstmt.setInt(1, iotstatus);
pstmt.setString(2, iotnum);
pstmt.executeUpdate();

if(iotstatus==0) {
	pstmt = conn.prepareStatement("UPDATE iot SET active='0' WHERE iotnum=?");
	pstmt.setString(1, iotnum);
	pstmt.executeUpdate();
}

pstmt.close();
conn.close();

%>
