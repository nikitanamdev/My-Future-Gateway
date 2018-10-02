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
<link href="Interruption.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Jura|Roboto+Condensed|Roboto+Mono" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Play|Source+Code+Pro" rel="stylesheet">
<title>Interruption Occur</title>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">

<h3 > <font color="white" style="float:center">Got Interrupted??</font></h3><br>

<form id="sub" action="">
<div> 
		<label for="tname"><h4><font size="5" face="Source Code Pro" color="white">Enter Team Name</font></h4></label>
	    <input size=30 type="text" name="name" id="tname" placeholder="name" required >
	    <label for="tname" style="min-height: 13px; margin-top:-5%"></label><br>
	    <button type="submit" value="submit" onclick="place()" style="font-size:15pt;color:black;
background-color:white;border:4px solid grey;padding-top: 4px;
  padding-left: 3px; margin:20px; padding-right: 7px;
  padding-bottom: 3px;border-radius: 10px;font-family:Source Code Pro;">SUBMIT</button>
	    </div>
	    <script>
    function place(){
	
	<%
	
	 String str1=request.getParameter("name");
	session.setAttribute("teamname",str1);
	 try
	 {
	 
		 
	 
	    Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
        Statement stat = con.createStatement();
       // String str=request.getParameter("teamname");
        ResultSet rs=stat.executeQuery("select * from STORE where team_name='"+str1+"'");
        String level=new String();
       
        level="";
      if(rs.next())
        { 
        	 level=rs.getString(3);
        	 
        	 if(level.equals("L01"))
             {
             	%>
             	
             	 document.getElementById("sub").action ="Level1.jsp";
         
             
         <%}
             else if(level.equals("L02"))
             {
             	%>
             	
         document.getElementById("sub").action ="Level2.jsp";
         
             <%} 
             else if(level.equals("L03"))
             {
             	%>
             	
         document.getElementById("sub").action ="Level3.jsp";
         <%}
             else if(level.equals("0"))
             {
            	 %>
            	 document.getElementById("sub").action="MainPage.jsp";
           <%  }
              else
        	 { %>
        	 document.getElementById("sub").action="Registration_form.jsp";
        	<% }
        	 }
	   %>}
             </script>
             
             <% 
         
         
        	 
        
        }catch(ClassNotFoundException e)
{
    out.println(e.getLocalizedMessage());
}
%>
	</form>
</body>
</html>