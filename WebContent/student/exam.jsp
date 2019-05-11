<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../images/title.png" type="image/x-icon">
<link rel="stylesheet" href="../css/back_public.css">
<title>柚子考试系统</title>
<style>
	aside > ul > li{color:black;}
	aside > ul > li:nth-child(2){color:crimson;}
</style>
</head>
<body>
	<div class="banner">
	  <div class="mask"></div>
	</div>
	<%@ include file="../header.jsp" %>
	<div class="container_all">
	    <div class="container_top">
			<%@ include file="../student/aside.jsp"%>
			<div class="container_right">
				<%@ include file="../student/main_exam.jsp"%>
			</div>		    
	    </div>
		<%@ include file="../copyright.jsp" %>
	</div> 
</body>
</html>