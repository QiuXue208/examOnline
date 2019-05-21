var modifyButtons = document.querySelectorAll('#modifySelection')	
var deleteButtons = document.querySelectorAll('#deleteSelection')
var selectionId
//修改
modifyButtons.forEach(function(button){
	button.addEventListener('click',function(e){
		var children = e.target.parentNode.parentNode.parentNode.parentNode.children
		var sum = children[children.length-2].className.substring(8)
		var list = e.target.parentNode.parentNode.parentNode.className.substring(8)	
		selectionId = sum - list + 1
		document.querySelector('#submitSelection').setAttribute('value','提交修改')
		document.querySelector('.hint > span.text').innerText = '该卡片用于修改选择题哦'
		document.querySelector('#selection_form').style.display = 'block'
		changeStyle('lightgrey','lightgrey','white')
		var textAreas = document.querySelectorAll('#selection_form > div > textarea')
		var contents = document.querySelectorAll('.row_' + list + '> ul > li > span')
		textAreas.forEach(function(textArea,key){
			textArea.value = contents[key].innerText
		})			
	})
})
//删除
deleteButtons.forEach(function(button){
	button.addEventListener('click',function(e){
		var children = e.target.parentNode.parentNode.parentNode.parentNode.children
		var sum = children[children.length-2].className.substring(8)
		var list = e.target.parentNode.parentNode.parentNode.className.substring(8)	
		selectionId = sum - list + 1
		if(window.confirm("确认删除这道选择题吗？")){	 		
	 		document.querySelector('#selection_form').setAttribute('action','./handle_delete.jsp?type=selection&id=' + selectionId)
	 		document.querySelector('#selection_form').submit()
		}
	})
})
//提交
document.querySelector('#submitSelection').addEventListener('click',function(e){
	if(e.target.value === '提交修改'){
		document.querySelector('#selection_form').setAttribute('action','./handle_modify.jsp?type=selection&ID=' + selectionId)
		document.querySelector('#selection_form').submit()
	}
	if(e.target.value === '添加试题'){
		document.querySelector('#selection_form').setAttribute('action','./handle_add.jsp?type=selection')
		document.querySelector('#selection_form').submit()
	}
})
