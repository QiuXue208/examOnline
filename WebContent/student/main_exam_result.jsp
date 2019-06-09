<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connR" scope="page" class="tools.ConnDB" />
<link rel="icon" href="../images/title.png" type="image/x-icon">
<link rel="stylesheet" href="../css/paper.css">
<link rel="stylesheet" href="../css/student/main_exam_result.css">

<title>柚子考试系统</title>

<div class="main">
	<%
	String loginUser = (String)session.getAttribute("username");
	//变量申请			
	String [] selections = new String[10];
	int selectionScore = 0;
	String selectionI = "";
	int selection_ID = 0;
	
	String [] judgements = new String[10];
	String judgementI = "";
	int judgement_ID = 0;
	int judgementScore = 0;
	
	String [] shorts = new String[8];
	int short_ID = 0;
	String shortFiveI = "";	
	String shortTenI = "";
	String shortFifteenI = "";
%>
<div class="container">
	<div class="selectionContainer">
		<h3>一、选择题，总计得分<%=selectionScore%></h3>
		<%for(int i=1;i<=10;i++){
			//得到选择题答案
			selections[i-1] = ChStr.chStr(request.getParameter("sradio" + i));	
			ResultSet rs_s = connR.executeQuery("select s" + i + "_ID from question_selection where [user] = '" + loginUser + "'");
			while(rs_s.next()){
				selection_ID = rs_s.getInt("s"+i+"_ID");
			}
			//获取selection表的数据
			ResultSet rs = connR.executeQuery("select * from selection where ID = " + selection_ID);
			while(rs.next()){
				if(rs.getString("answer").equals(selections[i-1])){
					selectionScore += 2;
				}%>
				<ul class="selectionRow row_<%=i%>">
					<li><b><%=i%></b>、<%=rs.getString("title")%></li>
					<li>
						<div>
							<input type="radio" class="option1" name="sradio<%=i%>" value="A"><span>A、<%=rs.getString(3)%></span>
						</div>
						<div>
							<input type="radio" class="option2" name="sradio<%=i%>" value="B"><span>B、<%=rs.getString(4)%></span>
						</div>
						<div>
							<input type="radio" class="option3" name="sradio<%=i%>" value="C"><span>C、<%=rs.getString(5)%></span>
						</div>
						<div>
							<input type="radio" class="option4" name="sradio<%=i%>" value="D"><span>D、<%=rs.getString(6)%></span>
						</div>
					</li>
					<%
					if(selections[i-1].equals(rs.getString("answer"))){%>
						<li>答案：<%=rs.getString("answer") %></li>
						<li class="analysis"><span>查看解析</span><div><%=rs.getString("analysis") %></div></li>
					<%}else{%>
						<li style="color:crimson;">答案：<%=rs.getString("answer") %></li>						
						<li style="color:brown;" class="analysis"><span>查看解析</span><div><%=rs.getString("analysis") %></div></li>
					<%}%>					
					
				</ul>
		   <%}
		}
		//将选择题的答案插入到数据库中
		selectionI = "insert into answer_selection ([user],answer1,answer2,answer3,answer4,answer5,answer6,answer7,answer8,answer9,answer10) values ('"
				+ loginUser + "','"
				+ selections[0] + "','"
				+ selections[1] + "','"
				+ selections[2] + "','"
				+ selections[3] + "','"
				+ selections[4] + "','"
				+ selections[5] + "','"
				+ selections[6] + "','"
				+ selections[7] + "','"
				+ selections[8] + "','"
				+ selections[9] + "')";
		connR.executeUpdate(selectionI);
		%>
	</div>
	<div class="judgementContainer">
		<h3>二、判断题，总计得分<%=judgementScore%></h3>
		<%	//得到判断题答案并插入到数据库中
		for(int j=1;j<=10;j++){
			//获取到用户判断题的答案
			judgements[j-1] = ChStr.chStr(request.getParameter("jradio" + j));
			ResultSet rs_j = connR.executeQuery("select j" + j + "_ID from question_judgement where [user] = '" + loginUser + "'");
			//获取判断题的ID
			while(rs_j.next()){
				judgement_ID = rs_j.getInt("j"+j+"_ID");
			}
			ResultSet rs = connR.executeQuery("select * from judgement where ID = " + judgement_ID);
			while(rs.next()){
				if(judgements[j-1].equals(rs.getString("answer").trim())){
					judgementScore += 2;
				}%>
				<ul class="judgementRow row_<%=j%>">
					<li><b><%=j%></b>、<%=rs.getString("title")%></li>
					<li>
						<input type="radio" name="jradio<%=j%>" class="option1" value="true"><span>true</span> 
						<input type="radio" name="jradio<%=j%>" class="option2" value="false"><span>false</span>
					</li>
					<%
					if(judgements[j-1].equals(rs.getString("answer").trim())){%>
						<li class="answer">答案：<%=rs.getString("answer")%></li>
						<li class="analysis"><span>查看解析</span><div><%=rs.getString("analysis") %></div></li>
					<%}else{%>
						<li class="answer" style="color:crimson;">答案：<%=rs.getString("answer")%></li>
						<li class="analysis" style="color:brown;"><span>查看解析</span><div><%=rs.getString("analysis") %></div></li>
					<%}%>
					
					
				</ul>
		  <%}			
		}
		//将判断题答案插入到数据库中
		judgementI = "insert into answer_judgement ([user],answer1,answer2,answer3,answer4,answer5,answer6,answer7,answer8,answer9,answer10) values ('"
				+ loginUser + "','"
				+ judgements[0] + "','"
				+ judgements[1] + "','"
				+ judgements[2] + "','"
				+ judgements[3] + "','"
				+ judgements[4] + "','"
				+ judgements[5] + "','"
				+ judgements[6] + "','"
				+ judgements[7] + "','"
				+ judgements[8] + "','"
				+ judgements[9] + "')";
		connR.executeUpdate(judgementI);
		%>
	</div>
	<div class="shortContainer">
		<h3>三、简答题，这部分将由老师批改，请耐心等待。</h3>
		<div class="shortFive">
		<%
		//5分
		for(int i=1;i<=5;i++){
			//获取用户输入的答案
			shorts[i-1] = ChStr.convertStr(ChStr.chStr(request.getParameter("textarea" + i)));
			//获取到对应简答题的ID
			ResultSet rs_5 = connR.executeQuery("select c" + i + "_ID from question_short_5 where [user] = '" + loginUser + "'");
			while(rs_5.next()){
				short_ID = rs_5.getInt("c"+i+"_ID");
			}
			ResultSet rs = connR.executeQuery("select * from short_5 where ID = " + short_ID);
			while(rs.next()){%>
			<ul class="shortFiveRow row_<%=i%>">
				<li><b><%=i%></b>、<%=rs.getString("title")%><span>(5分)</span></li>
				<li><span>答:</span>
					<div class="answer"><%=shorts[i-1]%></div></li>
				<li class="analysis"><span>查看解析</span>
					<div><%=rs.getString("analysis") %></div></li>
			</ul>
			<%}
		}
		//将用户输入答案插入到数据库中
		shortFiveI = "insert into answer_short_5 ([user],answer1,answer2,answer3,answer4,answer5) values ('"
					+ loginUser + "','"
					+ shorts[0] + "','"
					+ shorts[1] + "','"
					+ shorts[2] + "','"
					+ shorts[3] + "','"
					+ shorts[4] + "')";
		connR.executeUpdate(shortFiveI);
		%>
		</div>
		<div class="shortTen">
			<%	//10分
			for(int i=1;i<=2;i++){
				shorts[i+4] = ChStr.convertStr(ChStr.chStr(request.getParameter("textarea" + (i+5))));
				ResultSet rs_10 = connR.executeQuery("select c" + i + "_ID from question_short_10 where [user] = '" + loginUser + "'");
				while(rs_10.next()){
					short_ID = rs_10.getInt("c"+i+"_ID");
				}
				ResultSet rs = connR.executeQuery("select * from short_10 where ID = " + short_ID);
				while(rs.next()){%>
				<ul class="shortTenRow row_<%=i+5%>">
					<li><b><%=i+5%></b>、<%=rs.getString("title")%><span>(10分)</span></li>
					<li><span>答:</span>
						<div class="answer"><%=shorts[i+4]%></div></li>
					<li class="analysis"><span>查看解析</span>
						<div><%=rs.getString("analysis") %></div></li>
				</ul>
				<%}
			}
			//将用户输入插入到数据库中
			shortTenI = "insert into answer_short_10 ([user],answer1,answer2) values ('"
					+ loginUser + "','"
					+ shorts[5] + "','"
					+ shorts[6] + "')";
			connR.executeUpdate(shortTenI);
			%>
		</div>
		<div class="shortFifteen">
			<%	//15分
			shorts[7] = ChStr.convertStr(ChStr.chStr(request.getParameter("textarea8")));
			ResultSet rs_15 = connR.executeQuery("select c1_ID from question_short_15 where [user] = '" + loginUser + "'");
			while(rs_15.next()){
				short_ID = rs_15.getInt("c1_ID");
			}
			ResultSet rs = connR.executeQuery("select * from short_15 where ID = " + short_ID);
			while(rs.next()){%>
				<ul class="shortFifteenRow row_8">
					<li><b>8</b>、<%=rs.getString("title")%><span>(15分)</span></li>
					<li><span>答:</span>
						<div class="answer"><%=shorts[7]%></div></li>
					<li class="analysis"><span>查看解析</span>
						<div><%=rs.getString("analysis") %></div></li>
				</ul>
			<%}
			//将用户输入插入数据库中
			shortFifteenI = "insert into answer_short_15 ([user],answer1) values ('"
					+ loginUser + "','"
					+ shorts[7] + "')";
			connR.executeUpdate(shortFifteenI);
		 %>
		</div>
	</div>
<%
    //将成绩插入数据库中
	String scoreSql = "insert into score values('"
					+ loginUser
					+"'," + selectionScore
					+"," + judgementScore
					+"," + 0
					+"," + 0
					+"," + 0
					+"," + (selectionScore+judgementScore)
					+"," + 0
					+")";
	connR.executeUpdate(scoreSql);
%>
</div>
<button class="resultReturn" onclick="resultReturn()">返回</button>
</div>
<script>
	function resultReturn(){
		window.location.href='./exam.jsp'
	}
	//选择题、获取用户的选择
	<%for(int i=1;i<=10;i++){
		if("A".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option1').setAttribute('checked',true)
		<%}if("B".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option2').setAttribute('checked',true)
		<%}if("C".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option3').setAttribute('checked',true)
		<%}if("D".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option4').setAttribute('checked',true)
		<%}
	}%>
	document.querySelector('.selectionContainer > h3').innerText = '一、选择题，总计得分<%=selectionScore%>分'
	
	//判断题，设置用户选择
	<%for(int i=1;i<=10;i++){
		if(judgements[i-1].equals("true")){%>
			document.querySelector('.judgementRow.row_'+<%=i%>+' input.option1').setAttribute('checked',true)
		<%}if(judgements[i-1].equals("false")){%>
			document.querySelector('.judgementRow.row_'+<%=i%>+' input.option2').setAttribute('checked',true)
		<%}
	}%>
	//点击查看选择题和判断题的解析
	var clicked = false
	document.querySelectorAll('.analysis > span').forEach(function(element){
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
	document.querySelector('.judgementContainer > h3').innerText = ' 二、判断题，总计得分' + <%=judgementScore%> + '分 '
</script>