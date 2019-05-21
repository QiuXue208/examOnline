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
	-webkit-box-shadow: 0px 0px 4px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 0px 0px 4px 0px rgba(0,0,0,0.75);
	box-shadow: 0px 0px 4px 0px rgba(0,0,0,0.75);
}
</style>
<nav class="clearfix">
    <button id="addNewQuestion" onclick="addNewQuestion()">添加试题</button> 
    <button onclick="returnToQuestion()">返回</button>  
</nav>
<script src="../js/handleStyle.js"></script>
<script>
	function returnToQuestion(){
		window.location.href = "./management_question.jsp"
	}
	function addNewQuestion(){
		var search = window.document.location.search
		var type = search.split('&')[0].substring(6)
		if(type === "selection"){
			document.querySelector('#selection_form').style.display = 'block'
			document.querySelector('#submitSelection').setAttribute('value','添加试题')
			document.querySelector('.hint > span.text').innerText = '该卡片用于添加选择题哦'
			changeStyle('lightgrey','lightgrey','white')
			var textAreas = document.querySelectorAll('#selection_form > div > textarea')
			textAreas.forEach(function(textArea,key){
				textArea.value = '' 
			})
		}
		if(type === "judgement"){
			document.querySelector('#judgement_form').style.display = 'block'
				document.querySelector('#submitJudgement').setAttribute('value','添加试题')
				document.querySelector('.hint > span.text').innerText = '该卡片用于添加判断题哦'
				changeStyle('lightgrey','lightgrey','white')
				var textAreas = document.querySelectorAll('#judgement_form > div > textarea')
				textAreas.forEach(function(textArea,key){
					textArea.value = '' 
				})
		}
		if(type === "short"){
			document.querySelector('#short_form').style.display = 'block'
				document.querySelector('#submitShort').setAttribute('value','添加试题')
				document.querySelector('.hint > span.text').innerText = '该卡片用于添加简答题哦'				
				changeStyle('lightgrey','lightgrey','white')
				var textAreas = document.querySelectorAll('#short_form > div > textarea')
				textAreas.forEach(function(textArea,key){
					textArea.value = '' 
				})
		}
	}
</script>