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

</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<%
try
{
	

	Class.forName("oracle.jdbc.OracleDriver");
	
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HARRYPOTTER","oracle123"); 
 	String str=(String)session.getAttribute("teamname");
 	Statement stat=con.createStatement();
 	int sc=Integer.parseInt(request.getParameter("sc"));
 	ResultSet rs=stat.executeQuery("select score from TEAM where team_name='"+str+"'");
    Statement statement = con.createStatement();
    int scr=0;
    if(rs.next())
    {
    	scr=rs.getInt(1);
    }
    scr=scr+sc;
    statement.executeUpdate("update TEAM set score='"+scr+"' where team_name='"+str+"'");
    RequestDispatcher rd=request.getRequestDispatcher("level2MAN.html");

    	rd.forward(request, response);
    
    }catch(Exception e)
{
	 out.println(e.getLocalizedMessage());
}

%>
</body>
</html>