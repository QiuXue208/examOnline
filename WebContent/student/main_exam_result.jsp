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
	String [] selections = new String[10];
	String [] judgements = new String[10];
	String [] shorts = new String[8];
	String selectionI = "";
	int selection_ID = 0;
	String judgementS = "";
	String judgementI = "";
	int judgement_ID = 0;
	String shortFiveS = "";
	String shortFiveI = "";
	int short_ID = 0;
	String shortTenS ="";
	String shortTenI = "";
	String shortFifteenS = "";
	String shortFifteenI = "";
	int selectionScore = 0;
%>	
<div class="selectionContainer">
	<h2>一、选择题，总计得分<%=selectionScore%></h2>
	<% 	//处理选择题和判断题
		for(int i=1;i<=10;i++){
			//得到选择题答案
			selections[i-1] = ChStr.chStr(request.getParameter("sradio" + i));	
			ResultSet rs_s = connR.executeQuery("select s" + i + "_ID from question_selection where [user] = '" + loginUser + "'");
			while(rs_s.next()){
				selection_ID = rs_s.getInt("s"+i+"_ID");
			}
			//将用户选择答案插入到数据库中
			selectionI = "insert into answer_question ([user],selection_ID,answer) values ('"
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
				}
			%>
				<ul class="selectionRow row_<%=i%>">
					<li><%=i%>、<%=rs.getString("title")%></li>
					<li>
						<div>
							<input type="radio" class="option1" name="sradio<%=i%>" value="A" ><span>A、<%=rs.getString(3)%></span>
						</div>
						<div>
							<input type="radio" class="option2" name="sradio<%=i%>" value="B" ><span>B、<%=rs.getString(4)%></span>
						</div>
						<div>
							<input type="radio" class="option3" name="sradio<%=i%>" value="C" ><span>C、<%=rs.getString(5)%></span>
						</div>	
						<div>
							<input type="radio" class="option4" name="sradio<%=i%>" value="D" ><span>D、<%=rs.getString(6)%></span>
						</div>
					</li>
					<li class="analysis">查看解析<div><%=rs.getString("analysis") %></div></li>
				</ul>
			<%}

		}
	%>
</div>	
<%	//得到判断题答案并插入到数据库中
// 	for(int i=1;i<10;i++){					
// 		judgements[i-1] = ChStr.chStr(request.getParameter("jradio_" + i));
// 		judgementS = "select j" + i + "_ID from question_judgement where [user] = '" + loginUser + "'";
// 		ResultSet rs_j = conn.executeQuery(judgementS);
// 		while(rs_j.next()){
// 			judgement_ID = rs_j.getInt("j"+i+"_ID");
// 		}
// 		judgementI = "insert into answer_judgement ([user],judgement_ID,answer) values ('"
// 				+ loginUser + "',"
// 				+ judgement_ID + ",'"
// 				+ judgements[i-1] + "'"
// 				+ ")";
// 		conn.executeUpdate(judgementI);
// 	}
%>
<%
	//5分
// 	for(int i=1;i<=5;i++){
// 		shorts[i-1] = ChStr.chStr(request.getParameter("textarea_" + i));
// 		shortFiveS = "select c" + i + "_ID from question_short_5 where [user] = '" + loginUser + "'";
// 		ResultSet rs_5 = conn.executeQuery(shortFiveS);
// 		while(rs_5.next()){
// 			short_ID = rs_5.getInt("c"+i+"_ID");
// 		}
// 		shortFiveI = "insert into answer_short ([user],short_ID,score,answer) values ('"
// 					+ loginUser + "',"
// 					+ short_ID + ","
// 					+ 5 + ",'"
// 					+ shorts[i-1]
// 					+"')";
// 	}
%>
<%	//10分
// 	for(int i=1;i<=2;i++){
// 		shorts[i+4] = ChStr.chStr(request.getParameter("textarea_" + i));
// 		shortTenS = "select c" + i + "_ID from question_short_10 where [user] = '" + loginUser + "'";
// 		ResultSet rs_10 = conn.executeQuery(shortTenS);
// 		while(rs_10.next()){
// 			short_ID = rs_10.getInt("c"+i+"_ID");
// 		}
// 		shortTenI = "insert into answer_short ([user],short_ID,score,answer) values ('"
// 					+ loginUser + "',"
// 					+ short_ID + ","
// 					+ 10 + ",'"
// 					+ shorts[i+4]
// 					+"')";
// 	}
%>

<%	//15分
// 	shorts[7] = ChStr.chStr(request.getParameter("textarea_" + 7));
// 	shortFifteenS = "select c1_ID from question_short_15 where [user] = '" + loginUser + "'";
// 	ResultSet rs_15 = conn.executeQuery(shortFifteenS);
// 	while(rs_15.next()){
// 		short_ID = rs_15.getInt("c1_ID");
// 	}
// 	shortFifteenI = "insert into answer_short ([user],short_ID,score,answer) values ('"
// 			+ loginUser + "',"
// 			+ short_ID + ","
// 			+ 15 + ",'"
// 			+ shorts[7]
// 			+"')";
// 	conn.executeQuery(shortFifteenI);
%>
</div>
<script>
	//获取用户的选择
	<%for(int i=1;i<=10;i++){
		if("A".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+' input.option1').setAttribute('checked',true)
		<%}if("B".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+'>li>div:nth-child(2)>input').setAttribute('checked',true)
		<%}if("C".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+'>li>div:nth-child(3)>input').setAttribute('checked',true)
		<%}if("D".equals(selections[i-1])){%>
			document.querySelector('.selectionRow.row_'+<%=i%>+'>li>div:nth-child(4)>input').setAttribute('checked',true)
		<%}
	}%>
	document.querySelector('.selectionContainer > h2').innerText = '一、选择题，总计得分<%=selectionScore%>分'
	//点击查看选择题的解析
	var selectionClicked = false
	document.querySelectorAll('.analysis').forEach(function(element){
		element.addEventListener('click',function(e){
			selectionClicked = !selectionClicked
			var target = e.target.parentNode.classList[1]
			if(selectionClicked){
				document.querySelector('.' + target+'>.analysis>div').style.display = 'block'
			}else{
				document.querySelector('.' + target+'>.analysis>div').style.display = 'none'
			}
			
		})
	})
</script>