<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connS" scope="page" class="tools.ConnDB" />
<jsp:useBean id="GetQuery" scope="page" class="tools.GetQueryPara" />
<link rel="stylesheet" href="../css/template/question_form.css">
<link rel="stylesheet" href="../css/teacher/main_short.css">
<div class="main">
<%
	String [] needsStr = GetQuery.getQueryPara(request.getQueryString());
	int score = Integer.parseInt(needsStr[1]);
	if(score == 5){
		ResultSet rs_s = connS.executeQuery("select * from short_5 order by ID desc");
		int sum = 0;
		while(rs_s.next()){
			sum ++;
			%>
			<div class="row five row_<%=sum%>">
				<ul>
					<li><%=sum%>、<span><%=rs_s.getString("title") %></span></li>
					<li>答案:<span><%=rs_s.getString("answer")%></span></li>
					<li>解析:<span><%=rs_s.getString("analysis")%></span></li>
	  				<li id="funcButton">
	  					<button id="modifyShort">修改</button>
						<button id="deleteShort">删除</button>
	  				</li>
				</ul>
			</div>
		<%}
	}if(score == 10){
		ResultSet rs_s = connS.executeQuery("select * from short_10 order by ID desc");
		int sum = 0;
		while(rs_s.next()){
			sum ++;
			%>
			<div class="row ten row_<%=sum%>">
				<ul>
					<li><%=sum%>、<span><%=rs_s.getString("title") %></span></li>
					<li>答案:<span><%=rs_s.getString("answer")%></span></li>
					<li>解析:<span><%=rs_s.getString("analysis")%></span></li>
	  				<li id="funcButton">
	  					<button id="modifyShort">修改</button>
						<button id="deleteShort">删除</button>
	  				</li>
				</ul>
			</div>
		<%}
	}if(score == 15){
		ResultSet rs_s = connS.executeQuery("select * from short_15 order by ID desc");
		int sum = 0;
		while(rs_s.next()){
			sum ++;
			%>
			<div class="row fifteen row_<%=sum%>">
				<ul>
					<li><%=sum%>、<span><%=rs_s.getString("title") %></span></li>
					<li>答案:<span><%=rs_s.getString("answer")%></span></li>
					<li>解析:<span><%=rs_s.getString("analysis")%></span></li>
	  				<li id="funcButton">
	  					<button id="modifyShort">修改</button>
						<button id="deleteShort">删除</button>
	  				</li>
				</ul>
			</div>
		<%}
	}%>
  	<form class="question_form" id="short_form" name="shortForm" method="post">
  		<div class="hint">
			<span><img src="../images/hint.png" alt="hint"></span>
			<span class="text">该卡片用于添加判断题哦</span>
		</div>
		<div>
			<div><span>题目</span><label>:</label></div>
			<textarea name="title" rows="3" cols="50" placeholder="请输入题名"></textarea><sup>*</sup>
		</div>
		<div>
			<div><span>答案</span><label>:</label></div>
			<textarea name="answer" rows="3" cols="50" placeholder="请输入答案"></textarea><sup style="opacity: 0;">*</sup>
		</div>
		<div>
			<div><span>解析</span><label>:</label></div>
			<textarea name="analysis" rows="3" cols="50" placeholder="请输入解析"></textarea><sup style="opacity: 0;">*</sup>
		</div>
		<div>
			<div><span>分值</span><label>:</label></div>
			<textarea name="score" rows="1" cols="50" placeholder="请输入该题的分值"></textarea><sup>*</sup>
		</div>
		<div>
			<input value="重新填写" type="button" onclick="clearAllContent()">
			<input type="button" value="提交修改" name="commit" id="submitShort" onclick="handleShortForm(shortForm)">
			<input type="button" value="取消" onclick="cancelSubmitForm()">
		</div>
	</form>
</div>
<script src="../js/public.js"></script>
<script src="../js/handleShort.js"></script>
<script src="../js/handleStyle.js"></script>