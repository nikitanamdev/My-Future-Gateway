<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Level-3</title>
		<link type='text/css' rel='stylesheet' href='stylesheet.css'/>
		<link href="https://fonts.googleapis.com/css?family=Jura|Roboto+Condensed|Roboto+Mono" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Play|Source+Code+Pro" rel="stylesheet">
	
	<style>
	body {
	color: white; 
    font-family:  Source Code Pros;
    background-position: center;
    background-image: url('https://steamusercontent-a.akamaihd.net/ugc/879751236399989711/CAD2C3FDCF426DF9D4C794AA16480E00561A6587/');
    background-repeat:no-repeat ;
    background-size:cover;
}

h1 {
    text-align: center;
}

#score{
    color: white;
    font-size: xx-large;
    border-color: black;
    border-style: groove;
    border-width: 2.5px;
    border-radius: 5px;
    margin-right: -5px;
    padding: 14px;
    width:150px;
    height:40px;
    margin-top: 50px;
    
}

#quiz {
    text-indent: 10px;
    display:none;
}

.button {
    border:4px solid;
    border-radius:5px;
    width: 40px;
    padding-left:5px;
    padding-right: 5px;
    position: relative;
    float:right;
    background-color: #DCDCDC;
    color: black;
    margin: 0 2px 0 2px;
}

.button.active {
    background-color: #F8F8FF;
    color: #525252;
}

button {
    position: relative;
    float:right;
}

.button a {
    text-decoration: none;
    color: black;
}
.button2 {
  display: inline-block;
  font-family:Source Code Pro;
  border-radius: 4px;
  background-color: #B0C4DE;
  border: none;
  color: 000000;
  text-align: center;
  font-size: 18px;
  padding: 20px;
  width: 100px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  opacity: 0.6;
  filter: alpha(opacity=60);
  margin-left: 60%;
  
}
#HG{
	margin-right:5px;
	margin-top:-70px;
}
#time{

    color: white;
    font-size: xx-large;
    border-color: black;
    border-style: groove;
    border-width: 2.5px;
    border-radius: 5px;


    position:absolute;
    padding-right: 10px;
    padding-left: 10px;
    width: 80px;
    height:40px;
    padding-top: 10px;
    margin-top:-50px;
    font-size: xx-large;
   

}
.button2 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button2 span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button2:hover span {
  padding-right: 25px;
}

.button2:hover span:after {
  opacity: 1;
  right: 0;
}
#container {
    opacity: 0.6;
    filter: alpha(opacity=60);
    width:70%;
    height: 50%;
    margin:auto;
    padding: 25px 20px 40px 25px;
    background-color: #000080;
    border:4px solid #B0E0E6;
    border-radius:5px;
    color: #FFFFFF;
    font-weight: bold;
    box-shadow: 5px 5px 5px #888;
    top:100px;
}

ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

#prev {
    display:none;
}

#start {
    display:none;
    width: 90px;
}</style>
</head>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
	<body onload="f1()">
	
	<%
//String str=(String)session.getAttribute("teamname");
String str=(String)session.getAttribute("teamname");
try
{
	
	//out.print(ans);
	Connection con;
	Class.forName("oracle.jdbc.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HARRYPOTTER","oracle123"); 
    Statement statement = con.createStatement();
   // PreparedStatement stat=con.prepareStatement("update TEAM set ans1='"+ans+"' where team_name=?");
   // PreparedStatement ps1=con.prepareStatement("select * from TEAM");
    ResultSet rs=statement.executeQuery("select team_name,score from TEAM where team_name='"+str+"'");
   
    int score=0;
    int time=3600;
    PreparedStatement ps1;
    if(rs.next())
    { 
    	str=rs.getString(1);
    	score=rs.getInt(2);
    }
    ResultSet rs1=statement.executeQuery("select time from STORE where team_name='"+str+"'");
    if(rs1.next())
    {
    	time=rs1.getInt(1);
    }
    while(rs1.next())
    {
		 time=rs1.getInt(1);
		// System.out.print(c);
    }
	ps1=con.prepareStatement("update STORE set level_id='L03' where team_name='"+str+"'");


	ps1.executeUpdate();
    %>
    <script type ="text/javascript" >
		var tim="<%=time%>";
		var numCorrect = 0;
		var s="<%=score%>";
		var t;
		var min = Math.floor(tim / 60);
		var sec = Math.floor(tim %  60);
        var f = new Date();
        function f1() {
            f2();
           
           // document.getElementById("starttime").innerHTML = "Your started your Exam at " + f.getHours() + ":" + f.getMinutes();
             
          
        }
        function f2() {
            if (parseInt(sec) > 0) {
                sec = parseInt(sec) - 1;
                document.getElementById("time").innerHTML =min + ":" + sec;
                tim = setTimeout("f2()", 1000);
            }
            else {
                if (parseInt(sec) === 0) {
                    min = parseInt(min) -1;
                    if ( parseInt(min) < 0 ) {
                        clearTimeout(tim);
                      //  location.href = "default5.aspx";
                        alert("Time Out");
		 setTimeout(function(){
                        	
                        	window.location.href="Level3.html";
                        },4000);
                    }
                    else {
                        sec = 60;
                       // document.getElementById("showtime").innerHTML = "Your Left Time  is : " + min + " Minutes ," + sec + " Seconds";
                        tim = setTimeout("f2()", 1000);
                    }
                }
               
            }
        t=min*60+sec;
        }
        </script>
		<div id='title'>
				<div id="team name"><font size="10px" st><% out.print(str); %></font></strong></div>
				<div ><img src="hourglassT.gif" id="HG" style="height: 60px ;margin-left: 1000px"><label id="time"></label></div>
				<br><br>
				<div id="score" style="margin-left:1065px; margin-top:-10px;" >Score: <% out.print(score); %></div>
				<br><br>
			</div>
		<div id='container'>
			
   			<br/>
  			<div id='quiz'></div>
    		<div class='button' id='next'><a href='#'>Next</a></div>
    		
    	</div>

		<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
		<script type="text/javascript" src='questions.json'></script>
		<script type='text/javascript' src='jsquiz.js'></script>
	</body>
	
	<button class='button2' value="submit" type="submit" onclick="window.location.href='ans3.jsp?scr='+s+'&Count='+numCorrect+'&t='+t">Next Level</button>
	
	<script>
		(function() {
  var questions = [{
    question: "Consider a hash function that distributes keys uniformly. The hash table size is 20. After hashing of how many keys will the probability that any new key hashed collides with an existing one exceed 0.5.?",
    choices: [5, 6, 7, 10, 11],
    correctAnswer: 3
  }, {
    question: " Who is also known as the father of Compilers?",
    choices: ["Bob Metcalfe", "Grace Hopper", "William Gibson", "Alan Cooper"],
    correctAnswer: 1
  }, {
    question: "What are the time complexities of finding 8th element from beginning and 8th element from end in a singly linked list? Let n be the number of nodes in linked list,you may assume that n > 8?",                       
    choices: ["O(1) and O(1)", "O(n) and O(n)", "O(n) and O(1)", "O(1) and O(n)"],

    correctAnswer: 3
  }

  ];
  
  var questionCounter = 0; //Tracks question number
  var selections = []; //Array containing user choices
  var quiz = $('#quiz'); //Quiz div object
  
  // Display initial question
  document.getElementById("score").innerHTML= "Score: " + s;
  displayNext();
  // Click handler for the 'next' button
  $('#next').on('click', function (e) {
    e.preventDefault();
    
    // Suspend click listener during fade animation
    if(quiz.is(':animated')) {        
      return false;
    }
    choose();
    
    // If no user selection, progress is stopped
   // if (isNaN(selections[questionCounter])) {
     // alert('Please make a selection!');
    //} else {
      displayScore(questionCounter);	
      questionCounter++;
      
      displayNext();
    //}
  });
  
  // Click handler for the 'prev' button
  /*$('#prev').on('click', function (e) {
    e.preventDefault();
    
    if(quiz.is(':animated')) {
      return false;
    }
    choose();
    questionCounter--;
    displayNext();
  });
  
  // Click handler for the 'Start Over' button
 /* $('#start').on('click', function (e) {
    e.preventDefault();
    
    if(quiz.is(':animated')) {
      return false;
    }
    questionCounter = 0;
    selections = [];
    displayNext();
    $('#start').hide();
  });*/
  
  // Animates buttons on hover
  $('.button').on('mouseenter', function () {
    $(this).addClass('active');
  });
  $('.button').on('mouseleave', function () {
    $(this).removeClass('active');
  });
  
  // Creates and returns the div that contains the questions and 
  // the answer selections
  function createQuestionElement(index) {
    var qElement = $('<div>', {
      id: 'question'
    });
    
    var header = $('<h2>Question ' + (index + 1) + ':</h2>');
    qElement.append(header);
    
    var question = $('<p>').append(questions[index].question);
    qElement.append(question);
    
    var radioButtons = createRadios(index);
    qElement.append(radioButtons);
    
    return qElement;
  }
  
  // Creates a list of the answer choices as radio inputs
  function createRadios(index) {
    var radioList = $('<ul>');
    var item;
    var input = '';
    for (var i = 0; i < questions[index].choices.length; i++) {
      item = $('<li>');
      input = '<input type="radio" name="answer" value=' + i + ' />';
      input += questions[index].choices[i];
      item.append(input);
      radioList.append(item);
    }
    return radioList;
  }
  
  // Reads the user selection and pushes the value to an array
  function choose() {
    selections[questionCounter] = +$('input[name="answer"]:checked').val();
  }
  
  // Displays next requested element
  function displayNext() {
    quiz.fadeOut(function() {
      $('#question').remove();
      
      if(questionCounter < questions.length){
        var nextQuestion = createQuestionElement(questionCounter);
        quiz.append(nextQuestion).fadeIn();
        if (!(isNaN(selections[questionCounter]))) {
          $('input[value='+selections[questionCounter]+']').prop('checked', true);
        }
        
        // Controls display of 'prev' button
       if(questionCounter === 0){
          
          $('#next').show();
        }
      }else {
        var scoreElem = displayScore(3);
        quiz.append(scoreElem).fadeIn();
        $('#next').hide();
        $('#prev').hide();
        $('#start').show();
      }
    });
  }
  // Computes score and returns a paragraph element to be displayed
   
  function displayScore(i) {
	    var score = $('<p>',{id: 'question'});    
	 //   for (var i = 0; i < selections.length; i++) {
		 if(i<3){
	      if (selections[i] == questions[i].correctAnswer) {
	        numCorrect++;
	        s=parseInt(s)+20;
	      }
	      else
	    	  {
	    	  s=parseInt(s)-10;
	    	  }
		 }
	    score.append('You got ' + numCorrect + ' questions out of ' +
	                 questions.length + ' right!!!');
	    document.getElementById("score").innerHTML= "Score: " + s;
	    if(i==3)
	   		 return "Your level 3 has completed!";
	  }
	})();	
	</script>
	<%
}catch(Exception e)
{
	 out.println(e.getLocalizedMessage());
}

%>
</html>
