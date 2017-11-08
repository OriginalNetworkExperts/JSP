
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
   String name = request.getParameter("name");
                                         
   String jdbcUrl = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";
   String dbId = "****"; 
   String dbPw = "*****"; 
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       String sql = "";
       String returns = "";
      

         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
            sql = "select membername from user_member where id=? and membername=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
          
            rs = pstmt.executeQuery();
            if (rs.next()) {
               returns = "fail";
            } else {
               returns = "no";
            }
            
         

         } catch (Exception e) {

         } finally {if (rs != null)try {rs.close();} catch (SQLException ex) {}
            if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
            if (conn != null)try {conn.close();} catch (SQLException ex) {}
         }
      
         out.print(returns);
      
   
%>
