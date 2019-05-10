<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connDB1" scope="page" class="tools.ConnDB" />
<jsp:useBean id="query" scope="page" class="tools.GetQueryPara"/>
<link rel="stylesheet" href="../css/manager/main.css">
<div class="main">
	<%	int result = 0;		 	
    int grade = Integer.parseInt(query.getQueryPara(request.getQueryString())[0]);
    int classes = Integer.parseInt(query.getQueryPara(request.getQueryString())[1]);
    session.setAttribute("grade", grade);
    session.setAttribute("class",classes);
    String sql = "select * from student where grade = " + grade + "and class=" + classes;
    ResultSet rs=connDB1.executeQuery(sql);
	if(!rs.next()){%>
		<div class="remind">
			<span><%=grade%></span>年级<span><%=classes%></span>班还未添加学生，您可以点击下方
			<span class="addButton">添加新用户</span>按钮添加学生！
		</div>
	<%}else{%>
		<div class="table" id="student">
			<%ResultSet rs1=connDB1.executeQuery(sql);		    
			  while(rs1.next()){
			  	result++;
			%>
					<div class="block block_<%=result%>">
						<dl class="clearfix" id="<%=rs1.getString("id")%>">
							<dd>用户:</dd>
							<dt><%=rs1.getString("username")%></dt>
							<dd>密码:</dd>
							<dt><%=rs1.getString("password")%></dt>
							<dd>邮箱:</dd>
							<dt><%=rs1.getString("email")%></dt>
							<dd>班级:</dd>
							<dt><%=rs1.getString("class")%>班</dt>
							<dd>年级:</dd>
							<dt>大<%=rs1.getString("grade")%></dt>
							<dd>真名:</dd>
							<dt><%=rs1.getString("truename")%></dt>
							<dd>电话:</dd>
							<dt><%=rs1.getString("phone_number")%></dt>
						</dl>
						<div class="operator">
							<button class="modify">修改</button>
							<button class="delete">删除</button>
						</div>
					</div>
			<%}%>
		</div>
	<%}%>
	<form class="block_modify" method="post">
		<%@include file="../template/student_form.jsp"%>
		<div class="buttons">
			<input type="submit" onclick="handleSubmit()" value="提交">
			<input type="reset" onclick="handleReset()" value="重置">
			<input type="button" onclick="handleCancel()" value="取消"></input>
		</div>
	</form>
</div>
<script src="../js/handleDB.js"></script>
<script src="../js/check.js"></script>