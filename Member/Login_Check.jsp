
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   String pwd = request.getParameter("pw");
   
                                               
       String jdbcUrl = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone"; // MySQL 계정 "jdbc:mysql://localhost:3306/DB이름"
       String dbId = "****"; // MySQL 계정 "로컬일 경우 root"
       String dbPw = "******"; // 비밀번호 "mysql 설치 시 설정한 비밀번호"
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       String sql = "";
       String returns = "";
      

         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
            sql = "select * from user_info where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               if (rs.getString("id").equals(id) && rs.getString("pw").equals(pwd)) {
                  returns = "true";// 로그인 가능
               } else {
                  returns = "false"; // 로그인 실패
               }
            } else {
               returns = "noId"; // 아이디 또는 비밀번호 존재 X
            }
            if(id.equals("")){
               returns ="empty";
            }

         } catch (Exception e) {

         } finally {if (rs != null)try {rs.close();} catch (SQLException ex) {}
            if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
            if (conn != null)try {conn.close();} catch (SQLException ex) {}
         }
      
         out.print(returns);
      
%>
