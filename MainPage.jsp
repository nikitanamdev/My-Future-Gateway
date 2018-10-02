<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<link href="MP.css" rel="stylesheet" type="text/css"/>


<link href="https://fonts.googleapis.com/css?family=Jura|Roboto+Condensed|Roboto+Mono" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Play|Source+Code+Pro" rel="stylesheet">
<title>MY FUTURE GETAWAY</title>

<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<SCRIPT language="JavaScript">

function goNewWin() {

//***Get what is below onto one line***

window.open("backbuttonnewpage.html",'TheNewpop','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1'); 
window.open ("https://viralpatel.net/blogs/",
		"mywindow","status=1,toolbar=0"); 
//***Get what is above onto one line*** 

self.close()

}

</SCRIPT> 


<h1 style="color:#4682B4; font-family:Source Code Pro|Play; font-size:102px; margin-top:-1%" align="center">MY FUTURE GETAWAY</h1>
'
<table id="t1" style="font-size:28px">

<tr>

<td style="font-family:Source Code Pro;">Team Name :</td>
<% 
try 
{
	String str=(String)session.getAttribute("teamname");
 
	Integer score=0;
	 ResultSet rs;
	 int teamno=1;
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
  Statement stat = con.createStatement();
  
  
  rs=stat.executeQuery("select * from TEAM where team_name='"+str+"' ");
  %>
  <%if(rs.next())
  {
	 
	  score=rs.getInt(3);
	  //teamno=rs.getInt(1);
  }
   %>
   
      

  <td><% out.print(str);%></td>
  </tr>

<tr>

<td style="font-family: Roboto Mono;">Score :</td>

<td><% out.print(score);%></td>

</tr>



</table>
<%rs.close();
stat.close();
}catch(ClassNotFoundException e)
{
    out.println(e.getLocalizedMessage());
}%>

<form method="get" action="Interrupt.jsp" >

<button style="font-family: Roboto Mono" class="button2" id="b7" type="submit"><span>RESUME GAME</span></button></form><br>

<form method="get" action="level1MAN.html" >

<button style="font-family: Roboto Mono" class="button2" id="b8" type="submit"><span>START</span></button></form><br>

<form method="get" action="Instructions.html" target="_blank">

<button style="font-family: Roboto Mono" class="button2" id="b9" type="submit"><span>INSTRUCTIONS</span></button></form><br>

</body>

</html>