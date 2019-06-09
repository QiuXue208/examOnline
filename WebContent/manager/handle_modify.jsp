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
	int oldId = Integer.parseInt(query.getQueryPara(request.getQueryString())[1]);    

	String username = chStr.chStr(request.getParameter("username"));
	int newId = Integer.parseInt(username.substring(1));
	String password = chStr.chStr(request.getParameter("password"));
// 	String email = chStr.chStr(request.getParameter("email"));
	String truename = chStr.chStr(request.getParameter("truename"));
// 	String tel = chStr.chStr(request.getParameter("tel"));		
     
	if(user.equals("teacher")){
		String level = chStr.chStr(request.getParameter("level"));
		String teacherSql = "update teacher set ID = " + newId
				+ ",t_username = '" + username 
				+ "' ,password = '" + password 
				+ "' ,truename = '" + truename
// 				+ "' ,email = '" + email 
// 				+ "' ,phone_number = '" + tel
				+ "' ,level = '" + level	
				+ "' where id = " + oldId;
		int result = conn.executeUpdate(teacherSql);
		if(result != 0){
			out.print("<script>alert('修改成功！');window.location.href='../manager/management_teacher.jsp?user=teacher'</script>");
// 			response.sendRedirect("../manager/management_teacher.jsp?user=teacher");
		}
	}
	if(user.equals("student")){
		int grade = Integer.parseInt(chStr.chStr(request.getParameter("grade")));
		int classes = Integer.parseInt(chStr.chStr(request.getParameter("class")));

		String studentSql = "update student set ID = "+newId
				+ ",s_username = '" + username 
				+ "' ,password = '" + password 
				+ "' ,truename = '" + truename
				+ "' ,class = " + classes
				+ " ,grade = " + grade	
				+ "where id = " + oldId;
		int result = conn.executeUpdate(studentSql);
		if(result != 0){
			String url = "../manager/management_student.jsp?grade="+grade+"&class="+classes +"&user=student";
			out.print("<script language='javascript'>alert('信息修改成功！');window.location.href='"+url+"'</script>");
// 			response.sendRedirect("../manager/management_student.jsp?grade="+session.getAttribute("grade")+"&class="+session.getAttribute("class"));
		}
	}	
%>