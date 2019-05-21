<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="chStr" scope="page" class="tools.chStr"></jsp:useBean>
<jsp:useBean id="connDB" scope="page" class="tools.ConnDB"></jsp:useBean>
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>
<%
try{
	String username = chStr.chStr(request.getParameter("username"));
	String password= chStr.chStr(request.getParameter("password"));
	String name = chStr.chStr(request.getParameter("name"));
	String email = chStr.chStr(request.getParameter("email"));
	String phone_number = chStr.chStr(request.getParameter("phone"));
	int classes = Integer.parseInt(chStr.chStr(request.getParameter("class")));
	int grade = Integer.parseInt(chStr.chStr(request.getParameter("grade")));
	String updateSql = "update student set s_username = '" + username 
			+ "' ,password = '" + password
			+ "' ,truename = '" + name 
			+ "' ,email = '" + email
			+ "' ,phone_number = '" + phone_number 
			+ "' ,class = " + classes
			+ " ,grade = " + grade
			+ " where s_username = '" + (String)session.getAttribute("username")
			+ "' and password = '" + (String)session.getAttribute("password")
			+ "'";
// 	out.println(updateSql);
	int result = 0;
	result = connDB.executeUpdate(updateSql);
	session.setAttribute("username",username);
	session.setAttribute("password",password);
	if(result != 0){
		out.print("<script language='javascript'>alert('信息修改成功-_-');window.location.href='./index.jsp'</script>");
	}else{
		out.print("<script language='javascript'>alert('您的操作有误-_-');window.location.href='./index.jsp'</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误')</script>");
}
%>
