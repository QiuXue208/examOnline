<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connA" scope="page" class="tools.ConnDB" />
<link rel="stylesheet" href="../css/aside_public.css">
<link rel="stylesheet" href="../css/teacher/aside.css">
<aside>
	<ul>
		<li onclick="redirectToInfo()">账号管理</li>
		<li onclick="redirectToExam()">试题管理</li>
		<li>
			<button class="dropdown">
				<span>成绩管理</span><img src="../images/select_bottom.png"
					alt="select-bottom">
			</button>
			<div class="selector">
				<div class="users">
					<span>根据班级查看</span><img src="../images/select_bottom.png"
						alt="select-bottom">
					<div class="grades">
						<%
							for (int i = 0; i < 4; i++) {
						%>
						<div class="grade<%=i + 1%> grade">
							<span>大<%=i + 1%></span> <img src="../images/select.png"
								alt="select-left">
							<div class="classes">
								<%
									ResultSet rs = connA.executeQuery("select * from number where grade_all = '" + (i + 1) + "'");
										int classes = 0;
										while (rs.next()) {
											classes = rs.getInt("class_all");
											for (int j = 0; j < classes; j++) {
								%>
								<div class="<%=j + 1%>"><%=j + 1%>班
								</div>
								<%
									}
										}
								%>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
				<div class="scores">
					<span>根据分数段查看</span><img src="../images/select_bottom.png"
						alt="select-bottom">
					<div class="scoreValue">
						<div>90分-100分</div>
						<div>80分-90分</div>
						<div>70分-80分</div>
						<div>60分-70分</div>
						<div>60分以下</div>
					</div>
				</div>
			</div>
		</li>
	</ul>
</aside>


<script>
	function redirectToInfo(){
		window.location.href = './index.jsp'
	}
	function redirectToExam(){
		window.location.href = './management_question.jsp'
	}
	handleDropdown()
	//处理下拉菜单并跳转
	function handleDropdown(){
		var clicked = false
		var grade
		var classes
		var scoreMin
		var scoreMax
		document.querySelector('.dropdown').addEventListener('click',function(e){
			clicked = !clicked
			if(clicked){
				document.querySelector('.selector').style.display = 'block'
				document.querySelector('button').style.background = '#e6e6e6'
			}else{
				document.querySelector('.selector').style.display = 'none'
				document.querySelector('button').style.background = 'white'
			}
		})
		document.querySelectorAll('.classes > div').forEach(function(element){
			  element.addEventListener('click',function(e){
				  document.querySelector('.selector').style.display = 'none'
				  grade = e.target.parentNode.parentNode.classList[0].substring(5)
				  classes = e.target.className
				  window.location.href = './management_score.jsp?condition=users&grade='+grade +'&class='+classes
			  })
		})
		document.querySelectorAll('.scoreValue > div').forEach(function(element,index){
			element.addEventListener('click',function(e){
				 if(index === 0){scoreMin = 90;scoreMax = 100;}
				 if(index === 1){scoreMin = 80;scoreMax = 90;}
				 if(index === 2){scoreMin = 70;scoreMax = 80;}
				 if(index === 3){scoreMin = 60;scoreMax = 70;}
				 if(index === 4){scoreMin = 0;scoreMax = 60;}
				 document.querySelector('.selector').style.display = 'none'
				 window.location.href = './management_score.jsp?condition=scores&min='+scoreMin +'&max='+scoreMax
			})
		})
		
	}
</script>