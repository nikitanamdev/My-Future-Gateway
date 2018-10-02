<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" content="text/html; charset=ISO-8859-1" >
<title>Registration Form</title>
<link href="style_register.css" rel="stylesheet" type="text/css">
<link href="hm.html" rel="stylesheet"  type="text/html">

<link href='https://fonts.googleapis.com/css?family=Henny Penny' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Bungee Hairline' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Roboto Condensed' rel='stylesheet'>

<link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">

<link href='https://fonts.googleapis.com/css?family=Butcherman' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Metal Mania' rel='stylesheet'>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<body >

<h1 style="font-size:46px" align="center" ><strong> IGDTUW</strong></h1>
<h3 style="font-size:56px" align="center" ><strong>Registration Form</strong>
</h3>
<form action="regdata.jsp">

	<div style="font-family:'Roboto Condensed'; text-align:center; color:white"> 
		<label for="tname" ><h4><font size="5">Team Name * </font></h4> </label>
	    <input size=40 type="text" name="user_name" id="tname" placeholder="Name" style="color: white; font-size:15px; font-family:'Roboto Condensed'" required>
	    <label for="tname" style="min-height: 13px; font-size:15px;"><br />Enter your unique team name</label>
	</div>
	<div style="text-align: center;"> 
		<label for="ename"><h4><font size="5">E-mail * </font></h4></label>
	    <input size=40 type="email" name="user_mail" id="ename" placeholder="Email" style="color: white; font-size:15px; font-family:'Roboto Condensed'" required>
	    <label for="ename" style="min-height: 13px; font-size:15px;"><br />example@example.com</label>
	</div>
	<div style="text-align: center;"> 
		<label for="cname"><h4><font size="5">Contact No * </font></h4></label>
	    <input size=5 type="number" name="user_area" id="cname" max="99" min="10" placeholder="+91" style="color: white; font-size:15px; font-family:'Roboto Condensed'" required >-&nbsp;
	    <input  name="user_phone" size="20"  max="9999999999" MIN ="1000000000" type="number" placeholder="9876654322"  style="color: white; font-size:15px; font-family:Roboto Condensed" required>
	    <label for="cname" style="min-height: 13px; font-size:15px;">
	    <br />Area Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone Number</label>
	</div>
	<div style="text-align: center;" > 
		<label for="mname"><h4><font size="5">Team Member 1 Name * </font></h4></label>
	    <input size=15 type="text" name="user_mem1" id="mname" placeholder="Name 1" style="color: white; font-size:15px; font-family:'Roboto Condensed'" required> &nbsp;-&nbsp;
	    <input  name="mem1_last" size="20" placeholder="Lastname 1" style="color: white; font-size:15px; font-family:Roboto Condensed">
	    <label for="cname" style="min-height: 13px; font-size:15px;">
	    <br />First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name</label>
	</div>
	<div style="text-align: center;"> 
		<label for="mname"><h4><font size="5">Team Member 2 Name * </font></h4></label>
	    <input size=15 type="text" name="user_mem2" id="mname" placeholder="Name 2" style="color: white; font-size:15px; font-family:'Roboto Condensed'"required> &nbsp;-&nbsp;
	    <input  name="mem2_last" size="20" placeholder="Lastname 2" style="color: white; font-size:15px; font-family:Roboto Condensed">
	    <label for="cname" style="min-height: 13px; font-size:15px;">
	    <br />First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name</label>
	</div>
	
	
	<div style="text-align: center;"> 
		<label for="mname"><h4><font size="5">Any Team Member College Name * </font></h4></label>
	    <input size=30 type="text" name="user_cllg" id="mname" placeholder="College_name" style="color: white; font-size:15px; font-family:'Roboto Condensed'" required> 
	    <label for="mname" style="min-height: 13px; font-size:15px;"><br />College Name</label>
	</div>
	<div style="text-align:center" class="button";>
     	<input type="submit"  value=" submit" style="font-size:15pt;color:black;
background-color:white;border:4px solid grey;padding-top: 4px;
  padding-left: 3px; margin:20px; padding-right: 7px;
  padding-bottom: 3px;border-radius: 10px;font-family: Princess Sofia;
   ">
     </div>
     
</form>
</body>
</html>