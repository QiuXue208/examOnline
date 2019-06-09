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
function handleSelectionForm(form){
	if(form.title.value === ''){
		alert('请输入题目!')
		form.title.focus()
		return
	}
	if(form.option_one.value === ''){
		alert('请输入选项一!')
		form.option_one.focus()
		return
	}
	if(form.option_two.value === ''){
		alert('请输入选项二!')
		form.option_two.focus()
		return
	}
	if(form.option_three.value === ''){
		alert('请输入选项三!')
		form.option_three.focus()
		return
	}
	if(form.option_four.value === ''){
		alert('请输入选项四!')
		form.option_four.focus()
		return
	}
	if(form.answer.value === ''){
		alert('请输入答案!')
		form.answer.focus()
		return
	}
	if(form.answer.value.length>1||(!/^(A|B|C|D)|(a|b|c|d)/.test(form.answer.value))){
		alert('请输入A、B、C、D或a、b、c、d中的一个')
		form.answer.focus()
		return
	}
	if(form.commit.value==='提交修改'){
		form.setAttribute('action','./handle_modify.jsp?type=selection&ID=' + selectionId)
		form.submit()
	}
	if(form.commit.value==='添加试题'){
		form.setAttribute('action','./handle_add.jsp?type=selection')
		form.submit()
	}
}
//document.querySelector('#submitSelection').addEventListener('click',function(e){
//	if(e.target.value === '提交修改'){
//		document.querySelector('#selection_form').setAttribute('action','./handle_modify.jsp?type=selection&ID=' + selectionId)
//		document.querySelector('#selection_form').submit()
//	}
//	if(e.target.value === '添加试题'){
//		document.querySelector('#selection_form').setAttribute('action','./handle_add.jsp?type=selection')
//		document.querySelector('#selection_form').submit()
//	}
//})
