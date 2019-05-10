function handleSubmit(){
	  var form = document.getElementById('form')
	  var radio = document.getElementsByName('user') 
	  for(let i=0;i<radio.length;i++){
		  if(radio[i].checked){
			  if(i === 0){
				  //处理教师登录
				  form.action = "./teacher/teacherIndex.jsp"
			  }else if(i === 1){
				  //处理学生登录
				  form.action = "./student/studentIndex.jsp"
			  }else if(i === 2){
				  //处理管理员登录
				  form.action = "./manager/managerIndex.jsp"
			  }
			  break
		  }
	  }
}