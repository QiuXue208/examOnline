<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn_s" scope="page" class="tools.ConnDB" />
<link rel="stylesheet" href="../css/teacher/main_selection.css">
<link rel="stylesheet" href="../css/template/question_form.css">
<div class="main">

<%
	ResultSet rs = conn_s.executeQuery("select * from selection order by ID desc");
	int sum = 0;
	while(rs.next()){
		sum ++;
	%>
	<div class="row row_<%=sum%>">
		<ul id="ul_selection">
			<li><%=sum%>、<span><%=rs.getString("title")%></span></li>
			<li>
			  A、<span><%=rs.getString("option_one")%></span>
			  B、<span><%=rs.getString("option_two")%></span>
			  C、<span><%=rs.getString("option_three")%></span>
			  D、<span><%=rs.getString("option_four")%></span>
			</li>
			<li>答案：<span><%=rs.getString("answer")%></span></li>
			<li>解析：<span><%=rs.getString("analysis")%></span></li>
			<li id="funcButton">
				<button id="modifySelection" >修改</button>
				<button id="deleteSelection">删除</button>
			</li>
		</ul>
	</div>
	<%}
%>
	<form class="question_form" id="selection_form" name="selectionForm" method="post">
		<div class="hint">
			<span><img src="../images/hint.png" alt="hint"></span>
			<span class="text">该卡片用于添加判断题哦</span>
		</div>
		<div>
			<div><span>题目</span><label>:</label></div>
			<textarea name="title" rows="3" cols="50" placeholder="请输入题名"></textarea>
		</div>
		<div>
			<div><span>选项一</span><label>:</label></div>
			<textarea name="option_one" rows="2" cols="50" placeholder="请输入选项一"></textarea>
		</div>
		<div>
			<div><span>选项二</span><label>:</label></div>
			<textarea name="option_two" rows="2" cols="50" placeholder="请输入选项二"></textarea>
		</div>
		<div>
			<div><span>选项三</span><label>:</label></div>
			<textarea name="option_three" rows="2" cols="50" placeholder="请输入选项三"></textarea>
		</div>
			<div>
			<div><span>选项四</span><label>:</label></div>
			<textarea name="option_four" rows="2" cols="50" placeholder="请输入选项四"></textarea>
		</div>
		<div>
			<div><span>答案</span><label>:</label></div>
			<textarea name="answer" rows="2" cols="50" placeholder="请输入答案"></textarea>
		</div>
		<div>
			<div><span>解析</span><label>:</label></div>
			<textarea name="analysis" rows="3" cols="50" placeholder="请输入解析"></textarea>
		</div>
		<div>
			<input value="重新填写" type="button" onclick="clearAllContent()">
			<input type="button" value="提交修改" id="submitSelection">
			<input type="button" value="取消" onclick="cancelSubmitForm()">
		</div>
	</form>
</div>
<script src="../js/handleStyle.js"></script>
<script src="../js/public.js"></script>
<script src="../js/handleSelection.js"></script>