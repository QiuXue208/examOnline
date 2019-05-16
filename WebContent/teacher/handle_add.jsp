<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>

<%
	String type = request.getQueryString().split("[=]")[1];	
	//公共变量
	String title = chStr.chStr(request.getParameter("title"));
	String answer = chStr.chStr(request.getParameter("answer"));
	String analysis = chStr.chStr(request.getParameter("analysis"));
	if(type.equals("selection")){
		ResultSet rs = conn.executeQuery("select ID from selection");
		int sum = 0;
		while(rs.next()){
			sum ++;
		}
		int ID = sum + 1;		
		String option_one = chStr.chStr(request.getParameter("option_one"));
		String option_two = chStr.chStr(request.getParameter("option_two"));
		String option_three = chStr.chStr(request.getParameter("option_three"));
		String option_four = chStr.chStr(request.getParameter("option_four"));
		String sql = "insert into selection (ID,title,option_one,option_two,option_three,option_four,answer,analysis) values ("
					+ ID
					+ ",'" + title
					+ "','" + option_one
					+ "','" + option_two
					+ "','" + option_three
					+ "','" + option_four
					+ "','" + answer
					+ "','" + analysis
					+ "')";
		int result = conn.executeUpdate(sql);
		if(result != 0){
			out.print("<script language='javascript'>alert('信息添加成功-_-');window.location.href='./exam_selection.jsp?type=selection'</script>");
		}else{
			out.print("<script language='javascript'>alert('您的操作有误-_-');window.location.href='./exam_selection.jsp?type=selection'</script>");
		}
	}
	if(type.equals("judgement")){
		ResultSet rs = conn.executeQuery("select ID from judgement");
		int sum = 0;
		while(rs.next()){
			sum ++;
		}
		int ID = sum + 1;		

		String sql = "insert into judgement (ID,title,answer,analysis) values ("
					+ ID
					+ ",'" + title
					+ "','" + answer
					+ "','" + analysis
					+ "')";
		int result = conn.executeUpdate(sql);
		if(result != 0){
			out.print("<script language='javascript'>alert('信息添加成功-_-');window.location.href='./exam_judgement.jsp?type=judgement'</script>");
		}else{
			out.print("<script language='javascript'>alert('您的操作有误-_-');window.location.href='./exam_judgement.jsp?type=judgement'</script>");
		}
	}
%>