<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<jsp:useBean id="getQuery" scope="page" class="tools.GetQueryPara"></jsp:useBean>
<link rel="icon" href="../images/title.png" type="image/x-icon">
<title>柚子考试系统</title>

<% 
	//获取查询参数的值	
	String [] needsStr = getQuery.getQueryPara(request.getQueryString());
	String type = needsStr[0];
	int ID = Integer.parseInt(needsStr[1]);

	 
    //公共变量
	String title = chStr.chStr(request.getParameter("title"));
	String answer = chStr.chStr(request.getParameter("answer"));
	String analysis = chStr.chStr(request.getParameter("analysis"));
	
	if(type.equals("selection")){
		String option_one = chStr.chStr(request.getParameter("option_one"));
		String option_two = chStr.chStr(request.getParameter("option_two"));
		String option_three = chStr.chStr(request.getParameter("option_three"));
		String option_four = chStr.chStr(request.getParameter("option_four"));
		
		String updateSql = "update selection set title = '" + title
					+" ', option_one = '" + option_one
					+" ', option_two = '" + option_two
					+" ', option_three = '" + option_three
					+" ', option_four = '" + option_four
					+" ', answer = '" + answer
					+" ', analysis = '" + analysis
					+" ' where ID = " + ID;
		int result = conn.executeUpdate(updateSql);
		if(result != 0){
			out.print("<script language='javascript'>alert('信息修改成功-_-');window.location.href='./exam_selection.jsp?type=selection'</script>");
		}else{
			out.println("<script language='javascript'>alert('您的操作有误-_-');window.location.href='./exam_selection.jsp?type=selection'</script>");
		}
	}
	if(type.equals("judgement")){
		String updateSql = "update judgement set title = '" + title
					+"' , answer = '" + answer
					+"' , analysis = '" + analysis
					+"' where ID = " + ID;
		int result = conn.executeUpdate(updateSql);
		if(result != 0){
			out.print("<script language='javascript'>alert('信息修改成功-_-');window.location.href='./exam_judgement.jsp?type=judgement'</script>");
		}else{
			out.println("<script language='javascript'>alert('您的操作有误-_-');window.location.href='./exam_judgement.jsp?type=judgement'</script>");
		}
	}
// 	if(type.equals("filling")){
// 		int result = 0;
// 		String updateSql = "";
// 		String number = needsStr[2];
		
// 		String title = chStr.chStr(request.getParameter("title"));
// 		String answer_one = chStr.chStr(request.getParameter("answer_one"));
// 		String analysis = chStr.chStr(request.getParameter("analysis"));
// 		if(number.equals("one")){
// 			updateSql = "update filling_one set title = '" + title
// 					+" ', answer_one = '" + answer_one
// 					+" ', analysis = '" + analysis
// 					+" ' where ID = " + ID;
// 		}
// 		if(number.equals("two")){
// 			String answer_two = chStr.chStr(request.getParameter("answer_two"));
// 			updateSql = "update filling_two set title = '" + title
// 					+" ', answer_one = '" + answer_one
// 					+" ', answer_two = '" + answer_two
// 					+" ', analysis = '" + analysis
// 					+" ' where ID = " + ID;
// 		}
// 		if(number.equals("three")){
// 			String answer_two = chStr.chStr(request.getParameter("answer_two"));
// 			String answer_three = chStr.chStr(request.getParameter("answer_three"));
// 			updateSql = "update filling_three set title = '" + title
// 					+" ', answer_one = '" + answer_one
// 					+" ', answer_two = '" + answer_two
// 					+" ', answer_three = '" + answer_three
// 					+" ', analysis = '" + analysis
// 					+" ' where ID = " + ID;			
// 		}
// 		if(number.equals("four")){
// 			String answer_two = chStr.chStr(request.getParameter("answer_two"));
// 			String answer_three = chStr.chStr(request.getParameter("answer_three"));
// 			String answer_four = chStr.chStr(request.getParameter("answer_four"));
// 			updateSql = "update filling_four set title = '" + title
// 					+" ', answer_one = '" + answer_one
// 					+" ', answer_two = '" + answer_two
// 					+" ', answer_three = '" + answer_three
// 					+" ', answer_four = '" + answer_four
// 					+" ', analysis = '" + analysis
// 					+" ' where ID = " + ID;
// 		}
// 		result = conn.executeUpdate(updateSql);
// 		if( result != 0){
// 			out.print("<script language='javascript'>alert('信息修改成功-_-');window.location.href='./exam_filling.jsp?type=filling'</script>");
// 		}else{
// 			out.print("<script language='javascript'>alert('您的操作有误-_-');window.location.href='./exam_filling.jsp?type=filling'</script>");
// 		}
// 	}
	if(type.equals("short")){
		
	}
	if(type.equals("calculation")){
		
	}
%>