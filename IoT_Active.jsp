<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.json.simple.*" %>

<%@ page import="com.google.android.gcm.server.*"%>
<%
request.setCharacterEncoding("UTF-8");
String iotnum = request.getParameter("iotnum");
String active = request.getParameter("active");
String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";
Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"hong","ekfvoddl");
Statement stmt = conn.createStatement();
String strSQL = "SELECT iotstatus FROM iot where iotnum='" + iotnum + "'";
ResultSet rs = stmt.executeQuery(strSQL);
if (rs.next()) {
	out.print(rs.getString("iotstatus"));
}

PreparedStatement pstmt = null;
pstmt = conn.prepareStatement("UPDATE iot SET active='"+active+"' WHERE iotnum='"+iotnum+"'");
pstmt.executeUpdate();

pstmt.close();
stmt.close();
conn.close();

/*
String active = request.getParameter("active");
String iotnum = request.getParameter("iotnum");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";


Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"hong","ekfvoddl");
Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;

pstmt = conn.prepareStatement("UPDATE iot SET active='"+active+"' WHERE iotnum='"+iotnum+"'");
pstmt.executeUpdate();

pstmt.close();
stmt.close();
conn.close();


if(active.equals("1")) {
	//response.sendRedirect("iot_push.jsp?iotnum"+iotnum);
	response.sendRedirect("push_notification.jsp");
}
*/


%>

