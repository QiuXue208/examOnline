function clearAll(e) {
   var clearElements = document.getElementsByClassName('clearEle')
   for(let i=1;i<clearElements.length;i++){
	   clearElements[i].value = ''
   }
}
function submitTeacher(form){
	var usernameStr = form.username.value.replace(/\s*/g,"")
	if(usernameStr.substring(0,1)!=="T"&&usernameStr.substring(0,1)!=="t"){
		alert('教师用户名以T或t开头!')
		form.username.focus()
		return
	}
	if(!/^[1-4]/.test(usernameStr.substring(1,2))){
		alert('第一位数字为1-4中的一个!')
		form.username.focus()
		return
	}
	if(usernameStr.length!==5){
		alert('教师用户名由5位组成，由T开始，后接4位数字，第一位数字为1-4，请认真检查！')
		form.username.focus()
		return
	}
	if(form.password.value===''){
		alert('请输入密码!')
		form.password.focus()
		return
	}
}
function submitStudent(form){
	var classes = parseInt(usernameStr.substring(2,4))
	var grade = parseInt(usernameStr.substring(1,2))
	if(form.password.value===''){
		alert('请输入密码!')
		form.password.focus()
		return
	}
	if(!/^[1-4]/.test(usernameStr.substring(1,2))){
		alert('此时年级应为'+grade)
		form.username.focus()
		return
	}
	if(grade == 1 &&(classes!==parserInt(form.class.value))){
		alert('此时班级应为'+classes)
		form.username.focus()
		return
	}
	if(grade == 2 &&(classes<1||classes>13)){
		alert('此时班级应为'+classes)
		form.username.focus()
		return
	}
	if(grade == 3 &&(classes<1||classes>9)){
		alert('此时班级应为'+classes)
		form.username.focus()
		return
	}
	if(grade == 4 &&(classes<1||classes>12)){
		alert('此时班级应为'+classes)
		form.username.focus()
		return
	}
}
function clickUsername(){
	alert('用户名不可更改')
	return
}
function submitInfo(){
	if(confirm("确认修改信息吗？")){
		document.querySelector('.formInfo').submit()
	}else{
		return false
	}
}