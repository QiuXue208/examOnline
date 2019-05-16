<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ChStr" scope="page" class="tools.chStr" />
<jsp:useBean id="conn" scope="page" class="tools.ConnDB" />
<link rel="icon" href="./images/title.png" type="image/x-icon">
<title>柚子考试系统</title>
<%
    //将用户输入及选择进行编码转换
    String username=ChStr.chStr(request.getParameter("username"));
    String password=ChStr.chStr(request.getParameter("password"));
    String user=ChStr.chStr(request.getParameter("user"));

    try{
		if("教师".equals(user)){		
			ResultSet rs=conn.executeQuery("select * from teacher where t_username = '" + username + "'");
			if(rs.next()){				
				if(password.equals(rs.getString("password"))){
					session.setAttribute("username",username);
					session.setAttribute("password",password);
					session.setAttribute("user",user);
					response.sendRedirect("./teacher/index.jsp");
				}else{					
					out.println("<script language='javascript'>alert('密码错误，请确认密码!');window.location.href='index.jsp';</script>");
				}
			}else{
				out.println("<script language='javascript'>alert('无此用户，请确认用户名！');window.location.href='./index.jsp;'</script>");
			}
		}
		if("学生".equals(user)){
			ResultSet rs=conn.executeQuery("select * from student where s_username= '" + username + "'");
			if(rs.next()){
				if(password.equals(rs.getString("password"))){
					session.setAttribute("username",username);
					session.setAttribute("password",password);
					session.setAttribute("user",user);
					response.sendRedirect("./student/index.jsp");
				}else{
					out.println("<script language='javascript'>alert('密码错误，请确认密码!');window.location.href='index.jsp';</script>");
				}
			}else{
				out.println("<script language='javascript'>alert('无此用户，请确认用户名！');window.location.href='./index.jsp;'</script>");
			}
		}
		if("管理员".equals(user)){
			ResultSet rs=conn.executeQuery("select * from manager where m_username= '" + username + "'");			
			if(rs.next()){
				if(password.equals(rs.getString("password"))){
					session.setAttribute("username",username);
					session.setAttribute("password",password);
					session.setAttribute("user",user);
					response.sendRedirect("./manager/management_info.jsp");
				}else{
					out.println("<script language='javascript'>alert('密码错误，请确认密码!');window.location.href='index.jsp';</script>");
				}
			}else{
				out.println("<script language='javascript'>alert('无此用户，请确认用户名！');window.location.href='./index.jsp;'</script>");
			}
		}

	}catch(Exception e){
	   out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
	}
	conn.close();
%> 