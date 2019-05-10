<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="conn" scope="page"  class="tools.ConnDB" />
<link href="../css/pagination.css" rel="stylesheet">
<%
	String queryString = request.getQueryString();
// 	int studentLength = 0;
// 	int teacherLength = 0;
// 	String studentStr = "select ID from student";
// 	String teacherStr = "select ID from teacher";
// 	ResultSet rs_student = conn.executeQuery(studentStr);
// 	while(rs_student.next()){
// 		studentLength += 1;
// 	}
// 	ResultSet rs_teacher = conn.executeQuery(teacherStr);
// 	while(rs_teacher.next()){
// 		teacherLength +=1 ;
// 	}
%>
<nav>
    <form method="post" id="addNew">
    	<input type="button" id="addUser" value="添加新用户">	
    </form>
</nav>
<script>
	document.querySelector('#addUser').addEventListener('click',function(e){		
    <%if(queryString == null){%>
    	document.querySelector('form#teacher').style.display = 'block'
    	document.querySelector('input#teacher_submit').setAttribute('value','添加')
    	changeStyle()
    	document.querySelector('form#teacher').setAttribute('action','./add_new_user.jsp?user=teacher');
   <%}else{%>
   		document.querySelector('form#student').style.display = 'block'
   		document.querySelector('input#student_submit').setAttribute('value','添加')
    	changeStyle()
    	document.querySelector('form#student').setAttribute('action','./add_new_user.jsp?user=student');
   <%}%>
	})
	function handleSubmit(){
		document.querySelector('.block_modify').submit()
	}
</script>
