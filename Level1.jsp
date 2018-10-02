<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="level1css.css">
    <title>Level-1</title>
<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
		<script type="text/javascript" src='questions.json'></script>
		<script type='text/javascript' src='jsquiz.js'></script>
		<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>

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
    
    PreparedStatement ps1;
    int score=0;
    int time=3600;
    int c=3600;
    if(rs.next())
    {
    	score=rs.getInt(2);
    }
   
    	ResultSet rs2=statement.executeQuery("select time from STORE where team_name='"+str+"'");
    	
    	 
		 while(rs2.next())
		 {
			 c=rs2.getInt(1);
			// System.out.print(c);
	     }
     ps1=con.prepareStatement("update STORE set level_id='L01' where team_name='"+str+"'");
	 ps1.executeUpdate();
    
    	%>
    	<script type ="text/javascript" >
		var tim="<%=c%>";
		
		var t=0;
		var numCorrect=0;
		  var s=0;
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
                        	
                        	window.location.href="game1.html";
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
        </head>
        <body id="bg" onload="f1()">
       <div style="margin-top: 10px;margin-left: 200px">
    <div style="display: inline-flex; margin-left: -30px">

        <IMG src="team.png" style="height: 45px; margin-left: -100px"></img>
        <label id="TN" ><% out.print(str); %></label>
    </div>
    <div >
        <img src="hourglassT.gif" id="HG" style="height: 60px ;margin-left: 700px"></img>
        <label id="time"></label>
    </div>
    <br><br>
  <label id="score" style="margin-left:770px; margin-top:-10px;">Score:<% out.print(score); %></label>
  <br><br>
    </div>

       <div id="quesBox">
        <br/>
  			<div id='quiz'></div>
			<div class='button' id='next'><a href='#'>Next</a></div>    		
    	</div>

 
	<button class='button2' value="submit" type="submit" onclick="window.location.href='ans1.jsp?scr='+s+'&Count='+numCorrect+'&t='+t">Next Level</button>
 

</body>

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
 /* $('#prev').on('click', function (e) {
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
        if(questionCounter === 1){
          $('#prev').show();
        } else if(questionCounter === 0){
          
          $('#prev').hide();
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
    numCorrect = 0;
    if(i<=2)
    	{
      if (selections[i] == questions[i].correctAnswer) {
        numCorrect++;
        s=parseInt(s)+20;
      }
      else
        	s=parseInt(s)-10;
    	}
    
    score.append('You got ' + numCorrect + ' questions out of ' +
                 questions.length + ' right!!!');
    document.getElementById("score").innerHTML= "Score: " + s;
    if(i == 3)
       return "Your level 1 is complete!";
  }
})();
		
	</script>
	
<%
	rs.close();
	
	rs2.close();
	statement.close();
	
	con.close();

}catch(Exception e)
{
	 out.println(e.getLocalizedMessage());
}

%>
</html>
