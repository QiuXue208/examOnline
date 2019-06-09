<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="query" scope="page" class="tools.GetQueryPara"></jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>

<%
	String user = query.getQueryPara(request.getQueryString())[0];
// 	int id = Integer.parseInt(query.getQueryPara(request.getQueryString())[1]);
	
	String username = chStr.chStr(request.getParameter("username"));	
	int id = Integer.parseInt(username.substring(1));
	String password = chStr.chStr(request.getParameter("password"));
// 	String email = chStr.chStr(request.getParameter("email"));
	String truename = chStr.chStr(request.getParameter("truename"));
// 	String tel = chStr.chStr(request.getParameter("tel"));
	
	if(user.equals("teacher")){
		ResultSet rs1 = conn.executeQuery("select t_username from teacher where t_username = '"+username+"'");
		if(rs1.next()){
			out.print("<script>alert('用户名重复，请重新添加！');window.location.href='../manager/management_teacher.jsp?user=teacher'</script>");
		}
		String level = chStr.chStr(request.getParameter("level"));
// 		int id = Integer.parseInt(username.substring(1));
		String teacherStr = "insert into teacher (ID,t_username,password,truename,level) values ("
							+ id
							+ ",'" + username
							+ "','" + password
							+ "','" + truename
// 							+ "','" + email
// 							+ "','" + tel
							+ "','" + level
							+ "')";

		int result = conn.executeUpdate(teacherStr);
		if(result != 0){
			out.print("<script>alert('添加成功！');window.location.href='../manager/management_teacher.jsp?user=teacher'</script>");
// 			response.sendRedirect("../manager/management_teacher.jsp");
		}
	}
	if(user.equals("student")){

		String gradeStr = chStr.chStr(request.getParameter("grade"));
	    String classStr = chStr.chStr(request.getParameter("class"));
		int grade = Integer.parseInt(gradeStr);
		int classes = Integer.parseInt(classStr);
		ResultSet rs1 = conn.executeQuery("select s_username from student where s_username = '"+username+"'");
		if(rs1.next()){
			String url = "../manager/management_student.jsp?grade="+grade+"&class="+classes + "&user=student";
			out.print("<script>alert('用户名重复，请重新添加！');window.location.href='"+url +"'</script>");
		}
		String teacherStr = "insert into student (ID,s_username,password,truename,class,grade) values ("
							+ id
							+ ",'" + username
							+ "','" + password
							+ "','" + truename
							+ "'," + classes
							+ "," + grade
							+ ")"; 

		int result = conn.executeUpdate(teacherStr);
		if(result != 0){
			String url = "../manager/management_student.jsp?grade="+grade+"&class="+classes + "&user=student";
			out.print("<script>alert('添加成功！');window.location.href='"+url +"'</script>");
		}
	}
%>