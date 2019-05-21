<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<link href="../css/pagination.css" rel="stylesheet">
<%
	String queryString_p = request.getQueryString();
%>
<nav>
    <form method="post" id="addNew">
    	<input type="button" id="addUser" value="添加新用户">	
    </form>
</nav>
<script></script>
<script>
	document.querySelector('#addUser').addEventListener('click',function(e){
		//点击添加新用户的时候，将表单清空
		document.querySelectorAll('.block_modify > div.row > input').forEach(function(element){
			element.value = ''
		})
	//教师
    <%if(queryString_p == null){%>
    	document.querySelector('form#teacher').style.display = 'block'
//     	document.querySelector('input#teacher_submit').setAttribute('value','添加')
    	changeStyle()
    	document.querySelector('form#teacher').setAttribute('action','./add_new_user.jsp?user=teacher');
   //学生
   <%}else{%>
   
   		document.querySelector('form#student').style.display = 'block'
//    		document.querySelector('input#student_submit').setAttribute('value','添加')
    	changeStyle()
    	document.querySelector('form#student').setAttribute('action','./add_new_user.jsp?user=student');
   <%}%>
	})
	function handleSubmit(){
		document.querySelector('.block_modify').submit()
	}
</script>
