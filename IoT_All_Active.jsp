<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript">

</SCRIPT>

</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import="java.net.URLDecoder"%>

<%
 request.setCharacterEncoding("UTF-8");
 String id = request.getParameter("id");
 String rate = request.getParameter("rate");
%>

<%    
        String driverName = "org.gjt.mm.mysql.Driver";
        String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";

        Class.forName(driverName);
        Connection conn = DriverManager.getConnection(dbURL,"hong","ekfvoddl");
        PreparedStatement pstmt = null;
        Statement stmt = conn.createStatement();
		if(rate.equals("high")){
       		String query = "UPDATE iot set iotstatus=1 where id='"+id+"';";
        	out.print("수행한 쿼리 : "+query);
        	pstmt = conn.prepareStatement(query);
        	pstmt.executeUpdate();
		}
		else if(rate.equals("middle")){
	        String query = "UPDATE iot set iotstatus=1 where id='"+id+"' ;";
	        out.print("수행한 쿼리 : "+query);
	        pstmt = conn.prepareStatement(query);
	        pstmt.executeUpdate();			
	        query = "UPDATE iot set iotstatus=0 where id='"+id+"' and type='현관문' ;";
	        out.print("수행한 쿼리 : "+query);
	        pstmt = conn.prepareStatement(query);
	        pstmt.executeUpdate();
		}
		else if(rate.equals("low")){
	        String query = "UPDATE iot set iotstatus=0 where id='"+id+"';";
	        out.print("수행한 쿼리 : "+query);
	        pstmt = conn.prepareStatement(query);
	        pstmt.executeUpdate();					
		}
        pstmt.close();
        conn.close();
  
%>

</body>
</html>
