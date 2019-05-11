<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="icon" href="../images/title.png" type="image/x-icon">
		<link rel="stylesheet" href="../css/back_public.css">
		<title>柚子考试系统</title>
		<style>
			aside > ul > li{color:black;}
			aside > ul > li:nth-child(1){color:crimson;}
		</style>
	</head>
	<body>
		<div class="banner">
		  <div class="mask"></div>
		</div>	
		<%@ include file="../header.jsp"%>
		<div class="container_all">
		    <div class="container_top">
				<%@ include file="./aside.jsp"%>
				<div class="container_right">
					<%@ include file="./main_info.jsp"%>
	                <%-- 信息修改页无页面转换 --%>
				</div>		    
		    </div>
			<%@ include file="../copyright.jsp" %>
		</div>    
	</body>
</html>