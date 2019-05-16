/*****************************填空题**************************************/
var fillingId
var fillingNumber
var modifyFillingButtons = document.querySelectorAll('#modifyFilling')
var deleteFillingButtons = document.querySelectorAll('#deleteFilling')
//填空题修改按钮
modifyFillingButtons.forEach(function(modifyFillingButton){	
	modifyFillingButton.addEventListener('click',function(e){
		changeStyle('lightgrey','lightgrey','white')			
		document.querySelector('#submitFilling').setAttribute('value','提交修改')			
		fillingId = e.target.parentNode.parentNode.parentNode.className.slice(-1)
		fillingNumber = e.target.parentNode.parentNode.parentNode.className.split(' ')[1]
		var textArea
		var contents
		if(fillingNumber === 'one'){
			handleFillingStyle('#filling_form_one')
			textAreas = document.querySelectorAll('#filling_form_one > div > textarea')
			contents = document.querySelectorAll('.one.row_' + fillingId + '> ul > li > span')
		}
		if(fillingNumber === 'two'){
			handleFillingStyle('#filling_form_two')
			textAreas = document.querySelectorAll('#filling_form_two > div > textarea')
			contents = document.querySelectorAll('.two.row_' + fillingId + '> ul > li > span')							
		}
		if(fillingNumber === 'three'){
			handleFillingStyle('#filling_form_three')
			textAreas = document.querySelectorAll('#filling_form_three > div > textarea')
			contents = document.querySelectorAll('.three.row_' + fillingId + '> ul > li > span')
		}
		if(fillingNumber === 'four'){
			handleFillingStyle('#filling_form_four')
			textAreas = document.querySelectorAll('#filling_form_four > div > textarea')
			contents = document.querySelectorAll('.four.row_' + fillingId + '> ul > li > span')
		}
		textAreas.forEach(function(textArea,key){
			textArea.value = contents[key].innerText
		})		
	})
})
//提交填空题表单
var submitFillingButtons = document.querySelectorAll('#submitFilling')
submitFillingButtons.forEach(function(submitFillingButton){
	submitFillingButton.addEventListener('click',function(e){
		if(e.target.value === '提交修改'){
			if(fillingNumber === 'one'){
				document.querySelector('#filling_form_one').setAttribute('action','./handle_modify.jsp?type=filling' + '&ID=' + fillingId + '&number=one')
				document.querySelector('#filling_form_one').submit()
			}
			if(fillingNumber === 'two'){
				document.querySelector('#filling_form_two').setAttribute('action','./handle_modify.jsp?type=filling' + '&ID=' + fillingId + '&number=two')
				document.querySelector('#filling_form_two').submit()
			}
			if(fillingNumber === 'three'){
				document.querySelector('#filling_form_three').setAttribute('action','./handle_modify.jsp?type=filling' + '&ID=' + fillingId + '&number=three')
				document.querySelector('#filling_form_three').submit()
			}
			if(fillingNumber === 'four'){
				document.querySelector('#filling_form_four').setAttribute('action','./handle_modify.jsp?type=filling' + '&ID=' + fillingId + '&number=four')
				document.querySelector('#filling_form_four').submit()
			}
		}
		if(e.target.value === '添加试题'){
			if(fillingNumber === 'one'){
				document.querySelector('#filling_form_one').setAttribute('action','./handle_add.jsp?type=filling' +  '&ID=' + fillingId + '&number=one')
				document.querySelector('#filling_form_one').submit()
			}
			if(fillingNumber === 'two'){
				document.querySelector('#filling_form_two').setAttribute('action','./handle_add.jsp?type=filling' +  '&ID=' + fillingId + '&number=two')
				document.querySelector('#filling_form_two').submit()
			}
			if(fillingNumber === 'three'){
				document.querySelector('#filling_form_three').setAttribute('action','./handle_add.jsp?type=filling' +  '&ID=' + fillingId + '&number=three')
				document.querySelector('#filling_form_three').submit()
			}
			if(fillingNumber === 'four'){
				document.querySelector('#filling_form_four').setAttribute('action','./handle_add.jsp?type=filling' +  '&ID=' + fillingId + '&number=four')
				document.querySelector('#filling_form_four').submit()
			}
		}
	})
})	
//填空题删除按钮
deleteFillingButtons.forEach(function(deleteFillingButton){
	deleteFillingButton.addEventListener('click',function(e){
		fillingId = e.target.parentNode.parentNode.parentNode.className.slice(-1)
		fillingNumber = e.target.parentNode.parentNode.parentNode.className.split(' ')[1]
		if(window.confirm("确认删除这道填空题吗？")){	
			if(fillingNumber === 'one'){
		 		document.querySelector('#filling_form_one').setAttribute('action','./handle_delete.jsp?type=filling&id=' + fillingId + '&number=one')
		 		document.querySelector('#filling_form_one').submit()	
			}
			if(fillingNumber === 'two'){
		 		document.querySelector('#filling_form_two').setAttribute('action','./handle_delete.jsp?type=filling&id=' + fillingId + '&number=two')
		 		document.querySelector('#filling_form_two').submit()	
			}
			if(fillingNumber === 'three'){
		 		document.querySelector('#filling_form_three').setAttribute('action','./handle_delete.jsp?type=filling&id=' + fillingId + '&number=three')
		 		document.querySelector('#filling_form_three').submit()	
			}
			if(fillingNumber === 'four'){
		 		document.querySelector('#filling_form_four').setAttribute('action','./handle_delete.jsp?type=filling&id=' + fillingId + '&number=four')
		 		document.querySelector('#filling_form_four').submit()	
			}
		}
	})
})