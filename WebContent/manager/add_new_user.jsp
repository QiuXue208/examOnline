<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="query" scope="page" class="tools.GetQueryPara"></jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>

<%
	String user = query.getQueryPara(request.getQueryString())[0];
// 	int id = Integer.parseInt(query.getQueryPara(request.getQueryString())[1]);
	
	String username = chStr.chStr(request.getParameter("username"));
	String password = chStr.chStr(request.getParameter("password"));
	String email = chStr.chStr(request.getParameter("email"));
	String truename = chStr.chStr(request.getParameter("truename"));
	String tel = chStr.chStr(request.getParameter("tel"));
	
	if(user.equals("teacher")){
		String level = chStr.chStr(request.getParameter("level"));
		int id = Integer.parseInt(username.substring(1));
		String teacherStr = "insert into teacher (ID,t_username,password,truename,email,phone_number,level) values ("
							+ id
							+ ",'" + username
							+ "','" + password
							+ "','" + truename
							+ "','" + email
							+ "','" + tel
							+ "','" + level
							+ "')";

		int result = conn.executeUpdate(teacherStr);
		if(result != 0){
			response.sendRedirect("../manager/management_teacher.jsp");
		}
	}
	if(user.equals("student")){
		String gradeStr = chStr.chStr(request.getParameter("grade"));
	    String classStr = chStr.chStr(request.getParameter("class"));
		int grade = Integer.parseInt(gradeStr);
		int classes = Integer.parseInt(classStr);
		int id = Integer.parseInt(username.substring(1));
		String teacherStr = "insert into student (ID,s_username,password,truename,email,phone_number,class,grade,score) values ("
							+ id
							+ ",'" + username
							+ "','" + password
							+ "','" + truename
							+ "','" + email
							+ "','" + tel
							+ "'," + classes
							+ "," + grade
							+ "," + 0
							+ ")"; 

		int result = conn.executeUpdate(teacherStr);
		if(result != 0){
			response.sendRedirect("../manager/management_student.jsp?grade="+grade+"&class="+classes);
		}
	}
%>