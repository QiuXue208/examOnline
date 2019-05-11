<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<%@ page import="java.sql.*"%>
<% String username=(String)session.getAttribute("username");
   String user = (String)session.getAttribute("user");
   String sql = "";
   String truename = "";
   if(user.equals("教师")){
	   sql = "select truename from teacher where t_username = '" + username + "'";  
   }
   if(user.equals("学生")){
	   sql = "select truename from student where s_username = '" + username + "'";  
   }
   if(user.equals("管理员")){
	   sql = "select truename from manager where m_username = '" + username + "'";  
   }
   ResultSet rs_aside = conn.executeQuery(sql);
   while(rs_aside.next()){
	   truename = rs_aside.getString("truename");
   }
%>
<link rel="stylesheet" href="../css/header.css">
<header>
  <h1>柚子考试系统</h1>
  <div class="user">
      <img alt="profile" src="../images/profile.png">
      <span><%=truename%></span>
      <div class="logout" onclick="sendRedirect()">退出登录</div>
  </div>
</header>
<script>
 function sendRedirect(){
	 window.location.href = '../index.jsp'
 }
</script>