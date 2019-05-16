//显示与隐藏密码
var pass = document.getElementById('pass')
var eye = document.getElementById('eye')
var set_pass = document.getElementById('set_pass')
var clicked = false
function handlePassword(openUrl, closeUrl) {
	clicked = !clicked
	if (clicked) {
		pass.setAttribute('type', 'text')
		eye.setAttribute('src', '/examOnline/images/eye_open.png')
		set_pass.innerText = '隐藏密码'

	} else {
		pass.setAttribute('type', 'password')
		eye.setAttribute('src', '/examOnline/images/eye.png')
		set_pass.innerText = '显示密码'
	}
}
//Enter键触发表单提交
document.onkeydown = function(e) {
	if (e.keyCode === 13) {
		document.getElementById("submit").click()
	}
}
