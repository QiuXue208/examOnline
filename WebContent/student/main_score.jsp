<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connS" scope="page" class="tools.ConnDB" />
<link rel="stylesheet" href="../css/paper.css">
<link rel="stylesheet" href="../css/student/main_score.css">
<div class="main">
<%
	//登录用户
	String loginUser = (String)session.getAttribute("username");
	//成绩相关
    int complete = 0;
    int selectionScore = 0;
    int judgementScore = 0;
    int allScore = 0;
    int short5Score = 0;
    int short10Score = 0;
    int short15Score = 0;
    //试题相关
	int [] selectionsID = new int[10];
	String []usersAnswer = new String[10];
	String []selectionsAnalysis = new String[10];
	
	int [] judgementsID = new int[10];
	String []userjAnswer = new String[10];
	String []judgementsAnalysis = new String[10];
	
	int [] short5ID = new int[5];
	String [] userc5Answer = new String[5];
	String []short5Analysis = new String[5];
	
	int [] short10ID = new int[2];
	String [] userc10Answer = new String[2];
	String [] short10Analysis = new String[2];
	
	int short15ID = 0;
	String userc15Answer = "";
	String short15Analysis = "";
	for(int i=0;i<10;i++){
		userjAnswer[i] = "";
		usersAnswer[i] = "";
	}

	ResultSet rs = connS.executeQuery("select * from question_selection where [user]='"+loginUser +"'");
	while(rs.next()){
		for(int i=0;i<10;i++){
			selectionsID[i] = rs.getInt("s"+(i+1)+"_ID");
			ResultSet rs11 = connS.executeQuery("select analysis from selection where ID = "+ selectionsID[i]);
			while(rs11.next()){
				selectionsAnalysis[i] = rs11.getString("analysis");
			}
		}
	}
	ResultSet rs111 = connS.executeQuery("select * from answer_selection where [user]='"+loginUser +"'");
	while(rs111.next()){
		for(int i=0;i<10;i++){
			usersAnswer[i] = rs111.getString("answer"+(i+1));
		}
	}
	ResultSet rs2 = connS.executeQuery("select * from question_judgement where [user]='"+loginUser +"'");
	while(rs2.next()){
		for(int i=0;i<10;i++){
			judgementsID[i] = rs2.getInt("j"+(i+1)+"_ID");
			ResultSet rs22 = connS.executeQuery("select analysis from judgement where ID = "+ judgementsID[i]);
			while(rs22.next()){
				judgementsAnalysis[i] = rs22.getString("analysis");
			}
		}
	}
	ResultSet rs222 = connS.executeQuery("select * from answer_judgement where [user]='"+loginUser +"'");
	while(rs222.next()){
		for(int i=0;i<10;i++){
			userjAnswer[i] = rs222.getString("answer"+(i+1));
		}
	}
	ResultSet rs3 = connS.executeQuery("select * from question_short_5 where [user]='"+loginUser +"'");
	while(rs3.next()){
		for(int i=0;i<5;i++){
			short5ID[i] = rs3.getInt("c"+(i+1)+"_ID");
			ResultSet rs33 = connS.executeQuery("select analysis from short_5 where ID = "+ short5ID[i]);
			while(rs33.next()){
				short5Analysis[i] = rs33.getString("analysis");
			}
		}
	}
	ResultSet rs333 = connS.executeQuery("select * from answer_short_5 where [user]='"+loginUser +"'");
	while(rs333.next()){
		for(int i=0;i<5;i++){
			userc5Answer[i] = rs333.getString("answer"+(i+1));
		}
	}
	ResultSet rs4 = connS.executeQuery("select * from question_short_10 where [user]='"+loginUser +"'");
	while(rs4.next()){
		for(int i=0;i<2;i++){
			short10ID[i] = rs4.getInt("c"+(i+1)+"_ID");
			ResultSet rs44 = connS.executeQuery("select analysis from short_10 where ID = "+ short10ID[i]);
			while(rs44.next()){
				short10Analysis[i] = rs44.getString("analysis");
			}
		}
	}
	ResultSet rs444 = connS.executeQuery("select * from answer_short_10 where [user]='"+loginUser +"'");
	while(rs444.next()){
		for(int i=0;i<2;i++){
			userc10Answer[i] = rs444.getString("answer"+(i+1));
		}
	}
	ResultSet rs5 = connS.executeQuery("select * from question_short_15 where [user]='"+loginUser +"'");
	while(rs5.next()){
		short15ID = rs5.getInt("c1_ID");
		ResultSet rs55 = connS.executeQuery("select analysis from short_5 where ID = "+ short15ID);
		while(rs55.next()){
			short15Analysis = rs55.getString("analysis");
		}
	}
	ResultSet rs55 = connS.executeQuery("select * from answer_short_15 where [user]='"+loginUser +"'");
	while(rs55.next()){
		userc15Answer = rs55.getString("answer1");
	}
	
    ResultSet rs6 = connS.executeQuery("select * from complete_user where [user] = '"+ loginUser +"'");
    if(!rs6.next()){
    System.out.print(1);%>
    	<div class="unfinished"><span>你还未参加考试哦！</span><a href="./exam.jsp">点我参加考试</a></div>
    <%}else{
    	ResultSet rs_c = connS.executeQuery("select * from score where [user] = '"+loginUser +"'");
    	while(rs_c.next()){
    		complete = rs_c.getInt("complete");
    		selectionScore = rs_c.getInt("selection_score");
    		judgementScore = rs_c.getInt("judgement_score");
    		allScore = rs_c.getInt("all_score");
    		short5Score = rs_c.getInt("short_5_score");
    		short10Score = rs_c.getInt("short_10_score");
    		short15Score = rs_c.getInt("short_15_score");
    	}
       	//参加过考试的，直接给考生呈现一张试卷出来，并呈现出各个部分的分数%>
      	<%if(complete == 0){%>
			<h2 class="finalScore">老师还未批阅，你可以查看试卷完成情况</h2>
		<%}if(complete == 1){%>
			<h2 class="finalScore">你的总分为<%=allScore%>分</h2>
		<%}%>
    	<div class="container">
			<div class="selectionContainer">
				<h3>一、选择题，共计得分<%=selectionScore %>分。</h3>
				<%				
				for(int i=0;i<10;i++){
					ResultSet rs7 = connS.executeQuery("select * from selection where ID=" + selectionsID[i]);
					while(rs7.next()){%>
						<ul class="selectionRow row_<%=i+1%>">
							<li><b><%=i+1%></b>、<%=rs7.getString("title")%></li>
							<li>
								<div>
									<input type="radio" class="option1" name="sradio<%=i+1%>" value="A"><span>A、<%=rs7.getString("option_one") %></span>
								</div>
								<div>
									<input type="radio" class="option2" name="sradio<%=i+1%>" value="B"><span>B、<%=rs7.getString("option_two") %></span>
								</div>
								<div>
									<input type="radio" class="option3" name="sradio<%=i+1%>" value="C"><span>C、<%=rs7.getString("option_three") %></span>
								</div>
								<div>
									<input type="radio" class="option4" name="sradio<%=i+1%>" value="D"><span>D、<%=rs7.getString("option_four") %></span>
								</div>
							</li>
							<%if(rs7.getString("answer").equals(usersAnswer[i])){%>
								<li>答案： <%=rs7.getString("answer") %></li>
								<li class="analysis"><span>查看解析</span><div><%=selectionsAnalysis[i]%></div></li>
							<%}else{%>
							    <li style="color:crimson;">答案： <%=rs7.getString("answer") %></li>
							    <li style="color:brown;" class="analysis"><span>查看解析</span><div><%=selectionsAnalysis[i]%></div></li>
							<%}%>
																					
						</ul>	
					<%}
				}
				%>					
			</div>				
			<div class="judgementContainer">
				<h3>二、判断题，共计得分<%=judgementScore %>分。</h3>	
				<%
				for(int i=0;i<10;i++){
					ResultSet rs8 = connS.executeQuery("select * from judgement where ID = " + judgementsID[i]);
					while(rs8.next()){%>
					<ul class="judgementRow row_<%=i+1%>">
						<li><b><%=i+1%></b>、<%=rs8.getString("title")%></li>
						<li>
							<input type="radio" name="jradio<%=i+1%>" class="option1" value="true"><span>true</span> 
							<input type="radio" name="jradio<%=i+1%>" class="option2" value="false"><span>false</span>
						</li>
						<%if((rs8.getString("answer").trim()).equals(userjAnswer[i])){%>
								<li>答案： <%=rs8.getString("answer") %></li>
								<li class="analysis"><span>查看解析</span><div><%=judgementsAnalysis[i]%></div></li>
						<%}else{%>
							    <li style="color:crimson;">答案： <%=rs8.getString("answer") %></li>
							    <li style="color:brown;" class="analysis"><span>查看解析</span><div><%=judgementsAnalysis[i]%></div></li>
						<%}%>
							
					</ul>
					<%}
				}%>	
			</div>
			<div class="shortContainer">
			<%if(complete == 0){%>
				<h3>三、简答题,请耐心等待老师阅卷。</h3>
			<%}if(complete == 1){%>
				<h3>三、简答题，共计得分<%=short5Score+short10Score+short15Score %>分，其中5分值共<%=short5Score %>分，10分值共<%=short10Score %>分，15分值共<%=short15Score %>分</h3>
			<%}%>
				<div class="shortFive">
				<%
				for(int i=0;i<5;i++){
					ResultSet rs9 = connS.executeQuery("select * from short_5 where ID=" + short5ID[i]);
					while(rs9.next()){%>
					<ul class="shortFiveRow row_<%=i+1%>">
						<li><b><%=i+1%></b>、<%=rs9.getString("title")%><span>(5分)</span></li>
						<li><span>答:</span>
							<div class="answer"><%=userc5Answer[i]%></div>
						</li>
						<li class="analysis"><span>查看解析</span><div><%=short5Analysis[i] %></div></li>
					</ul>
					<%}
				}%>		
				</div>
				<div class="shortTen">	
				<%
				for(int i=0;i<2;i++){
					ResultSet rs10 = connS.executeQuery("select * from short_10 where ID="+short10ID[i]);
					while(rs10.next()){%>
					<ul class="shortTenRow row_<%=i+6%>">
						<li><b><%=i+6%></b>、<%=rs10.getString("title")%><span>(10分)</span></li>
						<li><span>答:</span><div class="answer"><%=userc10Answer[i]%></div></li>
						<li class="analysis"><span>查看解析</span><div><%=short10Analysis[i] %></div></li>
					</ul>
					<%}
				}%>		
	
				</div>
				<div class="shortFifteen">
				<%
				ResultSet rs12 = connS.executeQuery("select * from short_15 where ID = "+ short15ID);
				while(rs12.next()){%>
					<ul class="shortFifteenRow row_8">
						<li><b>8</b>、<%=rs12.getString("title") %><span>(15分)</span></li>
						<li><span>答:</span>
							<div class="answer"><%=userc15Answer%></div>
						</li>
						<li class="analysis"><span>查看解析</span><div><%=short15Analysis%></div></li>
					</ul>
				<%}%>				
				</div>
			</div>
		<button class="resultReturn" onclick="resultReturn()">返回</button>
		</div>
	    <%}%>
</div>
<script>
	function resultReturn(){
		window.location.href='./exam.jsp'
	}
	//选择题、获取用户的选择
	<%for(int i=0;i<10;i++){
		if("A".equals(usersAnswer[i])){%>
			document.querySelector('.selectionRow.row_'+<%=i+1%>+' input.option1').setAttribute('checked',true)
		<%}if("B".equals(usersAnswer[i])){%>
			document.querySelector('.selectionRow.row_'+<%=i+1%>+' input.option2').setAttribute('checked',true)
		<%}if("C".equals(usersAnswer[i])){%>
			document.querySelector('.selectionRow.row_'+<%=i+1%>+' input.option3').setAttribute('checked',true)
		<%}if("D".equals(usersAnswer[i])){%>
			document.querySelector('.selectionRow.row_'+<%=i+1%>+' input.option4').setAttribute('checked',true)
		<%}
	}%>
	
	//判断题，设置用户选择
	<%for(int i=0;i<10;i++){
		if(userjAnswer[i].equals("true")){%>
			document.querySelector('.judgementRow.row_'+<%=i+1%>+' input.option1').setAttribute('checked',true)
		<%}if(userjAnswer[i].equals("false")){%>
			document.querySelector('.judgementRow.row_'+<%=i+1%>+' input.option2').setAttribute('checked',true)
		<%}
	}%>
	//查看解析
	var clicked = false
	document.querySelectorAll('li.analysis > span').forEach(function(element){
		element.addEventListener('click',function(e){
			clicked = !clicked
			var target = e.target.parentNode.parentNode.classList[0]
			var target1 = e.target.parentNode.parentNode.classList[1]
			if(clicked){
				document.querySelector('.' + target + '.' + target1 + ' .analysis>div').style.display = 'block'
			}else{
				document.querySelector('.' + target + '.' + target1 + ' .analysis>div').style.display = 'none'
			}
			
		})
	})
</script>