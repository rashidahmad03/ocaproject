<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page errorPage="ExceptionPage.jsp"%>

<%
    HashMap ud=(HashMap)session.getAttribute("userdata");
    if(ud!=null){
%>	
        
        <!DOCTYPE html>
	<html lang="en">
	<head>

  
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="utility/css/bootstrap.min.css">
<link rel="stylesheet" href="utility/css/bootstrap-grid.css">
<link rel="stylesheet" href="utility/css/bootstrap-reboot.css">
<link rel="stylesheet" href="utility/css/bootstrap.css">
<link rel="stylesheet" href="utility/css/mycse.css">
<script src="utility/js/jquery-3.3.1.js"></script>
<script src="utility/js/angular.js"></script>
<script src="utility/js/bootstrap.min.js"></script>
<script src="utility/js/bootstrap.js"></script>
<script src="utility/js/bootstrap.bundle.js"></script>
<script src="utility/js/popper.min.js"></script>


    <title>Certification Preparation Portal</title>
	<link rel="icon" type="image/png" href="img/incapp-icon.png"/>


<%
    String roll=(String)ud.get("incappId");
    String name=(String)ud.get("name");
    String incappid=(String)ud.get("incappId");
 
    int min=0;
    int sec=0;
    int counter=0;
    int n=0;	
    n=((Integer)session.getAttribute("nq")).intValue();
    min=((Integer)session.getAttribute("min")).intValue();
    sec=Integer.parseInt((String)session.getAttribute("sec"));
    counter=Integer.parseInt((String)session.getAttribute("counter"));
%>

<!-- code to disable right click on the webpage -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript">
$(function()
{
	$(this).bind('contextmenu',function()
	{
		return false;
	}
	)
}
)
</script>

<script language="javascript" type="text/javascript">
z=0;

if(z==0)
{

        window.location.hash="no-back-button";
        window.location.hash="Again-No-back-button";
        //again because google chrome don't insert first hash into history
        window.onhashchange=function(){window.location.hash="no-back-button";
        }

}
else ;

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}

limit="<%=n%>";

counter=<%=counter%>;

min="<%=min%>";

sec="<%=sec%>";

c=0;
function startTimer()
{   
    document.getElementById('aa').innerHTML=min;
    document.getElementById('bb').innerHTML=sec;
    if(sec>1)
    {
        sec=sec-1;
        t=setTimeout("startTimer()",1000);
    }
    else if(sec==1)
    {
        if(min>0)
        {
            min=min-1;
            sec=60;
            t=setTimeout("startTimer()",1000);
        }
        else
        {
            parent.location='result.jsp';
        }
    }
    
}
function getTimer()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if(xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            //document.getElementById("bb").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("POST","getTimer.jsp?min1="+min+"&sec1="+sec,true);
    xmlhttp.send();

}
</script>

 </head>

<body class="abc" onLoad="startTimer()">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-bottom xyz navbar-light fixed-top">
     <div class="container">
	  <div><img src="http://www.incapp.in/img/incapp-logo.png" width="150" alt="incapp logo"></div>
        <a class="navbar-brand" href="#" ><h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		Preparation for Certification</h4></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
           
            <li class="nav-item">
                <%=(String)ud.get("name")%>
                            <img src="GetPhoto?incappid=<%=incappid%>" alt="Profile Pic" width="50" />
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
	
<%
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
   
ArrayList<Integer> tq=(ArrayList<Integer>)session.getAttribute("totalQuesArray");

String tableName=(String)session.getAttribute("tableName");

    int qid=(Integer)session.getAttribute("qid");
    qid=qid+1;
    System.out.println("qid="+qid);
    session.setAttribute("qid",qid);

Integer t=(Integer)session.getAttribute("totalQues");
int totalQues=t.intValue();

int max=-1;
int tot_quest=-1;
String statement="";
String opt1="";
String opt2="";
String opt3="";
String opt4="";
int sol=0;
int ans=0;
Statement st=db.getSt();
try
{
    if(qid<=n)
    {  
        ResultSet rs=st.executeQuery("select * from "+tableName+" where qid="+tq.get(qid));    
        if(rs.next())
        {
            statement=rs.getString(2);
            opt1=rs.getString(3);
            opt2=rs.getString(4);
            opt3=rs.getString(5);
            opt4=rs.getString(6);
            sol=rs.getInt(7);
%>
            <br/>
      <!-- Jumbotron Header -->
      <div class="jumbotron my-4 xyz">
            
          <br/>
            <div class="row">   
                <div class="col-sm-3">
                    Welcome :- <b><%=name%></b> 
                </div>
                <div class="col-sm-7">
                </div>
                <div class="col-sm-2">
                        <FONT COLOR=RED>Time Left: <b><label id="aa" ></label> : <label id="bb" ></label> </b></font>
                </div>                   
            </div>
                <br/>
   
      <!-- Page Features -->
   
     <div class=" form-group">
         <div class="control-label"><h4>Question <%=qid%>:- <%=statement%><!--Given the following classes, what is the maximum number of imports that can be removed and have the code still compile?

    <br/> <br/><pre>//Shape.java
     package com.java2s; 
     
     public class Shape { } 


     //Printer.java
     package com.java2s; 
     
     import java.lang.*; 
     import java.lang.System; 
     import com.java2s.Shape; 
     import com.java2s.*; 
     
     public class Printer { 
        public void print(Shape shape) { 
           System.out.println(shape); 
        } 
     } 
       </pre>
                                                            -->
             </h4>
                        <form action="CheckAnswer.jsp" method="post">
					<br/><br/>
					<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;<div class="col-sm-0"><input class="col-mf-offset-2 from-group" type="Radio" value="1" name="ques" checked="checked" /></div><div class="col-sm-11"><h5><%=opt1%>.</h5></div></div>
                                        <div class="row">&nbsp;&nbsp;&nbsp;&nbsp;<div class="col-sm-0"><input class="from-group" type="Radio" value="2" name="ques"></div><div class="col-sm-11"><h5><%=opt2%>.</h5></div></div>  
					<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;<div class="col-sm-0"><input class="from-group" type="Radio" value="3" name="ques"></div><div class="col-sm-11"><h5><%=opt3%>.</h5></div></div>  
					<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;<div class="col-sm-0"><input class="from-group" type="Radio" value="4" name="ques"></div><div class="col-sm-11"><h5><%=opt4%>.</h5></div></div>  
					        <input type="hidden" name="answer" value="<%=sol%>" />
                                                <input class="btn btn-primary btn-md" type="submit" onClick="getTimer()" value="Next" />
                        		</form>	
                            </div>
				<br/>   
                                &nbsp;
                        <input class="btn btn-danger btn-md" type="button" value="End Exam" onclick="parent.location='result.jsp'" />
                
				<br/>
			<br/>
		<br/>
	   </div>
      <!-- /.row -->
</div>
                <%
            }
	}
	else
	{
%>
            <jsp:forward page="result.jsp" />
<%
	}   
    }
    catch(Exception e)
    {
            st.executeUpdate("delete from result_review");
    }
%>                   

<!-- /.jumbotron -->
    
    </div>
    <!-- /.container -->
	
    <jsp:include page="footer.jsp" />

    </body>
</html>
<%
    }
    else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("Login.jsp");
    }
%>
