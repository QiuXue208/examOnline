/***********************变量*****************************/
var search = window.document.location.search
var type = search.substring(1).substring(5)
/***************************管理员*********************************/
//清空管理员修改信息页表单
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
//修改学生信息
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
	 		var inputs = document.querySelectorAll('.block_modify > div > input')
	 		dt.forEach(function(value,key){
	 			inputs[key].setAttribute("value",value.innerText)
	 		}) 
 	})
}
//删除学生信息
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
//修改学生信息时的按钮提交
function handleSubmit(){
	document.querySelector('form').submit()
	document.querySelector('form').setAttribute('action','./handle_modify.jsp?user=' + user + '&id=' + id)	
}
//重置修改学生信息时的表单
function handleReset(){
	var inputs = document.querySelectorAll('.block_modify > div.row > input')
	inputs.forEach(function(input,index){
		input.setAttribute('value','')
	})
}
//取消填写修改学生信息的表单
function handleCancel(){
	document.querySelector('form').style.display = 'none'
	document.querySelector('.main').style.color = "black"
	var buttons = document.querySelectorAll('.operator > button')
	buttons.forEach(function(value){
         value.style.cssText = "color:brown;background:#D4D8C7;"
    })
}