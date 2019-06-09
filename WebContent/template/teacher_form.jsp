<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="block_modify" id="teacher" name="form2" method="post">
	<div class="row">
		<span>用户名</span><label>:</label> <input type="text" name="username" class="clearEle" ><sup>*</sup>
	</div>
	<div id="handlePass" class="row">
		<span>密码</span><label>:</label> <input type="password" name="password" id="pass" class="clearEle"><sup>*</sup>
		<img id="eye" alt="eye" src="../images/eye.png" onclick="handlePassword()">
		<span id="set_pass">显示密码</span>
	</div>
	<div class="row">
		<span>真名</span><label>:</label> <input type="text" name="truename" class="clearEle">
	</div>
	<div class="row">
		<span>级别</span><label>:</label> 
		<select name="level" class="clearEle">
			<option value="教授" selected="selected">教授</option>
			<option value="副教授">副教授</option>
			<option value="教师">教师</option>
			<option value="助教">助教</option>
		</select>
	</div>
	<div class="buttons">
		<input type="button" onclick="handleReset()" value="重置">
		<input type="button"  name="commit" id="teacher_submit" class="submit_button" value="添加" onclick="handleSubmit(form2)">		
		<input type="button" onclick="handleCancel()" value="取消"></input>
	</div>
</form>