<%@ page language="java" contentType="application/json; charset=EUC-KR" pageEncoding="EUC-KR" import = "java.sql.*" import="java.net.URLDecoder" trimDirectiveWhitespaces="true"%>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import = "org.json.simple.*" %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import="com.google.android.gcm.server.*"%>
<%request.setCharacterEncoding("UTF-8");
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

%>

<%
/*
ArrayList<String> token = new ArrayList<String>();//token값을 ArrayList에 저장
String MESSAGE_ID = String.valueOf(Math.random() % 100 + 1);//메시지 고유 ID
boolean SHOW_ON_IDLE = false;//옙 활성화 상태일때 보여줄것인지
int LIVE_TIME = 1;//옙 비활성화 상태일때 FCM가 메시지를 유효화하는 시간
int RETRY = 2;//메시지 전송실패시 재시도 횟수

String simpleApiKey = "AAAApAfviAk:APA91bHNaPXk5ylz2ClHOylSqJx23Bt3-BPIH-onrc_pEyGylPXGV1kIXPFz38XWYLn2awWiwzFhOH9jmmxHzHp0Xnl-GaMphOxPxQhJNhyXQukc0fQ6HokBN3PdrXSnVB99Ls_eFZg3";
String gcmURL = "https://android.googleapis.com/fcm/send";
String msg = "WARNING";//request.getParameter("message");;
String tokencheck;

if(msg==null || msg.equals("")){
	msg="";
	}
	msg = new String(msg.getBytes("EUC-KR"), "EUC-KR");//메시지 한글깨짐 처리

	try {

        driverName = "org.gjt.mm.mysql.Driver";
        dbURL = "jdbc:mysql://onedbinstance2.cemltpez1xh9.ap-northeast-2.rds.amazonaws.com/allinone";

        Class.forName(driverName);
        conn = DriverManager.getConnection(dbURL,"hong","ekfvoddl");
        stmt = conn.createStatement();
       //String strSQL = "SELECT * from users where id = '"+id+"'"; 아이디 구분
       strSQL = "SELECT * from users"; //일단 다보냄
       rs = stmt.executeQuery(strSQL);
		
		//모든 등록ID를 리스트로 묶음
		while(rs.next()){
			token.add(rs.getString("Token"));
			out.print(rs.getString("Token"));
		}
		stmt.close();
		conn.close();

		Sender sender = new Sender(simpleApiKey);
		Message message = new Message.Builder()
				.collapseKey(MESSAGE_ID)
				.delayWhileIdle(SHOW_ON_IDLE)
				.timeToLive(LIVE_TIME)
				.addData("message",msg)
				.build();
		MulticastResult result1 = sender.send(message,token,RETRY);
		if (result1 != null) {
			List<Result> resultList = result1.getResults();
			for (Result result : resultList) {
			System.out.println(result.getErrorCodeName());
			}
		}
	}catch(Exception e) {
		e.printStackTrace();
		}
	*/
%>
