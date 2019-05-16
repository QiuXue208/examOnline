<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="conn_teacher" scope="page" class="tools.ConnDB"></jsp:useBean>
<link rel="stylesheet" href="../css/main_info.css">
<%
	String username1 = (String)session.getAttribute("username");
	String password1 = (String)session.getAttribute("password");
	try{
		ResultSet rs = conn_teacher.executeQuery("select * from teacher where t_username = '" + username1 + "' and password = '" + password1 + "'");
		if(rs.next()){
%>
		<div class="main">
			<form name="form1" id="form1" action="./main_info_deal.jsp" method="post">
				<div class="username">
					<span class="info">用户名</span><label>:</label>
					<input type="text" class="clearEle" name="username1" value="<%=username1%>" required oninvalid="setCustomValidity('请确保用户名不为空')">
				</div>
				<div class="password">
					<span class="info">密码</span><label>:</label>
					<input type="password" class="clearEle" id="pass" name="password1" value="<%=password1%>" required oninvalid="setCustomValidity('请确保密码不为空')" oninvalid="setCustomValidity('')">
					<img id="eye" alt="eye" src="../images/eye.png" onclick="handlePassword()">
					<span id="set_pass">显示密码</span>
				</div>
				<div class="name">
					<span class="info">姓名</span><label>:</label>
					<input type="text" class="clearEle" name="name1" value="<%=rs.getString(4)%>">
				</div>
				<div class="level">
					<span class="info">级别</span><label>:</label>
					<input type="text" class="clearEle" name="level" value="<%=rs.getString(7)%>">
				</div>
				<div class="email">
					<span class="info">邮箱</span><label>:</label>
					<input type="email" class="clearEle" name="email1" value="<%=rs.getString(5)%>">
				</div>
				<div class="phone">
					<span class="info">电话号码</span><label>:</label>
					<input type="tel" class="clearEle" name="phone1" value="<%=rs.getString(6)%>">
				</div>
				<div class="submit">
					<input type="button" value="重新填写" onclick="clearAll()">
					<input type="submit" value="修改信息">
				</div>			
			</form>
		</div>
		<script src="../js/check.js"></script>
<%
		}else{
			%>
			<div class="login">请先在右上方点击退出后登录！</div>
		<%}
	}catch(Exception e){
		out.println("<script language='javascript'>alert('操作有误！')</script>");
	}
%>	