<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String username=(String)session.getAttribute("username"); %>
<link rel="stylesheet" href="../css/header.css">
<header>
  <h1>柚子考试系统</h1>
  <div class="user">
      <img alt="profile" src="../images/profile.png">
      <span><%=username%></span>
      <div class="logout" onclick="sendRedirect()">退出登录</div>
  </div>
</header>
<script>
 function sendRedirect(){
	 window.location.href = '../index.jsp'
 }
</script>