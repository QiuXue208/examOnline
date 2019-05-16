//重新填写
function clearAllContent(){
	var textAreas = document.querySelectorAll('.question_form > div > textarea')
	textAreas.forEach(function(textArea){
		textArea.value = ''
	})
}
//取消
function cancelSubmitForm(){
	changeStyle('black','#D4D8C7','brown')
	document.querySelectorAll('.question_form').forEach(function(element){
		element.style.display = 'none'
	})	
}

//获取到每行的ID
function getID(e){
	var children = e.target.parentNode.parentNode.parentNode.parentNode.children
	var sum = children[children.length-2].className.substring(8)
	var list = e.target.parentNode.parentNode.parentNode.className.substring(8)	
	var ID = sum - list + 1
	return {"list":list,"ID":ID}
}