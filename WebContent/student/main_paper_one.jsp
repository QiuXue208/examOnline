<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connP" scope="page" class="tools.ConnDB" />
<link rel="stylesheet" href="../css/student/main_paper_one.css">
<div class="main">
  <form method="post" id="commitPaperForm">
	<div class="selectionContainer">
		<h2>一、选择题(该题型每题2分，一共10题)。</h2>
		<%		
			String loginUser = (String)session.getAttribute("username");
			int [] selections = new int[10];
			String selectionSql = "select top 10 * from selection order by NEWID()"	;
			ResultSet rs_s = connP.executeQuery(selectionSql);
			int sum = 0;
			while(rs_s.next()){
				sum ++;%>
				<ul class="selectionRow row_<%=sum%>">
					<li><%=sum%>、<%=rs_s.getString("title")%></li>
					<li>
						<div>
							<input type="radio" name="sradio<%=sum%>" value="A" ><span>A、<%=rs_s.getString(3)%></span>
						</div>
						<div>
							<input type="radio" name="sradio<%=sum%>" value="B" ><span>B、<%=rs_s.getString(4)%></span>
						</div>
						<div>
							<input type="radio" name="sradio<%=sum%>" value="C" ><span>C、<%=rs_s.getString(5)%></span>
						</div>	
						<div>
							<input type="radio" name="sradio<%=sum%>" value="D" ><span>D、<%=rs_s.getString(6)%></span>
						</div>													
					</li>
				</ul>
		<%	
			 selections[sum-1] = rs_s.getInt("ID");
			}
			String sql = "insert into question_selection"
						+ "([user],s1_ID,s2_ID,s3_ID,s4_ID,s5_ID,s6_ID,s7_ID,s8_ID,s9_ID,s10_ID) values"
						+ "('" + loginUser
						+ "'," + selections[0]
						+ "," + selections[1]
						+ "," + selections[2]
						+ "," + selections[3]
						+ "," + selections[4]
						+ "," + selections[5]
						+ "," + selections[6]
						+ "," + selections[7]
						+ "," + selections[8]
						+ "," + selections[9]
						+")";
			int result = connP.executeUpdate(sql);%>
	</div>
	<div class="judgementContainer">
		<h2>二、判断题(该题型每题2分，一共10题)。</h2>
		<%String judgementSql = "select top 10 * from judgement order by NEWID()";
			ResultSet rs_j = connP.executeQuery(judgementSql);
			int [] judgements = new int[10];
			int sum2 = 0;
			while(rs_j.next()){
				judgements[sum2] = rs_j.getInt("ID");
				sum2 ++;%>
				<ul class="judgementRow">
					<li><%=sum2%>、<%=rs_j.getString("title")%></li>
					<li>
						<input type="radio" name="jradio<%=sum2%>" value="true"><span>true</span>
						<input type="radio" name="jradio<%=sum2%>" value=""><span>false</span>											
					</li>
				</ul>
		<%}
		String sql2 = "insert into question_judgement"
					+ "([user],j1_ID,j2_ID,j3_ID,j4_ID,j5_ID,j6_ID,j7_ID,j8_ID,j9_ID,j10_ID) values"
					+ "('" + loginUser
					+ "'," + judgements[0]
					+ "," + judgements[1]
					+ "," + judgements[2]
					+ "," + judgements[3]
					+ "," + judgements[4]
					+ "," + judgements[5]
					+ "," + judgements[6]
					+ "," + judgements[7]
					+ "," + judgements[8]
					+ "," + judgements[9]
					+")";
		int result2 = connP.executeUpdate(sql2);
		%>
	</div>
	<div class="shortContainer">
		<h2>三、简答题(前五题每题5分，最后三题分别为10分、10分、15分,一共8题)。</h2>
		<div class="shortFive">
			<%String shortFiveSql = "select top 5 * from short_5 order by NEWID()";
				ResultSet rs_5 = connP.executeQuery(shortFiveSql);
				int [] shorts = new int[5];
				int sum3 = 0;
				while(rs_5.next()){
					shorts[sum3] = rs_5.getInt("ID");
					sum3 ++;%>
					<ul class="shortFiveRow">
						<li><%=sum3%>、<%=rs_5.getString("title")%><span>(5分)</span></li>
						<li>
							<textarea rows="5" cols="100" placeholder="请输入答案" name="textarea_<%=sum3%>"></textarea>									
						</li>
					</ul>
				<%}
				String sql3 = "insert into question_short_5"
							+ "([user],c1_ID,c2_ID,c3_ID,c4_ID,c5_ID) values"
							+ "('" + loginUser
							+ "'," + shorts[0]
							+ "," + shorts[1]
							+ "," + shorts[2]
							+ "," + shorts[3]
							+ "," + shorts[4]
							+")";
				int result3 = connP.executeUpdate(sql3);
				%>
		</div>
		<div class="shortTen">
			<%String shortTenSql = "select top 2 *  from short_10 order by NEWID()";
			ResultSet rs_10 = connP.executeQuery(shortTenSql);
			int [] shortTen = new int[2];
			int sum4 = 0;
			while(rs_10.next()){
				shortTen[sum4] = rs_10.getInt("ID");
				sum4 ++;%>
				<ul class="shortTenRow">
					<li><%=sum3 + sum4%>、<%=rs_10.getString("title")%><span>(10分)</span></li>
					<li>
						<textarea rows="5" cols="100" placeholder="请输入答案" name="textarea_<%=sum3+sum4%>"></textarea>
					</li>
				</ul>
			<%}
			String sql4 = "insert into question_short_10"
					+ "([user],c1_ID,c2_ID) values"
					+ "('" + loginUser
					+ "'," + shortTen[0]
					+ "," + shortTen[1]
					+")";
			int result4 = connP.executeUpdate(sql4);
			%>
		</div>
		<div class="shortFifteen">
				<%String shortFifteenSql = "select top 1 * from short_15 order by NEWID()";
				ResultSet rs_15 = connP.executeQuery(shortFifteenSql);
				int shortFifteen = 0;
				int sum5 = 0;
				while(rs_15.next()){
					shortFifteen = rs_15.getInt("ID");
					sum5 ++;%>
					<ul class="shortFifteenRow">
						<li><%=sum3 + sum4 + sum5%>、<%=rs_15.getString("title")%><span>(15分)</span></li>
						<li>
							<textarea rows="5" cols="100" placeholder="请输入答案" name="textarea_<%=sum3+sum4+sum5%>"></textarea>										
						</li>
					</ul>
				<%}
				String sql5 = "insert into question_short_15"
						+ "([user],c1_ID) values"
						+ "('" + loginUser
						+ "'," + shortFifteen
						+")";
				int result5 = connP.executeUpdate(sql5);
				%>
			</div>
	</div>
	<div class="commitPaperContainer">
		<input type="submit" id="commit_paper" value="提交试卷">
	</div>
  </form>
</div>
<script>
// 	window.addEventListener("beforeunload", function (e) {
// 	    (e || window.event).returnValue = "如果你离开次页面，系统将不会保留你的答案，确定离开吗？"
// 	    return "如果你离开次页面，系统将不会保留你的答案，确定离开吗？"
// 	});
	document.querySelector('#commit_paper').addEventListener('click',function(){
	    window.onbeforeunload = null 	    
		document.querySelector('#commitPaperForm').setAttribute('action','./exam_result.jsp')
		document.querySelector('#commitPaperForm').submit()
		window.close; 
	})
	window.onbeforeunload = function(e) { 
    	return "如果你离开次页面，系统将不会保留你的答案，确定离开吗？";
	} 
</script>