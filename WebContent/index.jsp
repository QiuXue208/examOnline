<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" href="./images/title.png" type="image/x-icon">
	<link rel="stylesheet" href="./css/index.css">
	<link rel="stylesheet" href="./css/back_public.css">
	<title>柚子考试系统</title>
</head>
<body>
    <div class="banner">
       <div class="mask"></div>
    </div>
    <div class="top">
	    <div class="form_container">
			<h1>柚子考试系统</h1>
			<form name="form" id="form" method="post" action="./loginDeal.jsp">
				<div>
					<span class="info">用户名</span> <label>:</label>
					<input type="text" name="username"
						placeholder="请输入用户名" required oninvalid="setCustomValidity('请输入用户名。')" oninput="setCustomValidity('')" >
					<sup>*</sup>
				</div>
				<div class="eye_container"> 
					<span class="info">密码</span><label>:</label>
					<input type="password" id="pass" name="password"
						placeholder="请输入密码" required oninvalid="setCustomValidity('请输入密码。')" oninput="setCustomValidity('')" >
					<sup>*</sup>					
					<img id="eye" alt="eye" src="./images/eye.png" onclick="handlePassword()">
					<span id="set_pass">显示密码</span>
				</div>
				<div>
					<input type="radio" id="teacher" name="user" value="教师"> <label for="teacher">教师</label>
					<input type="radio" id="student" name="user" value="学生"> <label for="student">学生</label> 
					<input type="radio" id="manager" name="user" value="管理员" checked> <label for="manager">管理员</label>
				</div>
				<div>
					<input type="submit" id="submit" value="登录"/>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="./js/check.js"></script>
    </div>	
	<%@ include file="./copyright.jsp" %>
</body>
</html>