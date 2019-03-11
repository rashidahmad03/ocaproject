<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
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
	

  
    <title>Preparation for Certification</title>
	<link rel="icon" type="image/png" href="http://www.incapp.in/img/incapp-icon.png"/>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="css/heroic-features.css" rel="stylesheet">
<style>
@font-face 
{
    font-family:ChaletParis;
    src: url(fonts/ChaletParis.ttf);
}
</style>
</head>

<body class="abc">
<%
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement getDataIncappId=db.getGetDataIncappId();
    getDataIncappId.setString(1,(String)ud.get("incappId"));
    ResultSet rs=getDataIncappId.executeQuery();
    rs.next();
    String name=(String)ud.get("name");
    String incappid=(String)ud.get("incappId");
    String examType="MockExam";
%>
 
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
           <li class="nav-item active">
              <a class="nav-link" href="Profile.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="ExamReport.jsp">Exam Report
              </a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="logout.jsp">Logout
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="MyAccount.jsp">MyAccount</a>
            </li>
            <li class="nav-item">
                    <a  href="Profile.jsp" title="Profile">
			<img src="GetPhoto?incappid=<%=incappid%>" alt="Profile Pic" width="50" />
                    </a>
           </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
	
      <!-- Jumbotron Header -->
      <header class="jumbotron my-4 xyz">
	<div class="col-sm-offset-2 col-sm-5">
	</div>
          <br/>
            <div class="row">   
                <div class="col-sm-3">
                    Welcome &nbsp: <b><%=name%></b> 
                </div>
                <div class="col-sm-7"> <%
                                       String s=(String)session.getAttribute("msg");
                                       if(s!=null)
                                       {
 %>
                                  <b class="msg"><%=s%></b>
                                     <%
                                        session.setAttribute("msg",null);
                                       }
%>
                </div>
       
                          
            </div>
                <br/>
      <!-- Page Features -->
		<h3 class="display-4 text-center" style=" color: Maroon">Topic Wise</h3>
                </br>
      <div class="row ">


     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon"> Java Basics</h4>
              <p class="card-text">
                 * Define the scope of variables 
                 <br>* Define the structure of a Java class
                 <br>* Create executable Java applications with a main method; run a Java program from the command line; produce console output
                 <br>* Import other Java packages to make them accessible in your code
                <br>* Compare and contrast the features and components of Java such as: platform independence, object orientation, encapsulation, etc.
                </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Java Basics" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
      </div>
     </div>
     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Working With Java Datatypes</h4>
              <p class="card-text">
                * Declare and initialize variables (including casting of primitive data types)
                <br>* Differentiate between object reference variables and primitive variables
                <br>* Know how to read or write to object fields
                <br>* Explain an Object's Lifecycle (creation, "dereference by reassignment" and garbage collection)
                <br>* Develop code that uses wrapper classes such as Boolean, Double, and Integer  

              </p>
            </div>
           <div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Working With Java Datatypes" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>	
        </div>
     </div>
     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Using Operators and Decision Constructs</h4>
              <p class="card-text">
                    * Use Java operators; use parentheses to override operator precedence
                    <br>* Test equality between Strings and other objects using == and equals ()
                    <br>* Create if and if/else and ternary constructs 
                    <br>* Use a switch statement 
                </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Using Operators and Decision Constructs" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>		
          </div>
     </div>
		
     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Creating and Using Arrays</h4>
              <p class="card-text">
                   * Declare, instantiate, initialize and use a one-dimensional array
                   <br>*  Declare, instantiate, initialize and use multi-dimensional arrays
                  </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Creating and Using Arrays" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
          </div>
     </div>
      
     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Using Loop Constructs</h4>
              <p class="card-text">
                       * Create and use while loops
                        <br>* Create and use for loops including the enhanced for loop
                        <br>* Create and use do/while loops
                        <br>* Compare loop constructs
                        <br>* Use break and continue  
                 </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Using Loop Constructs" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>				
          </div>
     </div>
		
		
     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Working with Methods and Encapsulation </h4>
              <p class="card-text">
                   * Create methods with arguments and return values; including overloaded methods
                    </br>* Apply the static keyword to methods and fields  
                    </br>* Create and overload constructors; differentiate between default and user defined constructors
                    </br>* Apply access modifiers
                    </br>* Apply encapsulation principles to a class
                    </br>* Determine the effect upon object references and primitive values when they are passed  into methods that change the values
               </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Working with Methods and Encapsulation" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
          </div>
     </div>
			
     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Working with Inheritance  </h4>
              <p class="card-text">
                    * Describe inheritance and its benefits
                     </br>* Develop code that makes use of polymorphism; develop code that overrides methods;  differentiate between the type of a reference and the type of an object
                     </br>* Determine when casting is necessary
                     </br>* Use super and this to access objects and constructors
                     </br>* Use abstract classes and interfaces
                </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Working with Inheritance " data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
          </div>
     </div>
          
			
     <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Java String</h4>
              <p class="card-text">
                    * Describe inheritance and its benefits
                     </br>* Develop code that makes use of polymorphism; develop code that overrides methods;  differentiate between the type of a reference and the type of an object
                     </br>* Determine when casting is necessary
                     </br>* Use super and this to access objects and constructors
                     </br>* Use abstract classes and interfaces
                </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="JavaString" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
          </div>
     </div>
          
           <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Handling Exceptions </h4>
              <p class="card-text">
                    * Differentiate among checked exceptions, unchecked exceptions, and Errors
                    </br>* Create a try-catch block and determine how exceptions alter normal program flow
                    </br>* Describe the advantages of Exception handling 
                    </br>* Create and invoke a method that throws an exception
                    </br>* Recognize common exception classes (such as NullPointerException, ArithmeticException, ArrayIndexOutOfBoundsException, ClassCastException)
                </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Handling Exceptions " data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
          </div>
     </div>
          
            <div class="col-lg-6 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
              <h4 class="card-title"style=" color: Maroon">Working with Selected classes from the Java API </h4>
              <p class="card-text">
                   *  Manipulate data using the StringBuilder class and its methods
                    </br>*  Create and manipulate Strings
                    </br>*  Create and manipulate calendar data using classes from java.time.LocalDateTime,  java.time.LocalDate, java.time.LocalTime, java.time.format.DateTimeFormatter, java.time.Period
                    </br>*  Declare and use an ArrayList of a given type 
                    </br>*  Write a simple Lambda expression that consumes a Lambda Predicate expression
                </p>
            </div>
	<div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Working with Selected classes from the Java API " data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
          </div>
     </div>
		
      </div>
                	<h3 class="display-4 text-center" style=" color: Maroon">OCA Mock Exam</h3>
                </br>
        <div class="row ">
                <div class="col-lg-6 col-md-6 mb-4">
                   <div class="card">
                       <div class="card-body">
                         <h4 class="card-title"style=" color: Maroon"> Mixed Exam </h4>
                         <p class="card-text">
                             * Java Basics
                             </br>* Working With Java Data Types
                             </br>* Using Operators and Decision Constructs 
                             </br>* Creating and Using Arrays 
                             </br>* Using Loop Constructs 
                             </br>* Working with Methods and Encapsulation 
                             </br>* Working with Inheritance 
                             </br>* Handling Exceptions 
                             </br>* Working with Selected classes from the Java API 
                         </p>
                       </div>
                  <div class="card-footer">
                 <a href="#" class="btn btn-success"  data-id="Full Syallabus Exam" data-toggle="modal" data-target="#TakeTest" id="classStructure">Take Test</a>
       </div>			
                     </div>
                </div>
            <%
                session.setAttribute("exam","FullExam");
            %>
        </div>
      </header>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	<!-- Modal-->
	<div id="TakeTest" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
                                       <h5 class="display-4 text-center" style="color: Maroon"><b>Instructions</b></h5>
                                                  <button type="button" class="close" data-dismiss="modal">X</button>
                                </div>
				<div class="modal-body">
                                       <div class="row ">
                                           <div class="col-lg-12 col-md-12 ">
                                                   <div class="form-group">
                                                            <label for="phone" class="control-label col-sm-12">
                                                                    <b>1.</b> The exam consists of 20 questions. Each question will have 4 options. 
                                                                     <br/>
                                                                    <b>2.</b> This is an adaptive examination therefore you will not be able to come back on previous question. So make sure, you click next only when you are sure about the answer.
                                                                     <br/>
                                                                    <b>3.</b> In order to proceed to next question, click on the next Button that will be present below the options.
                                                                     <br/>
                                                                    <b>4.</b> The time alloted for the exam will be mentioned on the top of the question.
                                                                     <br/>
                                                                    <b>5.</b> No negative marking and if you don't choose any option the first option will be chose, by default.
                                                                     <br/>
                                                                    <b>6.</b> At any time if you wish to end your exam, you can click on the End Exam button.
                                                                  <br/>
                                                                    <b>7.</b> Do not click refresh button.
                                                            </label>
                                                        </div>
                                                    <br/>
                                                    
                            
                                           <div class="row form-group">
                                                   <div class="col-sm-2"></div>
                                                           <div class="col-md-offset-2 col-sm-5">
                                                            <form action="InstructionProcess.jsp" method="get">
                                                                <input type="text" name="exam" id="bookId" value="" />
                                                            <input class="btn btn-success btn-md" type="submit" value="Start Exam" />
                                                        </form>           
                                                                         
                                                           </div>
                                                         
                                                        </div>
                                            </div>
                                        </div>
            
                                </div>
				
			</div>
		</div>
	</div>
        <!--/. Modal -->
        
     <!-- Footer -->
   

   <jsp:include page="footer.jsp" />

 </body>

</html>
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("Login.jsp");
    }
%>
