var modifyShortButtons = document.querySelectorAll('#modifyShort')
var deleteShortButtons = document.querySelectorAll('#deleteShort')
var search = document.location.search
var score = parseInt(search.substring(18))
var shortId
//修改
modifyShortButtons.forEach(function(button){
	button.addEventListener('click',function(e){
		var children = e.target.parentNode.parentNode.parentNode.parentNode.children
		var sum = children[children.length-2].classList[2].substring(4)
		var list = e.target.parentNode.parentNode.parentNode.classList[2].substring(4)
		shortId = sum - list + 1
		
		document.querySelector('#submitShort').setAttribute('value','提交修改')
		document.querySelector('.hint > span.text').innerText = '该卡片用于修改简答题哦'
		document.querySelector('#short_form').style.display = 'block'
		changeStyle('lightgrey','lightgrey','white')
		var textAreas = document.querySelectorAll('#short_form > div > textarea')
		var contents = document.querySelectorAll('.row_' + list + '> ul > li > span')
		for(let i=0;i<2;i++){
			textAreas[i].value = contents[i].innerText
		}
		if(score === 5){
			textAreas[2].value = 5
		}
		if(score === 10){
			textAreas[2].value = 10
		}
		if(score === 15){
			textAreas[2].value = 15
		}
	})
})
//删除
deleteShortButtons.forEach(function(button){
	button.addEventListener('click',function(e){
		var children = e.target.parentNode.parentNode.parentNode.parentNode.children
		var sum = children[children.length-2].classList[2].substring(4)
		var list = e.target.parentNode.parentNode.parentNode.classList[2].substring(4)
		shortId = sum - list + 1
		if(window.confirm("确认删除这道选择题吗？")){	 		
	 		document.querySelector('#short_form').setAttribute('action','./handle_delete.jsp?type=short&id=' + shortId + '&score=' + score)
	 		document.querySelector('#short_form').submit()
		}
	})
})
//提交
document.querySelector('#submitShort').addEventListener('click',function(e){
	if(e.target.value === '提交修改'){
		document.querySelector('#short_form').setAttribute('action','./handle_modify.jsp?type=short&ID=' + shortId)
		document.querySelector('#short_form').submit()
	}
	if(e.target.value === '添加试题'){
		document.querySelector('#short_form').setAttribute('action','./handle_add.jsp?type=short')
		document.querySelector('#short_form').submit()
	}
})