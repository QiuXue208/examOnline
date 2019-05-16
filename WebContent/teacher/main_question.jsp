<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/teacher/main_question.css">
<div id="teacher_main" class="main">
<ul id="select_container">
 	<li id="selection">选择题</li>
 	<li id="judgement">判断题</li>
 	<li id="filling">填空题</li>
 	<li id="short_five">简答题(5分)</li>
 	<li id="short_ten">简答题(10分)</li>
 	<li id="short_fifteen">简答题(15分)</li>
</ul>
</div>
<script>
	document.querySelector('#selection').addEventListener('click',function(){
		window.location.href = "./exam_selection.jsp?type=selection"
	})
	document.querySelector('#judgement').addEventListener('click',function(){
		window.location.href = "./exam_judgement.jsp?type=judgement"
	})
// 	document.querySelector('#filling').addEventListener('click',function(){
// 		window.location.href = "./exam_filling.jsp?type=filling"
// 	})
	document.querySelector('#short_five').addEventListener('click',function(){
		window.location.href = "./exam_short.jsp?type=short&score=five"
	})
	document.querySelector('#short_ten').addEventListener('click',function(){
		window.location.href = "./exam_short.jsp?type=short&score=ten"
	})
	document.querySelector('#short_fifteen').addEventListener('click',function(){
		window.location.href = "./exam_short.jsp?type=short&score=fifteen"
	})
</script>