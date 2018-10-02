<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
    
    background-repeat:no-repeat ;
    background-size:cover;
}

#score{
    color: white;
    font-size: 40px;
    position: fixed;
    top: 60%;
    left: 45%;
    
}
</style>
<title>Score</title>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
	
	
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="" background="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9c44bd42947345.57defcd1a7e7f.gif">
	
	<%
      
String str=(String)session.getAttribute("teamname");
     

try
{
	//String str="Niki";
	//out.print(ans);
	Connection con;
	Class.forName("oracle.jdbc.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HARRYPOTTER","oracle123"); 
    Statement statement = con.createStatement();
   // PreparedStatement stat=con.prepareStatement("update TEAM set ans1='"+ans+"' where team_name=?");
   // PreparedStatement ps1=con.prepareStatement("select * from TEAM");
    ResultSet rs=statement.executeQuery("select team_name,score from TEAM where team_name='"+str+"'");
    
    int score=0;
    if(rs.next())
    {
    	score=rs.getInt(2);
    }
   
    %>
    <center><div id="score">Score: <% out.print(score); %></div></center>
    <script>
setTimeout(function(){
	window.location.href="EndGame.html";
},5000);
</script>
    <%
  
}catch(Exception e)
{
	 out.println(e.getLocalizedMessage());
}
%>

</BODY> 
</html>   
    
    
    
    
    