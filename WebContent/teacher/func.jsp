<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.clearfix::after{
	content:'';
	display:block;
	clear:both;
}
nav {
	height: 10%;
	width: 100%;
}
nav > button{
    float:right;
	background:#536323;
	color:white;
	border:none;
	outline:none;
	padding:3px 10px;
	margin-right:30px;
}
nav > button:hover{
	-webkit-box-shadow: 0px 0px 2px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 0px 0px 2px 0px rgba(0,0,0,0.75);
	box-shadow: 0px 0px 2px 0px rgba(0,0,0,0.75);
}
</style>
<nav class="clearfix">
    <button id="add">添加试题</button> 
    <button onclick="returnToQuestion()">返回</button>   
</nav>
<script>
	function returnToQuestion(){
		window.location.href = "./management_question.jsp"
	}
</script>