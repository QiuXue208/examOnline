<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connR" scope="page" class="tools.ConnDB" />
<link rel="icon" href="../images/title.png" type="image/x-icon">
<link rel="stylesheet" href="../css/teacher/main_review.css">
<link rel="stylesheet" href="../css/paper.css">
<title>柚子考试系统</title>

<div class="main">
	<%
	String queryUser = request.getQueryString().substring(5);	
	// 分别获取ID 、 用户答案 、 答案选项 、 题目
	int [] selectionsID = new int[10];
	String []usersAnswer = new String[10];
	
	int [] judgementsID = new int[10];
	String []userjAnswer = new String[10];
	
	int [] short5ID = new int[5];
	String [] userc5Answer = new String[5];

	int [] short10ID = new int[2];
	String [] userc10Answer = new String[2];

	int short15ID = 0;
	String userc15Answer = "";
	
	ResultSet rs = connR.executeQuery("select * from question_selection where [user]='"+queryUser +"'");
	while(rs.next()){
		for(int i=0;i<10;i++){
			selectionsID[i] = rs.getInt("s"+(i+1)+"_ID");
		}
	}
	ResultSet rs11 = connR.executeQuery("select * from answer_selection where [user]='"+queryUser +"'");
	while(rs11.next()){
		for(int i=0;i<10;i++){
			usersAnswer[i] = rs11.getString("answer"+(i+1));
		}
	}
	ResultSet rs2 = connR.executeQuery("select * from question_judgement where [user]='"+queryUser +"'");
	while(rs2.next()){
		for(int i=0;i<10;i++){
			judgementsID[i] = rs2.getInt("j"+(i+1)+"_ID");
		}
	}
	ResultSet rs22 = connR.executeQuery("select * from answer_judgement where [user]='"+queryUser +"'");
	while(rs22.next()){
		for(int i=0;i<10;i++){
			userjAnswer[i] = rs22.getString("answer"+(i+1));
		}
	}
	ResultSet rs3 = connR.executeQuery("select * from question_short_5 where [user]='"+queryUser +"'");
	while(rs3.next()){
		for(int i=0;i<5;i++){
			short5ID[i] = rs3.getInt("c"+(i+1)+"_ID");
		}
	}
	ResultSet rs33 = connR.executeQuery("select * from answer_short_5 where [user]='"+queryUser +"'");
	while(rs33.next()){
		for(int i=0;i<5;i++){
			userc5Answer[i] = rs33.getString("answer"+(i+1));
		}
	}
	ResultSet rs4 = connR.executeQuery("select * from question_short_10 where [user]='"+queryUser +"'");
	while(rs4.next()){
		for(int i=0;i<2;i++){
			short10ID[i] = rs4.getInt("c"+(i+1)+"_ID");
		}
	}
	ResultSet rs44 = connR.executeQuery("select * from answer_short_10 where [user]='"+queryUser +"'");
	while(rs44.next()){
		for(int i=0;i<2;i++){
			userc10Answer[i] = rs44.getString("answer"+(i+1));
		}
	}
	ResultSet rs5 = connR.executeQuery("select * from question_short_15 where [user]='"+queryUser +"'");
	while(rs5.next()){
		short15ID = rs5.getInt("c1_ID");
	}
	ResultSet rs55 = connR.executeQuery("select * from answer_short_15 where [user]='"+queryUser +"'");
	while(rs55.next()){
		userc15Answer = rs55.getString("answer1");
	}

	%>
	<div class="container">
		<div class="complete" onclick="handleShow()">
			<span>点击查看客观题</span>
			<div class="selectionContainer">
				<h3>一、选择题</h3>
				<%				
				for(int i=0;i<10;i++){
					ResultSet rs6 = connR.executeQuery("select * from selection where ID=" + selectionsID[i]);
					while(rs6.next()){%>
						<ul class="selectionRow row_<%=i+1%>">
							<li><b><%=i+1%></b>、<%=rs6.getString("title")%></li>
							<li>
								<div>
									<input type="radio" class="option1" name="sradio<%=i+1%>" value="A"><span>A、<%=rs6.getString("option_one") %></span>
								</div>
								<div>
									<input type="radio" class="option2" name="sradio<%=i+1%>" value="B"><span>B、<%=rs6.getString("option_two") %></span>
								</div>
								<div>
									<input type="radio" class="option3" name="sradio<%=i+1%>" value="C"><span>C、<%=rs6.getString("option_three") %></span>
								</div>
								<div>
									<input type="radio" class="option4" name="sradio<%=i+1%>" value="D"><span>D、<%=rs6.getString("option_four") %></span>
								</div>
							</li>
							<%if(rs6.getString("answer").equals(usersAnswer[i])){%>
								<li>答案： <%=rs6.getString("answer") %></li>
							<%}else{%>
							    <li style="color:crimson;">答案： <%=rs6.getString("answer") %></li>
							<%}%>														
						</ul>	
					<%}
				}
				%>					
			</div>				
			<div class="judgementContainer">
				<h3>二、判断题，总计得分<%%></h3>	
				<%
				for(int i=0;i<10;i++){
					ResultSet rs7 = connR.executeQuery("select * from judgement where ID = " + judgementsID[i]);
					while(rs7.next()){%>
					<ul class="judgementRow row_<%=i+1%>">
						<li><b><%=i+1%></b>、<%=rs7.getString("title")%></li>
						<li>
							<input type="radio" name="jradio<%=i+1%>" class="option1" value="true"><span>true</span> 
							<input type="radio" name="jradio<%=i+1%>" class="option2" value="false"><span>false</span>
						</li>
						<%if((rs7.getString("answer").trim()).equals(userjAnswer[i])){%>
								<li>答案： <%=rs7.getString("answer") %></li>
						<%}else{%>
							    <li style="color:crimson;">答案： <%=rs7.getString("answer") %></li>
						<%}%>
					</ul>
					<%}
				}%>	
			</div>
		</div>
		<form calss="shortContainer" method="post" action="./review_deal.jsp?user=<%=queryUser%>">
			<h3>三、简答题</h3>
			<div class="shortFive">
			<%
			for(int i=0;i<5;i++){
				ResultSet rs8 = connR.executeQuery("select * from short_5 where ID=" + short5ID[i]);
				while(rs8.next()){%>
				<ul class="shortFiveRow row_<%=i+1%>">
					<li><b><%=i+1%></b>、<%=rs8.getString("title")%><span>(5分)</span></li>
					<li><span>学生答案:</span>
						<div class="answer"><%=userc5Answer[i]%></div>
					</li>
					<li>评分：<input name="short<%=i+1%>" type="number" placeholder="请打分"></li>
				</ul>
				<%}
			}%>		
			</div>
			<div class="shortTen">	
			<%
			for(int i=0;i<2;i++){
				ResultSet rs9 = connR.executeQuery("select * from short_10 where ID="+short10ID[i]);
				while(rs9.next()){%>
				<ul class="shortTenRow row_<%=i+6%>">
					<li><%=i+6%>、<%=rs9.getString("title")%><span>(10分)</span></li>
					<li><span>学生答案:</span><div class="answer"><%=userc10Answer[i]%></div></li>
					<li>评分：<input name="short<%=i+6%>" type="number" placeholder="请打分"></li>
				</ul>
				<%}
			}%>		

			</div>
			<div class="shortFifteen">
			<%
			ResultSet rs10 = connR.executeQuery("select * from short_15 where ID = "+ short15ID);
			while(rs10.next()){%>
				<ul class="shortFifteenRow row_8">
					<li><b>8</b>、<%=rs10.getString("title") %><span>(15分)</span></li>
					<li><span>你的答案:</span>
						<div class="answer"><%=userc15Answer%></div>
					</li>
					<li>评分：<input name="short8" type="number" placeholder="请打分"></li>
				</ul>
			<%}
			%>			

			</div>
		<input type="submit" value="提交">
		</form>
	</div>
</div>
<script>
	var clicked = false
	function handleShow(){	
		clicked = !clicked
		if(clicked){
			document.querySelector('.selectionContainer').style.display = 'block'
			document.querySelector('.judgementContainer').style.display = 'block'
			document.querySelector('.complete > span').innerText = '点击收起客观题'
		}else{
			document.querySelector('.selectionContainer').style.display = 'none'
			document.querySelector('.judgementContainer').style.display = 'none'
			document.querySelector('.complete > span').innerText = '点击查看客观题'
		}

	}
	//选择题、获取用户的选择
	<%for(int i=1;i<=10;i++){
		if("A".equals(usersAnswer[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option1').setAttribute('checked',true)
		<%}if("B".equals(usersAnswer[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option2').setAttribute('checked',true)
		<%}if("C".equals(usersAnswer[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option3').setAttribute('checked',true)
		<%}if("D".equals(usersAnswer[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option4').setAttribute('checked',true)
		<%}
	}%>
	
	//判断题，设置用户选择
	<%for(int i=1;i<=10;i++){
		if(userjAnswer[i-1].equals("true")){%>
			document.querySelector('.judgementRow.row_'+<%=i%>+' input.option1').setAttribute('checked',true)
		<%}if(userjAnswer[i-1].equals("false")){%>
			document.querySelector('.judgementRow.row_'+<%=i%>+' input.option2').setAttribute('checked',true)
		<%}
	}%>
</script>