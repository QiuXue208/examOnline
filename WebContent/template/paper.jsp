<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connR" scope="page" class="tools.ConnDB" />

<%

	String queryUser = request.getQueryString().substring(5);	
	// 分别获取ID 、 用户答案 、 答案选项 、 题目
	int [] selectionsID = new int[10];
	String []usersAnswer = new String[10];
	
	int [] judgementsID = new int[10];
	String []userjAnswer = new String[10];
	
	int [] short5ID = new int[5];
	String [] userc5Answer = new String[5];
	
	int [] short10ID = new int[2];
	String [] userc10Answer = new String[2];
	
	int short15ID = 0;
	String userc15Answer = "";
	
	ResultSet rs = connR.executeQuery("select * from question_selection where [user]='"+queryUser +"'");
	while(rs.next()){
		for(int i=0;i<10;i++){
			selectionsID[i] = rs.getInt("s"+(i+1)+"_ID");
		}
	}
	ResultSet rs11 = connR.executeQuery("select * from answer_selection where [user]='"+queryUser +"'");
	while(rs11.next()){
		for(int i=0;i<10;i++){
			usersAnswer[i] = rs11.getString("answer"+(i+1));
		}
	}
	ResultSet rs2 = connR.executeQuery("select * from question_judgement where [user]='"+queryUser +"'");
	while(rs2.next()){
		for(int i=0;i<10;i++){
			judgementsID[i] = rs2.getInt("j"+(i+1)+"_ID");
		}
	}
	ResultSet rs22 = connR.executeQuery("select * from answer_judgement where [user]='"+queryUser +"'");
	while(rs22.next()){
		for(int i=0;i<10;i++){
			userjAnswer[i] = rs22.getString("answer"+(i+1));
		}
	}
	ResultSet rs3 = connR.executeQuery("select * from question_short_5 where [user]='"+queryUser +"'");
	while(rs3.next()){
		for(int i=0;i<5;i++){
			short5ID[i] = rs3.getInt("c"+(i+1)+"_ID");
		}
	}
	ResultSet rs33 = connR.executeQuery("select * from answer_short_5 where [user]='"+queryUser +"'");
	while(rs33.next()){
		for(int i=0;i<5;i++){
			userc5Answer[i] = rs33.getString("answer"+(i+1));
		}
	}
	ResultSet rs4 = connR.executeQuery("select * from question_short_10 where [user]='"+queryUser +"'");
	while(rs4.next()){
		for(int i=0;i<2;i++){
			short10ID[i] = rs4.getInt("c"+(i+1)+"_ID");
		}
	}
	ResultSet rs44 = connR.executeQuery("select * from answer_short_10 where [user]='"+queryUser +"'");
	while(rs44.next()){
		for(int i=0;i<2;i++){
			userc10Answer[i] = rs44.getString("answer"+(i+1));
		}
	}
	ResultSet rs5 = connR.executeQuery("select * from question_short_15 where [user]='"+queryUser +"'");
	while(rs5.next()){
		short15ID = rs5.getInt("c1_ID");
	}
	ResultSet rs55 = connR.executeQuery("select * from answer_short_15 where [user]='"+queryUser +"'");
	while(rs55.next()){
		userc15Answer = rs55.getString("answer1");
	}

%>