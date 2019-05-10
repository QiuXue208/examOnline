<%@ page language="java" contentType="text/html; UTF-8"
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

	String username = chStr.chStr(request.getParameter("username"));
	String password = chStr.chStr(request.getParameter("password"));
	String email = chStr.chStr(request.getParameter("email"));
	String truename = chStr.chStr(request.getParameter("truename"));
	String tel = chStr.chStr(request.getParameter("tel"));		
     
	if(user.equals("teacher")){
		String level = chStr.chStr(request.getParameter("level"));
		String teacherSql = "update teacher set username = '" + username 
				+ "' ,password = '" + password 
				+ "' ,truename = '" + truename
				+ "' ,email = '" + email 
				+ "' ,phone_number = '" + tel
				+ "' ,level = '" + level	
				+ "' where id = " + id;
		int result = conn.executeUpdate(teacherSql);
		out.println(result);
		if(result != 0){
			response.sendRedirect("../manager/management_teacher.jsp");
		}
	}
	if(user.equals("student")){
	    String gradeStr = chStr.chStr(request.getParameter("grade"));
	    String classStr = chStr.chStr(request.getParameter("class"));
		int grade = Integer.parseInt(gradeStr.substring(1));
		int classes = Integer.parseInt(classStr.substring(0,classStr.indexOf("班")));

		String studentSql = "update student set username = '" + username 
				+ "' ,password = '" + password 
				+ "' ,truename = '" + truename
				+ "' ,email = '" + email 
				+ "' ,phone_number = '" + tel
				+ "' ,class = " + classes
				+ " ,grade = " + grade	
				+ "where id = " + id;
		int result = conn.executeUpdate(studentSql);
		if(result != 0){
			response.sendRedirect("../manager/management_student.jsp?grade="+session.getAttribute("grade")+"&class="+session.getAttribute("class"));
		}
	}	
%>