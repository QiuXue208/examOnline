<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/aside_public.css">
<aside>
	<ul>
	  <li onclick="redirectToInfo()">信息管理</li>
	  <li onclick="redirectToExam()">试题管理</li>
	  <li onclick="redirectToScore()">成绩管理</li>
	</ul>
</aside>

<script>
	function redirectToInfo(){
		window.location.href = './index.jsp'
	}
	function redirectToExam(){
		window.location.href = './management_question.jsp'
	}
	function redirectToScore(){
		window.location.href = './management_score.jsp'
	}
</script>