<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.json.simple.*" %>

<%
String id = request.getParameter("id");
   //추가 내용 => 로그인한 아이디값 정보 get parameter로 가져오기 
    request.setCharacterEncoding("UTF-8");                           
    String jdbcUrl = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone"; // MySQL 계정 "jdbc:mysql://localhost:3306/DB이름"
    String dbId = "****"; // MySQL 계정 "로컬일 경우 root"
    String dbPw = "******"; // 비밀번호 "mysql 설치 시 설정한 비밀번호"
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";
   
      try {
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
         sql = "select * from user_member where id='"+id+"' order by authority asc";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         JSONArray jsonArray;;
         ArrayList itemObjectList= new ArrayList();  
         while(rs.next()){  
             JSONObject jsonObject = new JSONObject();
             jsonObject.put("name",rs.getString("membername"));
             jsonObject.put("authority",rs.getString("authority"));
             jsonObject.put("password",rs.getString("pass"));
             jsonObject.put("enter",rs.getString("enter"));
       
             itemObjectList.add(jsonObject);
         }
         out.print("{\"result\":");
         out.print(itemObjectList);
         out.print("}");
      } catch (Exception e) {
    	  out.print(e);
      } finally {if (rs != null)try {rs.close();} catch (SQLException ex) {}
         if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
         if (conn != null)try {conn.close();} catch (SQLException ex) {}
      }
%>
