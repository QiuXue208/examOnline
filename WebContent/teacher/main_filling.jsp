<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connF" scope="page" class="tools.ConnDB" />
<link rel="stylesheet" href="../css/teacher/main_filling.css">
<link rel="stylesheet" href="../css/template/question_form.css">

<div class="main">
	<%ResultSet rs_one = connF.executeQuery("select * from filling_one order by ID");
		int sum = 0; 
		while(rs_one.next()){
			sum ++;%>
			<div class="row one row_<%=sum%>">
				<ul>
					<li><%=sum%>、<span><%=rs_one.getString("title")%></span></li>
					<li>答案1：<span><%=rs_one.getString("answer_one") %></span></li>
					<li>解析：<span><%=rs_one.getString("analysis") %></span></li>
					<li id="funcButton">
						<button id="modifyFilling">修改</button>
						<button id="deleteFilling">删除</button>
					</li>
				</ul>
			</div>
		<%}
		ResultSet rs_two = connF.executeQuery("select * from filling_two order by ID");
		int sum2 = 0;
		while(rs_two.next()){
			sum2 ++;%>
			<div class="row two row_<%=sum2%>">
				<ul>
					<li><%=sum+sum2%>、<span><%=rs_two.getString("title")%></span></li>
					<li>答案1：<span><%=rs_two.getString("answer_one") %></span></li>
					<li>答案2：<span><%=rs_two.getString("answer_two") %></span></li>
					<li>解析：<span><%=rs_two.getString("analysis") %></span></li>
					<li id="funcButton">
						<button id="modifyFilling">修改</button>
						<button id="deleteFilling">删除</button>
					</li>
				</ul>
			</div>
		<%}
		ResultSet rs_three = connF.executeQuery("select * from filling_three order by ID");
		int sum3 = 0;
		while(rs_three.next()){
			sum3 ++;%>
			<div class="row three row_<%=sum3%>">
				<ul>
					<li><%=sum+sum2+sum3%>、<span><%=rs_three.getString("title")%></span></li>
					<li>答案1：<span><%=rs_three.getString("answer_one") %></span></li>
					<li>答案2：<span><%=rs_three.getString("answer_two") %></span></li>
					<li>答案3：<span><%=rs_three.getString("answer_three") %></span></li>
					<li>解析：<span><%=rs_three.getString("analysis") %></span></li>
					<li id="funcButton">
						<button id="modifyFilling">修改</button>
						<button id="deleteFilling">删除</button>
					</li>
				</ul>
			</div>
		<%}
		ResultSet rs_four = connF.executeQuery("select * from filling_four order by ID");
		int sum4 = 0;
		while(rs_four.next()){
			sum4 ++;%>
			<div class="row four row_<%=sum4%>">
				<ul>
					<li><%=sum+sum2+sum3+sum4%>、<span><%=rs_four.getString("title")%></span></li>
					<li>答案1：<span><%=rs_four.getString("answer_one") %></span></li>
					<li>答案2：<span><%=rs_four.getString("answer_two") %></span></li>
					<li>答案3：<span><%=rs_four.getString("answer_three") %></span></li>
					<li>答案4：<span><%=rs_four.getString("answer_four") %></span></li>
					<li>解析：<span><%=rs_four.getString("analysis") %></span></li>
					<li id="funcButton">
						<button id="modifyFilling">修改</button>
						<button id="deleteFilling">删除</button>
					</li>
				</ul>
			</div>
		<%}%>
		<form class="filling_form question_form" id="filling_form_one" name="fillingForm" method="post" >
			<h4>请输入带有一个空的填空题!</h4>
			<div>
				<div><span>题目</span><label>:</label></div>
				<textarea name="title" rows="3" cols="50" placeholder="请输入题目"></textarea>
			</div>
			<div>
				<div><span>答案</span><label>:</label></div>
				<textarea name="answer_one" rows="2" cols="50" placeholder="请输入答案"></textarea>
			</div>
			<div>
				<div><span>解析</span><label>:</label></div>
				<textarea name="analysis" rows="3" cols="50" placeholder="请输入题目解析"></textarea>
			</div>
			<div>
				<input type="button" value="重新填写" onclick="clearAllContent()">
				<input type="button" value="提交修改" id="submitFilling">
				<input type="button" value="取消" onclick="cancelSubmitForm()">
			</div>
		</form>
		<form class="filling_form question_form" id="filling_form_two" name="fillingForm" method="post" >
		<h4>请输入带有两个空的填空题!</h4>
			<div>
				<div><span>题目</span><label>:</label></div>
				<textarea name="title" rows="3" cols="50" placeholder="请输入题目"></textarea>
			</div>
			<div>
				<div><span>答案1</span><label>:</label></div>
				<textarea name="answer_one" rows="2" cols="50" placeholder="请输入答案1"></textarea>
			</div>
			<div>
				<div><span>答案2</span><label>:</label></div>
				<textarea name="answer_two" rows="2" cols="50" placeholder="请输入答案2"></textarea>
			</div>
			<div>
				<div><span>解析</span><label>:</label></div>
				<textarea name="analysis" rows="3" cols="50" placeholder="请输入题目解析"></textarea>
			</div>
			<div>
				<input type="button" value="重新填写" onclick="clearAllContent()">
				<input type="button" value="提交修改" id="submitFilling">
				<input type="button" value="取消" onclick="cancelSubmitForm()">
			</div>
		</form>
		<form class="filling_form question_form" id="filling_form_three" name="fillingForm" method="post" >
			<h4>请输入带有三个空的填空题!</h4>
			<div>
				<div><span>题目</span><label>:</label></div>
				<textarea name="title" rows="3" cols="50" placeholder="请输入题目"></textarea>
			</div>
			<div>
				<div><span>答案1</span><label>:</label></div>
				<textarea name="answer_one" rows="2" cols="50" placeholder="请输入答案1"></textarea>
			</div>
			<div>
				<div><span>答案2</span><label>:</label></div>
				<textarea name="answer_two" rows="2" cols="50" placeholder="请输入答案2"></textarea>
			</div>
			<div>
				<div><span>答案3</span><label>:</label></div>
				<textarea name="answer_three" rows="2" cols="50" placeholder="请输入答案3"></textarea>
			</div>
			<div>
				<div><span>解析</span><label>:</label></div>
				<textarea name="analysis" rows="3" cols="50" placeholder="请输入题目解析"></textarea>
			</div>
			<div>
				<input type="button" value="重新填写" onclick="clearAllContent()">
				<input type="button" value="提交修改" id="submitFilling">
				<input type="button" value="取消" onclick="cancelSubmitForm()">
			</div>
		</form>
		<form class="filling_form question_form" id="filling_form_four" name="fillingForm" method="post" >
			<h4>请输入带有四个空的填空题!</h4>
			<div>
				<div><span>题目</span><label>:</label></div>
				<textarea name="title" rows="3" cols="50" placeholder="请输入题目"></textarea>
			</div>
			<div>
				<div><span>答案1</span><label>:</label></div>
				<textarea name="answer_one" rows="2" cols="50" placeholder="请输入答案1"></textarea>
			</div>
			<div>
				<div><span>答案2</span><label>:</label></div>
				<textarea name="answer_two" rows="2" cols="50" placeholder="请输入答案2"></textarea>
			</div>
			<div>
				<div><span>答案3</span><label>:</label></div>
				<textarea name="answer_three" rows="2" cols="50" placeholder="请输入答案3"></textarea>
			</div>
			<div>
				<div><span>答案4</span><label>:</label></div>
				<textarea name="answer_four" rows="2" cols="50" placeholder="请输入答案4"></textarea>
			</div>
			<div>
				<div><span>解析</span><label>:</label></div>
				<textarea name="analysis" rows="3" cols="50" placeholder="请输入题目解析"></textarea>
			</div>
			<div>
				<input type="button" value="重新填写" onclick="clearAllContent()">
				<input type="button" value="提交修改" id="submitFilling">
				<input type="button" value="取消" onclick="cancelSubmitForm()">
			</div>
		</form>
</div>
<script src="../js/handleFilling.js"></script>
<script src="../js/handleStyle.js"></script>
<script src="../js/public.js"></script>

