<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/student/main_exam.css">
<div class="main">
	<div class="hint">
		<span><img src="../images/hint.png" alt="hint"></span>
		<span>你只有一次作答机会...请预留150分钟，进入试卷即开始计时</span>
	</div>
	<ul class="paper_type">
		<li onclick="redirectToPaperOne()">
			<h2>进入试卷</h2>
			<span>选择题(2分×10)</span>
			<span>判断题(2分×10)</span>
			<span>简答题(5分×5)</span>
			<span>大题(10分+10分+15分)</span>
		</li>
<!-- 		<li onclick="redirectToPaperTwo()"> -->
<!-- 			<h2>试卷二</h2> -->
<!-- 			<span>选择题(2分×10)</span> -->
<!-- 			<span>填空题(2分×5)</span> -->
<!-- 			<span>简答题(5分×7)</span> -->
<!-- 			<span>大题(10分+10分+15分)</span> -->
<!-- 	    </li> -->
	</ul>
</div>
<script>
	function redirectToPaperOne(){
		if(window.confirm("你只有一次作答机会，进入试卷即开始计时，一共150分钟，请预留足够时间.")){
			window.location.href = "./test_paper_one.jsp"
		}		
	}
// 	function redirectToPaperTwo(){
// 		if(window.confirm("即将进入试卷页并开始计时，一共150分钟，请预留足够时间.")){
// 			window.location.href = "./test_paper_two.jsp"
// 		}		
// 	}
</script>