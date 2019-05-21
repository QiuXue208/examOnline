<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connR" scope="page" class="tools.ConnDB" />
<link rel="icon" href="../images/title.png" type="image/x-icon">
<link rel="stylesheet" href="../css/student/main_exam_result.css">
<title>柚子考试系统</title>
<div class="main">
	<%
	//记录登录名
	String loginUser = (String)session.getAttribute("username");
	//变量申请
		
	String [] shorts = new String[8];
	String [] selections = new String[10];
	int selectionScore = 0;
	String selectionI = "";
	int selection_ID = 0;
	
	String [] judgements = new String[10];
	String judgementI = "";
	int judgement_ID = 0;
	int judgementScore = 0;

	int short_ID = 0;
	String shortFiveI = "";	
	String shortTenI = "";
	String shortFifteenI = "";
	String answer = "";
%>
	<div class="selectionContainer">
		<h2>
			一、选择题，总计得分<%=selectionScore%></h2>
		<%for(int i=1;i<=10;i++){
			//得到选择题答案
			selections[i-1] = ChStr.chStr(request.getParameter("sradio" + i));	
			ResultSet rs_s = connR.executeQuery("select s" + i + "_ID from question_selection where [user] = '" + loginUser + "'");
			while(rs_s.next()){
				selection_ID = rs_s.getInt("s"+i+"_ID");
			}
			//将用户选择答案插入到数据库中
			selectionI = "insert into answer_selection ([user],selection_ID,answer) values ('"
					+ loginUser + "',"
					+ selection_ID + ",'"
					+ selections[i-1] + "'"
					+ ")";
			connR.executeUpdate(selectionI);
			//获取selection表的数据
			ResultSet rs = connR.executeQuery("select * from selection where ID = " + selection_ID);
			while(rs.next()){
				if(rs.getString("answer").equals(selections[i-1])){
					selectionScore += 2;
				}%>
				<ul class="selectionRow row_<%=i%>">
					<li><%=i%>、<%=rs.getString("title")%></li>
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
					<li>答案：<%=rs.getString("answer") %></li>
					<li class="analysis"><span>查看解析</span>
					<div><%=rs.getString("analysis") %></div></li>
				</ul>
		   <%}
// 			connR.executeUpdate("insert into score set selection_score = " + selectionScore + "where [user] = '" + loginUser + "'");
		}%>
	</div>
	<div class="judgementContainer">
		<h2>二、判断题，总计得分<%=judgementScore%></h2>
		<%	//得到判断题答案并插入到数据库中
		for(int i=1;i<=10;i++){
			//获取到用户判断题的答案
			judgements[i-1] = ChStr.chStr(request.getParameter("jradio" + i));
			ResultSet rs_j = connR.executeQuery("select j" + i + "_ID from question_judgement where [user] = '" + loginUser + "'");
			//获取判断题的ID
			while(rs_j.next()){
				judgement_ID = rs_j.getInt("j"+i+"_ID");
			}
			//将判断题的ID、答案插入到数据库中
			judgementI = "insert into answer_judgement ([user],judgement_ID,answer) values ('"
					+ loginUser + "',"
					+ judgement_ID + ",'"
					+ judgements[i-1]
					+ "')";
			connR.executeUpdate(judgementI);
			ResultSet rs = connR.executeQuery("select * from judgement where ID = " + judgement_ID);
			while(rs.next()){
// 			    String target = rs.getString("answer");
// 				out.println(target);
// 				if(rs.getString("answer").equals(ChStr.chStr("对"))){
// 					answer = "true";
// 				}if(rs.getString("answer").equals("true")){
// 					answer = "true";
// 				}
// 				if(rs.getString("answer").equals(ChStr.chStr("错"))){
// 					answer = "false";
// 				}
// 				if(rs.getString("answer").equals("false")){
// 					answer = "false";
// 				}
// 				out.println(answer);
				if(rs.getString("answer").equals(judgements[i-1])){
					judgementScore += 2;
				}%>
				<ul class="judgementRow row_<%=i%>">
					<li><%=i%>、<%=rs.getString("title")%></li>
					<li>
						<input type="radio" name="jradio<%=i%>" class="option1" value="true"><span>true</span> 
						<input type="radio" name="jradio<%=i%>" class="option2" value="false"><span>false</span>
					</li>
					<li>答案：<%=rs.getString("answer")%></li>
					<li class="analysis"><span>查看解析</span>
					<div><%=rs.getString("analysis") %></div></li>
				</ul>
		  <%}
// 			connR.executeUpdate("insert into score set judgement_score = " + judgementScore + "where [user] = '" + loginUser + "'");
		}%>
	</div>
	<div calss="shortContainer">
		<h2>三、简答题，这部分将由老师批改，请耐心等待。</h2>
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
			//将用户输入答案、题的分值以及ID插入到数据库中
			shortFiveI = "insert into answer_short ([user],short_ID,score,answer) values ('"
						+ loginUser + "',"
						+ short_ID + ","
						+ 5 + ",'"
						+ shorts[i-1]
						+"')";
			connR.executeUpdate(shortFiveI);
			ResultSet rs = connR.executeQuery("select * from short_5 where ID = " + short_ID);
			while(rs.next()){%>
			<ul class="shortFiveRow row_<%=i%>">
				<li><%=i%>、<%=rs.getString("title")%><span>(5分)</span></li>
				<li><span>你的答案:</span>
					<div class="answer"><%=shorts[i-1]%></div></li>
				<li class="analysis"><span>查看解析</span>
					<div><%=rs.getString("analysis") %></div></li>
			</ul>
			<%}
		}
	%>
		</div>
		<div class="shortTen">
			<%	//10分
			for(int i=1;i<=2;i++){
				shorts[i+4] = ChStr.convertStr(ChStr.chStr(request.getParameter("textarea" + (i+5))));
				out.println(shorts[i+4]);
				ResultSet rs_10 = connR.executeQuery("select c" + i + "_ID from question_short_10 where [user] = '" + loginUser + "'");
				while(rs_10.next()){
					short_ID = rs_10.getInt("c"+i+"_ID");
				}
				shortTenI = "insert into answer_short ([user],short_ID,score,answer) values ('"
							+ loginUser + "',"
							+ short_ID + ","
							+ 10 + ",'"
							+ shorts[i+4]
							+"')";
				connR.executeUpdate(shortTenI);
				ResultSet rs = connR.executeQuery("select * from short_10 where ID = " + shorts[i+4]);
				while(rs.next()){%>
			<ul class="shortTenRow row_<%=i+5%>">
				<li><%=i+5%>、<%=rs.getString("title")%><span>(10分)</span></li>
				<li><span>你的答案:</span>
					<div class="answer"><%=shorts[i+4]%></div></li>
				<li class="analysis"><span>查看解析</span>
					<div><%=rs.getString("analysis") %></div></li>
			</ul>
			<%}
			}%>
		</div>
		<div class="shortFifteen">
			<%	//15分
			shorts[7] = ChStr.convertStr(ChStr.chStr(request.getParameter("textarea" + 8)));
			out.println(shorts[7]);
			ResultSet rs_15 = connR.executeQuery("select c1_ID from question_short_15 where [user] = '" + loginUser + "'");
			while(rs_15.next()){
				short_ID = rs_15.getInt("c1_ID");
			}
			shortFifteenI = "insert into answer_short ([user],short_ID,score,answer) values ('"
					+ loginUser + "',"
					+ short_ID + ","
					+ 15 + ",'"
					+ shorts[7]
					+"')";
			connR.executeUpdate(shortFifteenI);
			ResultSet rs = connR.executeQuery("select * from short_15 where ID = " + shorts[7]);
			while(rs.next()){%>
			<ul class="shortFifteenRow row_8">
				<li>7、<%=rs.getString("title")%><span>(15分)</span></li>
				<li><span>你的答案:</span>
					<div class="answer"><%=shorts[7]%></div></li>
				<li class="analysis"><span>查看解析</span>
					<div><%=rs.getString("analysis") %></div></li>
			</ul>
			<%}
		%>
		</div>
	</div>
</div>
<script>
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
	document.querySelector('.selectionContainer > h2').innerText = '一、选择题，总计得分<%=selectionScore%>分'
	
	//判断题，设置用户选择
	<%for(int i=1;i<=10;i++){
		if(judgements[i-1].equals("true")){%>
			document.querySelector('.judgementRow.row_'+<%=i%>+' input.option1').setAttribute('checked',true)
		<%}if(judgements[i-1].equals("false")){%>
			document.querySelector('.judgementRow.row_'+<%=i%>+' input.option2').setAttribute('checked',true)
		<%}
	}%>
	document.querySelector('.judgementContainer > h2').innerText = '一、选择题，总计得分<%=judgementScore%>分'
	
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
</script>