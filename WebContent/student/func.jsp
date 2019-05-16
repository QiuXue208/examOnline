<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
nav {
	height: 10%;
	width: 100%;
	display:flex;
	justify-content: space-between;
	flex-wrap:nowrap;
}
nav > div{
	height:100%;
	display:flex;
	align-items: center;
}
nav > div.timer > img{
	height:50%;
	margin-left: 10px;
	margin-right:5px;
}
nav > div >  button{
	background:#536323;
	color:white;
	border:none;
	outline:none;
	padding:3px 10px;
	margin-right: 50px;
}
nav > div > time{
	color:brown;
 	font-size:18px;
}
nav > div >  button:hover{
	-webkit-box-shadow: 0px 0px 2px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 0px 0px 2px 0px rgba(0,0,0,0.75);
	box-shadow: 0px 0px 2px 0px rgba(0,0,0,0.75);
}
</style>
<nav>
<!-- 	<div><button>开始答题</button></div> -->
	<div class="timer">
	    <img src="../images/timer_1.png" alt="timer">
	    <time id="time">02:30:00</time>
<!-- 	    <span>倒计时<time id="time">02:30:00</time></span> -->
	</div>
	<div><button id="commit_paper" onclick="commitPaper()">提交试卷</button></div>
    <div><button onclick="returnToQuestion()">返回</button></div>
</nav>
<script>
	handleTimer()
	function returnToQuestion(){
		window.location.href = "./exam.jsp"
	}
	function commitPaper(){
		//处理提交试卷
		window.location.href = "./exam_result.jsp"
	}
	function handleTimer(){
		var times = document.querySelector('#time').innerText.split(':')
		var hour = parseInt(times[0])
		var minute = parseInt(times[1])
		var seconds = parseInt(times[2])
		var timerID = setInterval(function(){
			seconds = parseInt(seconds)
			minute = parseInt(minute)
			hour = parseInt(hour)
			if(seconds === 0){
				seconds = 59
				minute = minute - 1
			}else{
				seconds = seconds - 1
			}
			if(minute === 0){
				minute = 59
				hour = hour - 1
			}
			if(seconds.toString().length === 1){
				seconds = '0' + seconds
			}
			if(minute.toString().length === 1){
				minute = '0' + minute
			}
			if(hour.toString().length === 1){
				hour = '0' + hour
			}
			document.querySelector('#time').innerText = hour + ':' + minute + ':' + seconds
		},1000)
		setTimeout(function(){	
			window.clearInterval(timerID)
			//触发提交试卷按钮
			document.querySelector('#commit_paper').click()
		},150*60*1000)
	}
</script>