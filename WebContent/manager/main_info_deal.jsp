<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="chStr" scope="page" class="tools.chStr"></jsp:useBean>
<jsp:useBean id="connDB" scope="page" class="tools.ConnDB"></jsp:useBean>
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>
<%
try{
	String username2 = chStr.chStr(request.getParameter("username1"));
	String password2 = chStr.chStr(request.getParameter("password1"));
	String name2 = chStr.chStr(request.getParameter("name1"));
	String email2 = chStr.chStr(request.getParameter("email1"));
	String phone_number2 = chStr.chStr(request.getParameter("phone1"));
	String updateSql = "update manager set m_username = '" + username2 
			+ "' ,password = '" + password2 
			+ "' ,truename = '" + name2 
			+ "' ,email = '" + email2 
			+ "' ,phone_number = '" + phone_number2 
			+ "' where m_username = '" + (String)session.getAttribute("username")
			+ "' and password = '" + (String)session.getAttribute("password")
			+ "'";
	int result = 0;
	result = connDB.executeUpdate(updateSql);
	session.setAttribute("username",username2);
	session.setAttribute("password",password2);
	if(result != 0){
		out.print("<script language='javascript'>alert('信息修改成功-_-');window.location.href='./management_info.jsp'</script>");
// 		response.sendRedirect("./management_info.jsp");
	}else{
		out.print("<script language='javascript'>alert('您未修改任何信息-_-');window.location.href='./management_info.jsp'</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误')</script>");
}
%>
