<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="connection" scope="page" class="tools.ConnDB"></jsp:useBean>
<link rel="stylesheet" href="../css/manager/aside.css">
<link rel="stylesheet" href="../css/aside_public.css">
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
<aside>
	<ul>
		 <li id="info_M">信息管理</li>
		 <li id="student_M">学生管理
			 <div class="grade">
			   <%for(int i=0;i<4;i++){%>
			     <div class="<%=i+1%>">大<%=i+1%>
			        <div class="class">
			       <%
			         ResultSet rs = connection.executeQuery("select * from number where grade_all = '" + (i+1) + "'");
			         int classes = 0;
			         while(rs.next()){
			        	 classes = rs.getInt("class_all");
			        	 for(int j=0;j<classes;j++){
			       %>
			        	   <div class="<%=j+1%>"><%=j+1%>班</div>
			       <%    }
			        }
			       %>
			      </div>
			     </div>
			   <%}%>
			 </div>
		 </li>
		 <li id="teacher_M">教师管理</li>
	</ul>
</aside> 
<script type="text/javascript">
	$(function(){
		  var grade;
		  var classes;
		  $("#info_M").bind("click",function(e){
			  window.location.href = "./management_info.jsp"
		  })		  
		  $(".class > div").bind("click",function(e){
			  grade = e.target.parentNode.parentNode.className
			  classes = e.currentTarget.className
		  })
		  $(".grade > div").bind("click",function(e){
			  grade = e.currentTarget.className
		  })
		  $("#student_M").bind("click",function(e){
			  if(typeof(grade) === 'undefined' && typeof(classes) === 'undefined'){
				  window.location.href = './management_student.jsp?grade=1&class=1'
			  }
			  if(!(typeof(grade)==='undefined') && typeof(classes)==='undefined'){
				  window.location.href = './management_student.jsp?grade=' + grade + '&class=1'
			  }
			  if(!(typeof(grade)==='undefined') && !(typeof(classes)==='undefined')){
				  window.location.href = './management_student.jsp?grade=' + grade + '&class=' + classes 
			  }
		  })
		  $("#teacher_M").bind("click",function(e){
			  window.location.href = "./management_teacher.jsp"
		  })
	})
</script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        