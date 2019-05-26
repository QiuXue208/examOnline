<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="connS" scope="page" class="tools.ConnDB" />
<jsp:useBean id="getQuery" scope="page" class="tools.GetQueryPara"></jsp:useBean>
<link rel="stylesheet" href="../css/teacher/main_score.css">
<div class="main">
 <div class="userInfoContainer">
   	<ul class="header">
   		<li>用户名</li>
   		<li>姓名</li>
   		<li>班级</li>
   		<li>年级</li>
   		<li>总分</li>
   		<li>选择题</li>
   		<li>判断题</li>
   		<li>简答题(5分)</li>   	
   		<li>简答题(10分)</li>
   		<li>简答题(15分)</li>	
   	</ul>
   	<div class="userInfos">
   	<%
		String condition = getQuery.getQueryPara(request.getQueryString())[0];
   		//按班级查看
   		if(condition.equals("users")){
   			int grade = Integer.parseInt(getQuery.getQueryPara(request.getQueryString())[1]);
   			int classes = Integer.parseInt(getQuery.getQueryPara(request.getQueryString())[2]);
   			ResultSet rs_u = connS.executeQuery("select s_username from student where grade="+grade +"and class="+classes);
   			// 如果没有学生
   			if(!rs_u.next()){%>
   				<div class="hint"><%=grade%>年级<%=classes %>班还未添加学生</div>
   			<%}else{
   				ResultSet rs_u2 = connS.executeQuery("select s_username,truename from student where grade="+grade +"and class="+classes);
   				while(rs_u2.next()){
   					String s_username = rs_u2.getString("s_username");
   					String s_truename = rs_u2.getString("truename");
   					ResultSet rs_s = connS.executeQuery("select * from score where [user] = '"+s_username+"'");
   					if(!rs_s.next()){
   						//还未参加考试%>
   						<ul>
   							<li><%=s_username%></li>
   							<li><%=s_truename %></li>
   							<li><%=classes %></li>
   							<li><%=grade %></li>
   							<li><b>未考试</b></li>
   							<li>0</li>
   							<li>0</li>
   							<li>0</li>
   							<li>0</li>
   							<li>0</li>
   						</ul>				
   					<%}else{
   						ResultSet rs_s2 = connS.executeQuery("select * from score where [user] = '"+s_username+"'");
   						while(rs_s2.next()){
   							int complete = rs_s2.getInt("complete");
   							if(complete == 0){
   							//老师未阅卷%>
	  						<ul>
	   							<li><%=s_username%></li>
	   							<li><%=s_truename %></li>
	   							<li><%=classes %></li>
	   							<li><%=grade %></li>
	   							<li class="review">待批阅</li>
	   							<li><%=rs_s.getInt("selection_score") %></li>
	   							<li><%=rs_s.getInt("judgement_score") %></li>
	   							<li>0</li>
	   							<li>0</li>
   								<li>0</li>
	   						</ul>
   							<%}if(complete == 1){%>
   							<ul>
	   							<li><%=s_username%></li>
	   							<li><%=s_truename %></li>
	   							<li><%=classes %></li>
	   							<li><%=grade %></li>
	   							<li><%=rs_s.getInt("all_score") %></li>
	   							<li><%=rs_s.getInt("selection_score") %></li>
	   							<li><%=rs_s.getInt("judgement_score") %></li>
	   							<li><%=rs_s.getInt("short_5_score") %></li>
	   							<li><%=rs_s.getInt("short_10_score") %></li>
	   							<li><%=rs_s.getInt("short_15_score") %></li>
	   						</ul>
   							<%}
   						}
   					}
   				}
   			}
   		}
   		//按分数段查看(学生一定已经参加完考试，且老师已经完成批阅)
   		if(condition.equals("scores")){
   			int min = Integer.parseInt(getQuery.getQueryPara(request.getQueryString())[1]);
   			int max = Integer.parseInt(getQuery.getQueryPara(request.getQueryString())[2]);
   			//从score表中查询符合条件的人
   			String searchSql = "select * from score where all_score > "+min+"and all_score<="+max+"and complete=1";
   			ResultSet rs_score = connS.executeQuery(searchSql);
   			while(rs_score.next()){
   				String s_user = rs_score.getString("user");
   				ResultSet rs_score2 = connS.executeQuery("select truename,grade,class from student where s_username = '"+s_user + "'");
   				while(rs_score2.next()){%>
  	   					  <ul>
   							<li><%=s_user%></li>
   							<li><%=rs_score2.getString("truename") %></li>
   							<li><%=rs_score2.getInt("class") %></li>
   							<li><%=rs_score2.getInt("grade") %></li>
   							<li><%=rs_score.getInt("all_score") %></li>
   							<li><%=rs_score.getInt("selection_score") %></li>
   							<li><%=rs_score.getInt("judgement_score") %></li>
   							<li><%=rs_score.getInt("short_5_score") %></li>
   							<li><%=rs_score.getInt("short_10_score") %></li>
   							<li><%=rs_score.getInt("short_15_score") %></li>
   						</ul>
   				<%}
			}
   		}%>
   	</div>
 </div>
</div>
<script>
	document.querySelectorAll('.review').forEach(function(element,index){
		element.addEventListener('click',function(e){
			var user = e.target.parentNode.children[0].innerText
			window.location.href = './review.jsp?user='+user
			
		})
	})
</script>