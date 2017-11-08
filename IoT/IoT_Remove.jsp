
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");

   String iotnum = request.getParameter("iotnum");
   String jdbcUrl = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";
   String dbId = "****"; 
   String dbPw = "*****"; 
       Connection conn = null;
       PreparedStatement pstmt = null;
       String sql = "";
       String returns = "";
       
         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
            sql = "delete from iot where iotnum='"+iotnum+"'";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();

         } catch (Exception e) {
            out.print(e+"");
         } finally {
            if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
            if (conn != null)try {conn.close();} catch (SQLException ex) {}
         }
      
         out.print(returns);
      
 
%>
