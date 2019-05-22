<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
nav {
	height: 10%;
	width: 100%;
}
nav > div.timer{
	position:absolute;
	top:20px;
	left:43%;
}
nav > div.timer > span> img{
	height:25px;
	margin-right:5px;
}
nav > div.timer > span{
	vertical-align: middle;
}
nav > div > time{
	color:brown;
 	font-size:25px;
}
</style>
<nav>
	<div class="timer">
		<span><img src="../images/timer_1.png" alt="timer"></span>
	    <time id="time">02:30:00</time>
	</div>
</nav>
<script>
	handleTimer()
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