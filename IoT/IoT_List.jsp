<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.json.simple.*" %>

<%
   String id = request.getParameter("id");
      try {
    	  request.setCharacterEncoding("utf-8");

         String driverName = "org.gjt.mm.mysql.Driver";
          String dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";

          Class.forName(driverName);
          Connection conn = DriverManager.getConnection(dbURL,"****","*****");
          Statement stmt = conn.createStatement();
         
         String strSQL = "SELECT iotname,iotnum,iotstatus,active FROM iot where id='" + id + "'";
         ResultSet rs = stmt.executeQuery(strSQL);
         
         JSONArray jsonArray;;
         ArrayList itemObjectList= new ArrayList();  
         while(rs.next()){  
             JSONObject jsonObject = new JSONObject();
             jsonObject.put("iotname",rs.getString("iotname"));
             jsonObject.put("iotnum",rs.getString("iotnum"));
             jsonObject.put("iotstatus",rs.getString("iotstatus"));
             jsonObject.put("active",rs.getString("active"));
             itemObjectList.add(jsonObject);
         }
         stmt.close();
         conn.close();
         
         out.print("{\"result\":");
         out.print(itemObjectList);
         out.print("}");
      } catch (Exception e) {
      } 
      
%>
