<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<%
try
{
	
	
	Class.forName("oracle.jdbc.OracleDriver");
	
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HARRYPOTTER","oracle123"); 
 String str=(String)session.getAttribute("teamname");
 	//String str="Niki";
 	
 	//int Life=(int)session.getAttribute("Life");
 	//out.print(Life);
 	// int Life=1;
 	int sc=Integer.parseInt(request.getParameter("scr"));
 	int Count = Integer.parseInt(request.getParameter("Count"));
 	//int Count=1;
 	//int sc=9;
 	//int tim=2000;

    Statement statement = con.createStatement();
    statement.executeUpdate("update TEAM set score='"+sc+"' where team_name='"+str+"'");
  	int tim=Integer.parseInt(request.getParameter("t"));
    statement.executeUpdate("Update store set time='"+tim+"' where team_name='"+str+"'");
    PreparedStatement ps1;
    
    ps1=con.prepareStatement("update STORE set level_id='L02' where team_name='"+str+"'");
    ps1.executeUpdate();
   
    	RequestDispatcher rd=request.getRequestDispatcher("game1.html");

    	rd.forward(request, response);
    
   
    }catch(Exception e)
{
    	out.println(e);
}

%>
</body>
</html>