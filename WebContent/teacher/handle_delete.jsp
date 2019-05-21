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
// 	String [] needsStr = getQuery.getQueryPara(request.getQueryString());
// 	String type = needsStr[0];
// 	int ID = Integer.parseInt(needsStr[1]);
		String str =request.getQueryString();	
		String [] queryList = str.split("[&]");
		int length = queryList.length;
		String [] needsStr = new String[length];
		String [] equalList = new String[2];
		for(int i=0;i<length;i++){
			equalList = queryList[i].split("[=]");
		    needsStr[i] = equalList[1];
		}
		String type = needsStr[0];
		int ID = Integer.parseInt(needsStr[1]);
	
	if(type.equals("selection")){
		String deleteSql = "delete from selection where ID = " + ID; 
		int result = conn.executeUpdate(deleteSql);
		//再将ID都移前一位
		String updateSql = "";
		ResultSet rs_sum = conn.executeQuery("select ID from selection where ID > " + ID + "order by ID");
		int id = 0;
		while(rs_sum.next()){
			id = rs_sum.getInt("ID");
			updateSql= "update selection set ID = "+ (id-1) + "where ID = " + id;
			int result1 = conn.executeUpdate(updateSql);
			if(result1 == 0){
				out.print("<script>alert('操作有误！');window.location.href = './exam_selection.jsp?type=selection'</script>");
			}
		}			
		if(result != 0){
			out.print("<script>alert('删除成功！');window.location.href = './exam_selection.jsp?type=selection'</script>");
		}else{
			out.print("<script>alert('操作有误！');window.location.href = './exam_selection.jsp?type=selection'</script>");
		}		
	}
	if(type.equals("judgement")){
		String deleteSql = "delete from judgement where ID = " + ID; 
		int result = conn.executeUpdate(deleteSql);
		//再将ID都移前一位
		String updateSql = "";
		ResultSet rs_sum = conn.executeQuery("select ID from judgement where ID > " + ID + "order by ID");
		int id = 0;
		while(rs_sum.next()){
			id = rs_sum.getInt("ID");
			updateSql= "update judgement set ID = "+ (id-1) + "where ID = " + id;
			int result1 = conn.executeUpdate(updateSql);
			if(result1 == 0){
				out.print("<script>alert('操作有误！');window.location.href = './exam_judgement.jsp?type=judgement'</script>");
			}
		}			
		if(result != 0){
			out.print("<script>alert('删除成功！');window.location.href = './exam_judgement.jsp?type=judgement'</script>");
		}else{
			out.print("<script>alert('操作有误！');window.location.href = './exam_judgement.jsp?type=judgement'</script>");
		}
	}
	if(type.equals("short")){
		int score = Integer.parseInt(needsStr[2]);				
		String deleteSql = "delete from short_" + score + " where ID = " + ID; 
		int result = conn.executeUpdate(deleteSql);
		//再将ID都移前一位
		String updateSql = "";
		ResultSet rs_sum = conn.executeQuery("select ID from short_" + score + " where ID > " + ID + "order by ID");
		int id = 0;
		while(rs_sum.next()){
			id = rs_sum.getInt("ID");
// 			out.println(id);
			updateSql= "update short_" + score + " set ID = "+ (id-1) + " where ID = " + id;
// 			out.println(updateSql);
			int result1 = conn.executeUpdate(updateSql);
// 			if(result1 == 0){
// 				out.print("<script>alert('操作有误！');window.location.href = './exam_short.jsp?type=short&score=" + score + "'</script>");
// 			}
		}			
		if(result != 0){
			out.print("<script>alert('删除成功！');window.location.href = './exam_short.jsp?type=short&score=" + score + "'</script>");
		}else{
			out.print("<script>alert('您的操作有误！');window.location.href = './exam_short.jsp?type=short&score=" + score + "'</script>");
		}
	}
// 	if(type.equals("filling")){
// 		String number = needsStr[2];
// 		int result = 0;
// 		String deleteSql = "";		
		
// 		if(number.equals("one")){
// 			deleteSql = "delete from filling_one where ID = " + ID;
// 			result = conn.executeUpdate(deleteSql);
// 			//更新ID
// 			String updateSql = "";
// 			ResultSet rs_sum = conn.executeQuery("select ID from filling_one where ID > " + ID);
// 			while(rs_sum.next()){
// 				int id = rs_sum.getInt("ID");
// 				updateSql= "update filling_one set ID = "+ (id-1) + "where ID > " + id;
// 				conn.executeUpdate(updateSql);
// 			}
// 		}
// 		if(number.equals("two")){
// 			deleteSql = "delete from filling_two where ID = " + ID;
// 			result = conn.executeUpdate(deleteSql);
// 			//更新ID
// 			String updateSql = "";
// 			ResultSet rs_sum = conn.executeQuery("select ID from filling_two where ID > " + ID);
// 			while(rs_sum.next()){
// 				int id = rs_sum.getInt("ID");
// 				updateSql= "update filling_two set ID = "+ (id-1) + "where ID > " + id;
// 				conn.executeUpdate(updateSql);
// 			}
// 		}
// 		if(number.equals("three")){
// 			deleteSql = "delete from filling_three where ID = " + ID;
// 			result = conn.executeUpdate(deleteSql);
// 			//更新ID
// 			String updateSql = "";
// 			ResultSet rs_sum = conn.executeQuery("select ID from filling_three where ID > " + ID);
// 			while(rs_sum.next()){
// 				int id = rs_sum.getInt("ID");
// 				updateSql= "update filling_three set ID = "+ (id-1) + "where ID > " + id;
// 				conn.executeUpdate(updateSql);
// 			}
// 		}
// 		if(number.equals("four")){
// 			deleteSql = "delete from filling_four where ID = " + ID;
// 			result = conn.executeUpdate(deleteSql);
// 			//更新ID
// 			String updateSql = "";
// 			ResultSet rs_sum = conn.executeQuery("select ID from filling_four where ID > " + ID);
// 			while(rs_sum.next()){
// 				int id = rs_sum.getInt("ID");
// 				updateSql= "update filling_four set ID = "+ (id-1) + "where ID > " + id;
// 				conn.executeUpdate(updateSql);
// 			}
// 		}
// 		if(result != 0){
// 			out.print("<script>alert('删除成功！');window.location.href = './exam_filling.jsp?type=filling'</script>");
// 		}else{
// 			out.print("<script>alert('您的操作有误！');window.location.href = './exam_filling.jsp?type=filling'</script>");
// 		}
// 	}
	
	
%>