<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%

	int check = 0;

   request.setCharacterEncoding("UTF-8");
   String id = "test";//request.getParameter("id");
   String name = request.getParameter("name");
   String enter = request.getParameter("enter");
   
       String jdbcUrl = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";
       String dbId = "hong"; 
       String dbPw = "ekfvoddl"; 
       Connection conn = null;
       PreparedStatement pstmt = null;
       String sql = "";
       String returns = "";

         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
            sql = "update user_member set enter='"+enter+"' where id='"+id+"' and membername='"+name+"' ";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();

         } catch (Exception e) {
            out.print(e+"");
         } finally {
            if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
            if (conn != null)try {conn.close();} catch (SQLException ex) {}
			response.sendRedirect("iot_allactive.jsp?id="+id);            
         }
         
         /*
        String driverName = "org.gjt.mm.mysql.Driver";
        String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";

        Class.forName(driverName);
        Connection conn1 = DriverManager.getConnection(dbURL,"hong","ekfvoddl");
        Statement stmt = conn1.createStatement();
        String strSQL = "SELECT enter from user_member where id = '"+id+"' and enter='1'";
        ResultSet rs = stmt.executeQuery(strSQL);
        if(!rs.next()) {
         	check = 1;
         }
         rs.close();
         stmt.close();
         
        
/*
         String strSQL = "SELECT enter from user_member where id = '"+id+"' and enter='1'";
         ResultSet rs = stmt.executeQuery(strSQL);
         
         if(!rs.next()) {
         	check = 1;
         }
         rs.close();
         stmt.close();
         
         if(check = 1) {
         	sql = "update iot set iotstatus='1' where id='"+id+"'";
         	pstmt = conn.prepareStatement(sql);
         	pstmt.executeUpdate();
         }
*/

      
      
   
%>
