<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn_t" scope="page" class="tools.ConnDB" />
<link rel="stylesheet" href="../css/manager/main.css">
<div class="main">
 	<%	int result = 0;		 	
    String sql_t = "select * from teacher order by ID";
    ResultSet rs=conn_t.executeQuery(sql_t);
	if(!rs.next()){%>
		<div class="remind">
			<span>还没有教师信息，您可以点击下方</span>
			<span class="addButton">添加新用户</span>按钮添加教师！
		</div>
	<%}else{%>
		<div class="table" id="teacher">
			<%ResultSet rs1=conn_t.executeQuery(sql_t);		    
			  while(rs1.next()){
			  	result++;
			%>
				<div class="block block_<%=result%>">
					<dl class="clearfix" id="<%=rs1.getString("id")%>">
						<dd>用户:</dd>
						<dt><%=rs1.getString("t_username")%></dt>
						<dd>密码:</dd>
						<dt><%=rs1.getString("password")%></dt>
						<dd>真名:</dd>
						<dt><%=rs1.getString("truename")%></dt>
						<dd>级别:</dd>
						<dt><%=rs1.getString("level")%></dt>						
						<dd>邮箱:</dd>
						<dt><%=rs1.getString("email")%></dt>
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
	<%@include file="../template/teacher_form.jsp" %>
</div>
<script src="../js/handleDB.js"></script>
<script src="../js/check.js"></script>