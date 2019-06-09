<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="chStr" scope="page" class="tools.chStr"></jsp:useBean>
<jsp:useBean id="conn_teacher" scope="page" class="tools.ConnDB"></jsp:useBean>
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>
<%
try{
	String username = chStr.chStr(request.getParameter("username"));
	String password = chStr.chStr(request.getParameter("password"));
	String truename = chStr.chStr(request.getParameter("name"));
	String email = chStr.chStr(request.getParameter("email"));
	String tel = chStr.chStr(request.getParameter("phone"));
	String level = chStr.chStr(request.getParameter("level"));
	ResultSet rs = conn_teacher.executeQuery("select * from teacher where t_username = '" + (String)session.getAttribute("username") + "'");
	while(rs.next()){
		if(username.equals(rs.getString(2))&&password.equals(rs.getString(3))&&truename.equals(rs.getString(4))&&email.equals(rs.getString(5))&&tel.equals(rs.getString(6))&&level.equals(rs.getString(7))){
			out.print("<script language='javascript'>alert('您未修改任何信息-_-');window.location.href='./index.jsp'</script>");
		}
	}
	String updateSql = "update teacher set t_username = '" + username 
			+ "' ,password = '" + password 
			+ "' ,truename = '" + truename 
			+ "' ,email = '" + email 
			+ "' ,phone_number = '" + tel
			+ "' ,level = '" + level
			+ "' where t_username = '" + (String)session.getAttribute("username")
			+ "' and password = '" + (String)session.getAttribute("password")
			+ "'";
	int result = 0;
	result = conn_teacher.executeUpdate(updateSql);
	session.setAttribute("username",username);
	session.setAttribute("password",password);
	if(result != 0){
		out.print("<script language='javascript'>alert('信息修改成功-_-');window.location.href='./index.jsp'</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误')</script>");
}
%>