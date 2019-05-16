var modifyJudgementButtons = document.querySelectorAll('#modifyJudgement')
var deleteJudgementButtons = document.querySelectorAll('#deleteJudgement')
var judgementId
//修改
modifyJudgementButtons.forEach(function(button){
	button.addEventListener('click',function(e){
		var children = e.target.parentNode.parentNode.parentNode.parentNode.children
		var sum = children[children.length-2].className.substring(8)
		var list = e.target.parentNode.parentNode.parentNode.className.substring(8)	
		judgementId = sum - list + 1
		
		document.querySelector('#submitJudgement').setAttribute('value','提交修改')
		document.querySelector('#judgement_form').style.display = 'block'
		changeStyle('lightgrey','lightgrey','white')
		var textAreas = document.querySelectorAll('#judgement_form > div > textarea')
		var contents = document.querySelectorAll('.row_' + list + '> ul > li > span')
		textAreas.forEach(function(textArea,key){
			textArea.value = contents[key].innerText
		})			
	})
})
//删除
deleteJudgementButtons.forEach(function(button){
	button.addEventListener('click',function(e){
		var children = e.target.parentNode.parentNode.parentNode.parentNode.children
		var sum = children[children.length-2].className.substring(8)
		var list = e.target.parentNode.parentNode.parentNode.className.substring(8)	
		judgementId = sum - list + 1
		
		if(window.confirm("确认删除这道选择题吗？")){	 		
	 		document.querySelector('#judgement_form').setAttribute('action','./handle_delete.jsp?type=judgement&id=' + judgementId)
	 		document.querySelector('#judgement_form').submit()
		}
	})
})
//提交
document.querySelector('#submitJudgement').addEventListener('click',function(e){
	if(e.target.value === '提交修改'){
		document.querySelector('#judgement_form').setAttribute('action','./handle_modify.jsp?type=judgement&ID=' + judgementId)
		document.querySelector('#judgement_form').submit()
	}
	if(e.target.value === '添加试题'){
		document.querySelector('#judgement_form').setAttribute('action','./handle_add.jsp?type=judgement')
		document.querySelector('#judgement_form').submit()
	}
})