<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="conn" scope="page"  class="tools.ConnDB" />
<link href="../css/add_user_form.css" rel="stylesheet">
<link href="../css/pagination.css" rel="stylesheet">
<%
	String queryString = request.getQueryString();
	int studentLength = 0;
	int teacherLength = 0;
	String studentStr = "select ID from student";
	String teacherStr = "select ID from teacher";
	ResultSet rs_student = conn.executeQuery(studentStr);
	while(rs_student.next()){
		studentLength += 1;
	}
	ResultSet rs_teacher = conn.executeQuery(teacherStr);
	while(rs_teacher.next()){
		teacherLength +=1 ;
	}
%>
<nav>
    <form method="post" id="addNew">
    	<input type="button" id="addUser" value="添加新用户">	
    </form>
    <%if(queryString == null){%>
	    <form id="teacher" name="teacher" method="post">
	    	<%@ include file="./template/teacher_form.jsp" %>
	    	<div class="buttons">
	    	  <input value="添加" onclick="handleAddSbmit()" type="submit">
	    	  <input value="重置" onclick="handleReset()" type="reset">
	    	  <input value="取消" onclick="handleCancel()" type="button">
	    	</div>
	    </form>    
    <%}else{%>
	    <form id="student" name="student" method="post">
	    	<%@ include file="./template/student_form.jsp" %>
	    	<div class="buttons">
	    	  <input value="添加" onclick="handleAddSubmit" type="submit">
	    	  <input value="重置" onclick="handleReset()" type="reset">
	    	  <input value="取消" onclick="handleCancel()" type="button">
	    	</div>
	    </form>   
    <%}%>
</nav>
<script>
	var identity
	document.querySelector('#addUser').addEventListener('click',function(e){
		document.querySelector('form.block_modify').style.display = "none"
		changeStyle()	
		var identity = e.target.parentNode.nextElementSibling.id
		if(user === 'teacher'){
			document.querySelector('form#teacher').style.display = "block"	
		}
		if(user === 'student'){
			document.querySelector('form#student').style.display = "block"	;
		}
	})
	console.log(identity)
	console.log(<%=studentLength+1%>)
	function handleAddSubmit(){
		var addForm = document.querySelector('#addNew')
		if(user === 'teacher'){
			addForm.setAttribute('action','./add_new_user.jsp?user='+identity + '&id=' + <%=teacherLength+1%>);
		}
		if(user === 'student'){
			addForm.setAttribute('action','./add_new_user.jsp?user='+identity + '&id=' + <%=studentLength+1%>);
		}
		addForm.submit()
	}
</script>
