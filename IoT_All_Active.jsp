<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
String id = request.getParameter("id");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"hong","ekfvoddl");
PreparedStatement pstmt = null;
Statement stmt = conn.createStatement();

String strSQL = "SELECT enter FROM user_member where id='" + id + "' and enter='출입'";
ResultSet rs = stmt.executeQuery(strSQL);
   
if(!rs.next()){
   pstmt = conn.prepareStatement("UPDATE iot SET iotstatus=1 where id='"+id+"'");
   pstmt.executeUpdate();
   pstmt.close();
}
rs.close();
stmt.close();
conn.close();

%>
