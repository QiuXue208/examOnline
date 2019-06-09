<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<jsp:useBean id="query" scope="page" class="tools.GetQueryPara"/>
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>

<%
	String user = query.getQueryPara(request.getQueryString())[0];
	int id = Integer.parseInt(query.getQueryPara(request.getQueryString())[1]);
	
	if(user.equals("teacher")){
		String deleteSql = "delete from teacher where id =" + id;
		int result = conn.executeUpdate(deleteSql);
		if(result != 0 ){
			out.print("<script>alert('删除成功');window.location.href='../manager/management_teacher.jsp?user=teacher'</script>");
		}
// 		response.sendRedirect("../manager/management_teacher.jsp?user=teacher");
	}
	if(user.equals("student")){
		String s_user = "";
		ResultSet rs = conn.executeQuery("select s_username from student where ID = "+id);
		while(rs.next()){
			s_user = rs.getString("s_username");
		}
		//需要同时删除该同学所在的表
		ResultSet rs1 = conn.executeQuery("select * from complete_user where [user] = '" + s_user+"'");
		if(rs1.next()){
			conn.executeUpdate("delete from complete_user where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from score where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from question_selection where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from question_judgement where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from question_short_5 where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from question_short_10 where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from question_short_15 where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from answer_selection where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from answer_judgement where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from answer_short_5 where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from answer_short_10 where [user] = '"+s_user+"'");
			conn.executeUpdate("delete from answer_short_15 where [user] = '"+s_user+"'");
		}
		String deleteSql = "delete from student where id =" + id;
		int result = conn.executeUpdate(deleteSql);
		if(result != 0 ){
			String url = "../manager/management_student.jsp?grade="+session.getAttribute("grade")+"&class="+session.getAttribute("class") + "&user=student";
			out.print("<script>alert('删除成功');window.location.href='"+url+"'</script>");
		}
// 		response.sendRedirect("../manager/management_student.jsp?grade="+session.getAttribute("grade")+"&class="+session.getAttribute("class"));
	}
	
	
%>