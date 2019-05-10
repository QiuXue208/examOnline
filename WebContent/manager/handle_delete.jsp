<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<jsp:useBean id="query" scope="page" class="tools.GetQueryPara"/>
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>

<%
	String user = query.getQueryPara(request.getQueryString())[0];
	int id = Integer.parseInt(query.getQueryPara(request.getQueryString())[1]);
	
	if(user.equals("teacher")){
		String deleteSql = "delete from teacher where id =" + id;
		int result = conn.executeUpdate(deleteSql);
		response.sendRedirect("../manager/management_teacher.jsp");
	}
	if(user.equals("student")){
		String deleteSql = "delete from student where id =" + id;
		int result = conn.executeUpdate(deleteSql);
		response.sendRedirect("../manager/management_student.jsp?grade="+session.getAttribute("grade")+"&class="+session.getAttribute("class"));
	}
	
	
%>