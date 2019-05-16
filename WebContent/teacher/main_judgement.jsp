<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connJ" scope="page" class="tools.ConnDB" />
<link rel="stylesheet" href="../css/teacher/main_judgement.css">
<link rel="stylesheet" href="../css/template/question_form.css">
<div class="main">
  <%
  	ResultSet rs_j = connJ.executeQuery("select * from judgement order by ID desc");
  	int sum = 0; 
  	while(rs_j.next()){
  		sum ++;%>
  		<div class="row row_<%=sum%>">
  			<ul>
  				<li><%=sum%>、<span><%=rs_j.getString("title") %></span></li>
  				<li>答案:<span><%=rs_j.getString("answer") %></span></li>
  				<li>解析:<span><%=rs_j.getString("analysis") %></span></li>
  				<li id="funcButton">
  					<button id="modifyJudgement">修改</button>
					<button id="deleteJudgement">删除</button>
  				</li>
  			</ul>
  		</div>  		
  <%}%>
  	<form class="question_form" id="judgement_form" name="judgementForm" method="post">
		<div>
			<div><span>题目</span><label>:</label></div>
			<textarea name="title" rows="3" cols="50" placeholder="请输入题名"></textarea>
		</div>
		<div>
			<div><span>答案</span><label>:</label></div>
			<textarea name="answer" rows="1" cols="50" placeholder="请输入答案"></textarea>
		</div>
		<div>
			<div><span>解析</span><label>:</label></div>
			<textarea name="analysis" rows="3" cols="50" placeholder="请输入解析"></textarea>
		</div>
		<div>
			<input value="重新填写" type="button" onclick="clearAllContent()">
			<input type="button" value="提交修改" id="submitJudgement">
			<input type="button" value="取消" onclick="cancelSubmitForm()">
		</div>
	</form>
</div>
<script src="../js/public.js"></script>
<script src="../js/handleJudgement.js"></script>
<script src="../js/handleStyle.js"></script>