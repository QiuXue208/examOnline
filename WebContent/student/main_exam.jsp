<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/student/main_exam.css">
<div class="main">
<ul class="paper_type">
	<li onclick="redirectToPaperOne()">
		<h2>试卷一</h2>
		<span>选择题(2分×10)</span>
		<span>判断题(2分×10)</span>
		<span>简答题(5分×5)</span>
		<span>计算题(10分+10分+15分)</span>
	</li>
	<li onclick="redirectToPaperTwo()">
		<h2>试卷二</h2>
		<span>选择题(2分×10)</span>
		<span>填空题(2分×5)</span>
		<span>简答题(5分×7)</span>
		<span>计算题(10分+10分+15分)</span>
    </li>
</ul>
</div>
<script>
	function redirectToPaperOne(){
		window.location.href = "./test_paper_one.jsp"
	}
	function redirectToPaperTwo(){
		window.location.href = "./test_paper_two.jsp"
	}
</script>