<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="block_modify" id="teacher" name="teacher" method="post">
	<div class="row">
		<span>用户名</span><label>:</label> <input type="text" name="username">
	</div>
	<div id="handlePass" class="row">
		<span>密码</span><label>:</label> <input type="password" name="password" id="pass">
		<img id="eye" alt="eye" src="../images/eye.png" onclick="handlePassword()">
		<span id="set_pass">显示密码</span>
	</div>
	<div class="row">
		<span>真名</span><label>:</label> <input type="text" name="truename">
	</div>
	<div class="row">
		<span>级别</span><label>:</label> <input type="text" name="level">
	</div>
	<div class="row">
		<span>邮箱</span><label>:</label> <input type="email" name="email">
	</div>
	<div class="row">
		<span>电话</span><label>:</label> <input type="tel" name="tel">
	</div>
	<div class="buttons">
		<input type="reset" onclick="handleReset()" value="重置">
		<input type="submit" onclick="handleSubmit()" id="teacher_submit" value="添加">		
		<input type="button" onclick="handleCancel()" value="取消"></input>
	</div>
</form>