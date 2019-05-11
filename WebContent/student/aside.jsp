<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/aside_public.css">
<aside>
	<ul>
	  <li onclick="redirectToInfo()">信息管理</li>
	  <li onclick="redirectToExam()">参加考试</li>
	  <li onclick="redirectToScore()">查询成绩</li>
	</ul>
</aside>

<script>
	function redirectToInfo(){
		window.location.href = './index.jsp'
	}
	function redirectToExam(){
		window.location.href = './exam.jsp'
	}
	function redirectToScore(){
		window.location.href = './score.jsp'
	}
</script>