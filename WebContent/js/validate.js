function validateManagerForm(form){
	//用户名不可为空
	if(form.username.value===''){
		alert('用户名不可为空!')
		form.username.focus()
		return
	}
	//密码不可为空
	if(form.password.value === ''){
		alert('请输入密码!');
		form.password.focus();
		return;
	}
	//处理名字
	var nameStr = form.truename.value.replace(/\s*/g,"")
	if(nameStr.length!==0){
		if(nameStr.length>10){
			alert('姓名长度不可超过10!');
			form.truename.focus();
			return;
		}
	}
	//处理邮箱
	var emailReg = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/
	var emailStr = form.email.value.replace(/\s*/g,"");
	if(emailStr.length !== 0){
		if(!emailReg.test(emailStr)){
			alert('请输入正确的邮箱格式!');
			form.email.focus();
			return;
		}
	}
	//检测电话号码
	const phoneStr = form.phone.value.replace(/\s*/g,"")
	const phoneReg = /^(13\d|14[579]|15[^4\d]|17[^49\d]|18\d)\d{8}/
	if(phoneStr.length !== 0){
		if(!phoneReg.test(phoneStr)){
			alert('请输入正确的号码格式!');
			form.phone.focus();
			return;
		}
	}
	form.submit()
}


