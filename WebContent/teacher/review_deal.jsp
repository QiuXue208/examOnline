<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connR" scope="page" class="tools.ConnDB" />
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>
<%
	String queryUser = request.getQueryString().substring(5);
	int [] shortsScore = new int[8];
	int short5Score = 0;
	int short10Score = 0;
	int short15Score = 0;
	int allScore = 0;
	int selectionScore = 0;
	int judgementScore = 0;
	for(int i=0;i<8;i++){
		shortsScore[i] = Integer.parseInt(request.getParameter("short"+(i+1)));
		if(i<5){
			short5Score += shortsScore[i];
		}else if(i<7){
			short10Score += shortsScore[i];
		}else if(i<8){
			short15Score += shortsScore[i];
		}
	}
	String selectSql = "select * from score where [user] = '" + queryUser + "'";
	ResultSet rs1 = connR.executeQuery(selectSql);
	while(rs1.next()){
		selectionScore = rs1.getInt("selection_score");
		judgementScore = rs1.getInt("judgement_score");
	}
	allScore = selectionScore + judgementScore + short5Score + short10Score + short15Score;
	String updateSql = "update score set all_score="
					+ allScore +",short_5_score="
					+ short5Score +",short_10_score="
					+ short10Score + ",short_15_score="
					+ short15Score + ",complete=" + 1
					+"where [user]='" + queryUser + "'";
	int result = connR.executeUpdate(updateSql);
	if(result!=0){
		out.println("<script language='javascript'>alert('批阅成功');window.location.href='./management_score.jsp?condition=users&grade=1&class=1'</script>");
	}
	
	
	
%>