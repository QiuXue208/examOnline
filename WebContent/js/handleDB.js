/***********************变量*****************************/
var search = window.document.location.search
var index = search.indexOf('user') + 5
var type = search.substring(index)
function clearAll(e) {
   var clearElements = document.getElementsByClassName('clearEle')
   for(let i=0;i<clearElements.length;i++){
	   clearElements[i].value = ''
   }
}
var id
var user
//点击修改学生信息时改变样式
function changeStyle(){
	document.querySelector('.main').style.color = "grey"
	var buttons = document.querySelectorAll('.operator > button')
	buttons.forEach(function(value){
           value.style.cssText = "color:grey;background:lightgrey;"
       })
}
//修改
var modifyButton = document.querySelectorAll(".modify")
for(var i=0;i<modifyButton.length;i++){
 	    modifyButton[i].addEventListener("click",function(e){
 	    	//样式修改
            changeStyle()
 	    	//获取id
			id = e.target.parentNode.previousElementSibling.id
			user = e.target.parentNode.parentNode.parentNode.id
			document.querySelector('form#' + user).style.display = "block"
			document.querySelector('input#' + user + '_submit').setAttribute('value','提交')
			
			var classNames = e.target.parentNode.parentNode.className.split(' ')
			var className = classNames[1]
	 		var dt = document.querySelectorAll('.' + className + ' > dl > dt')
//	 		console.log(dt)
	 		var inputs = document.querySelectorAll('.block_modify > div > .clearEle')
//	 		console.log(inputs)
	 		dt.forEach(function(element,key){
	 			inputs[key].value=element.innerText
	 		}) 
 	})
}
//删除
var deleteButton = document.querySelectorAll('.delete')
for(var i = 0;i<deleteButton.length;i++){
	deleteButton[i].addEventListener('click',function(e){

		var username = e.target.parentNode.previousElementSibling.firstElementChild.nextElementSibling.innerText
		id = e.target.parentNode.previousElementSibling.id
		user = e.target.parentNode.parentNode.parentNode.id
		if(window.confirm("确认删除用户" + username + "吗?")){	 		
	 		document.querySelector('form').setAttribute('action','./handle_delete.jsp?user=' + user + '&id=' + id)
	 		document.querySelector('form').submit()
		}
 	})
}
//提交
function handleSubmit(form){
	var usernameStr = form.username.value.replace(/\s*/g,"")
	if(type==='student'){
		var classes = parseInt(usernameStr.substring(2,4))
		var grade = parseInt(usernameStr.substring(1,2))
		if(usernameStr===''){
			alert('请输入用户名！')
			form.username.focus()
			return
		}
		if(usernameStr.substring(0,1)!=="S"&&usernameStr.substring(0,1)!=="s"){
			alert('学生用户名以S或s开头!')
			form.username.focus()
			return
		}
		if(!/^[1-4]/.test(usernameStr.substring(1,2))){
			alert('第一位数字为1-4中的一个!')
			form.username.focus()
			return
		}
		if(grade == 1 &&(classes<1||classes>15)){
			alert('第二三位数应位于1-15之间！')
			form.username.focus()
			return
		}
		if(grade == 2 &&(classes<1||classes>13)){
			alert('第二三位数应位于1-13之间！')
			form.username.focus()
			return
		}
		if(grade == 3 &&(classes<1||classes>9)){
			alert('第二三位数应位于1-9之间！')
			form.username.focus()
			return
		}
		if(grade == 4 &&(classes<1||classes>12)){
			alert('第二三位数应位于1-12之间！')
			form.username.focus()
			return
		}
		if(usernameStr.length!==6){
			alert('由S/s开始，后接5位数字，第一位数字为1-4，第二三位为1-15的数，请认真检查！')
			form.username.focus()
			return
		}
//		if(usernameStr.substring(2,4)>15){
//			console.log(1)
//			alert('第二、三位数字不可大于15!')
//			form.username.focus()
//			return
//		}
		if(form.password.value===''){
			alert('请输入密码!')
			form.password.focus()
			return
		}
		if(form.grade.value===''){
			alert('请输入年级数！')
			form.grade.focus()
			return
		}
		if(grade!=form.grade.value){
			alert('此用户名对应的年级应该是'+grade+'年级！')
			form.grade.focus()
			return
		}
//		if(grade<1||grade>4){
//			alert('第一位数应位于1-4之间！')
//			form.username.focus()
//			return
//		}
		if(form.class.value===''){
			alert('请输入班级数！')
			form.class.focus()
			return
		}
		if(classes!=form.class.value){
			alert('此用户名对应的班级应该是'+classes+'班！')
			form.class.focus()
			return
		}
	}
	if(type==='teacher'){
		if(usernameStr===''){
			alert('请输入用户名！')
			form.username.focus()
			return
		}
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
		var levelN = usernameStr.substring(1,2)
		var levelS = form.level.value.replace(/\s*/g,"")
		if(levelN==1&&levelS!=="教授"){
			alert('此用户名对应级别应为教授!')
			form.level.focus()
			return
		}
		if(levelN==2&&levelS!=="副教授"){
			alert('此用户名对应级别应为副教授!')
			form.level.focus()
			return
		}
		if(levelN==3&&levelS!=="教师"){
			alert('此用户名对应级别应为教师!')
			form.level.focus()
			return
		}
		if(levelN==4&&levelS!=="助教"){
			alert('此用户名对应级别应为助教!')
			form.level.focus()
			return
		}
	}
	if(form.commit.value === '提交'){
		form.setAttribute('action','./handle_modify.jsp?user=' + user + '&id=' + id)	
		form.submit()
	}
	if(form.commit.value === '添加'){
		form.setAttribute('action','./add_new_user.jsp?type='+type)	
		form.submit()
	}

}
//document.querySelector('.submit_button').addEventListener('click',function(e){	
//	if(e.target.value == '提交'){
//		console.log(e)
////		document.querySelector('form').setAttribute('action','./handle_modify.jsp?user=' + user + '&id=' + id)	
////		document.querySelector('form').submit()
//	}
//	if(e.target.value == '添加'){
//		console.log(e)
////		document.querySelector('form').setAttribute('action','./add_new_user.jsp?type='+type)	
////		document.querySelector('form').submit()
//	}
//
//})	


//重置
function handleReset(){
	var inputs = document.querySelectorAll('.block_modify > div.row > .clearEle')
	inputs.forEach(function(input,index){
		input.value = ''
	})
	
}
//取消
function handleCancel(){
	document.querySelector('form').style.display = 'none'
	document.querySelector('.main').style.color = "black"
	var buttons = document.querySelectorAll('.operator > button')
	buttons.forEach(function(value){
         value.style.cssText = "color:brown;background:#D4D8C7;"
    })
}