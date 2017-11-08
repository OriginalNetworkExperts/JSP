
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
   String name = request.getParameter("name");
   String authority = request.getParameter("authority");
   String password = request.getParameter("password");
   String enter = "출입";
       String jdbcUrl = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";
       String dbId = "****"; // MySQL 계정 "로컬일 경우 root"
       String dbPw = "*****"; // 비밀번호 "mysql 설치 시 설정한 비밀번호"
       Connection conn = null;
       PreparedStatement pstmt = null;
       String sql = "";
       String returns = "";
       

         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
            sql = "insert into user_member(id,membername,authority,pass,enter) values('"+id+"','"+name+"','"+authority+"','"+password+"','"+enter+"');";
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
