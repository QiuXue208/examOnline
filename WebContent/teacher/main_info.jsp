<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="conn_teacher" scope="page" class="tools.ConnDB"></jsp:useBean>
<link rel="stylesheet" href="../css/main_info.css">
<%
	String username1 = (String)session.getAttribute("username");
	String password1 = (String)session.getAttribute("password");
	String level = "";
	try{
		ResultSet rs = conn_teacher.executeQuery("select * from teacher where t_username = '" + username1 + "' and password = '" + password1 + "'");
		if(rs.next()){
		  level = rs.getString(7).trim();	
%>
		<div class="main">
			<form name="form4" class="formInfo" id="form1" action="./main_info_deal.jsp" method="post">
				<div class="hint">
					<span><img src="../images/hint.png" alt="hint"></span>
					<span>该卡片用于修改教师信息哦</span>
				</div>	
				<div class="username">
					<span class="info">用户名</span><label>:</label>
					<input type="text" class="clearEle" name="username" value="<%=username1%>" readonly="readonly" onclick="clickUsername()"><sup>*</sup>
				</div>
				<div class="password">
					<span class="info">密码</span><label>:</label>
					<input type="password" class="clearEle" id="pass" name="password" value="<%=password1%>"><sup>*</sup>
					<img id="eye" alt="eye" src="../images/eye.png" onclick="handlePassword()">
					<span id="set_pass">显示密码</span>
				</div>
				<div class="name">
					<span class="info">姓名</span><label>:</label>
					<input type="text" class="clearEle" name="name" value="<%=rs.getString(4)%>">
				</div>
				<div class="level">
					<span class="info">级别</span><label>:</label>
					<select name="level" class="clearEle">
						<option value="教授">教授</option>
						<option value="副教授">副教授</option>
						<option value="教师">教师</option>
						<option value="助教">助教</option>
					</select>
				</div>
				<div class="email">
					<span class="info">邮箱</span><label>:</label>
					<input type="email" class="clearEle" name="email" value="<%=rs.getString(5)%>">
				</div>
				<div class="phone">
					<span class="info">电话号码</span><label>:</label>
					<input type="tel" class="clearEle" name="phone" value="<%=rs.getString(6)%>">
				</div>
				<div class="submit">
					<input type="button" value="重新填写" onclick="clearAll()">
					<input type="button" value="修改信息" onclick="submitTeacher(form4)">
				</div>			
			</form>
		</div>
		<script src="../js/check.js"></script>
		<script src="../js/handleInfo.js"></script>
		<script>
			var level = document.getElementsByName('level')
			if("<%=level%>"=="教授"){
				level[0][0].selected = true
			}
			if("<%=level%>"=="副教授"){
				level[0][1].selected = true
			}
			if("<%=level%>"=="教师"){
				level[0][2].selected = true
			}
			if("<%=level%>"=="助教"){
				level[0][3].selected = true
			}
		</script>
		<script src="../js/modifyTeacherInfo.js"></script>
<%
		}else{
			%>
			<div class="login">请先在右上方点击退出后登录！</div>
		<%}
	}catch(Exception e){
		out.println("<script language='javascript'>alert('操作有误！')</script>");
	}
%>	