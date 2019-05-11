<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/teacher/main_question.css">
<div id="teacher_main" class="main">
<ul id="select_container">
 	<li id="selection">选择题</li>
 	<li id="judgement">判断题</li>
 	<li id="filling">填空题</li>
 	<li id="short">简答题</li>
 	<li id="calculation">计算题</li>
</ul>
</div>
<script>
	document.querySelector('#selection').addEventListener('click',function(){
		window.location.href = "./exam_selection.jsp"
	})
	document.querySelector('#judgement').addEventListener('click',function(){
		window.location.href = "./exam_judgement.jsp"
	})
	document.querySelector('#filling').addEventListener('click',function(){
		window.location.href = "./exam_filling.jsp"
	})
	document.querySelector('#short').addEventListener('click',function(){
		window.location.href = "./exam_short.jsp"
	})
	document.querySelector('#calculation').addEventListener('click',function(){
		window.location.href = "./exam_calculation.jsp"
	})
</script>