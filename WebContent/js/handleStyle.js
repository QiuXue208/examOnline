//选择题修改时的样式变换
function changeStyle(color1,color2,color3){		
	var rows = document.querySelectorAll('.row')
	var buttons = document.querySelectorAll('#funcButton > button')
	rows.forEach(function(row){
		row.style.color = color1
	})
	buttons.forEach(function(button){
		button.style.background = color2
		button.style.color = color3
	})		
}
//填空题修改时的样式变换
function handleFillingStyle(id){
	document.querySelectorAll('.filling_form').forEach(function(element){
		element.style.display = 'none'
	})
	document.querySelector(id).style.display = 'block'
}
////判断题修改时的样式变换
//function changeJudgementStyle(){
//	
//}