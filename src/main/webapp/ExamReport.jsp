<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DbConnect"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
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


    <title>Certification Preparation Portal</title>
	<link rel="icon" type="image/png" href="img/incapp-icon.png"/>

    
    
    
    
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
    
    PreparedStatement getExamReport=db.getGetExamReport();
    getExamReport.setString(1,(String)ud.get("incappId"));
    ResultSet rs1=getExamReport.executeQuery();
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
                <div class="col-sm-7">      <%
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
      <div class="row">
      <%        int f=1;
          LocalDateTime prevDate=LocalDateTime.now();
          String prevD=prevDate.format(DateTimeFormatter.ofPattern("dd-MMM-yyyy hh:mm:ss a"));
          while(rs1.next()){
            LocalDateTime curDate=rs1.getTimestamp(4).toLocalDateTime();
                    String curD=curDate.format(DateTimeFormatter.ofPattern("dd-MMM-yyyy  hh:mm:ss a"));
%>

     <div class="col-lg-4 col-md-6 mb-4">
	<div class="card">
            <div class="card-body">
   <%              if(curD.equals(prevD)==false || f==1){
      %>
	</hr>           <h4 class="card-title"style=" color: Maroon"><%=curD%> </h4>  
          <%
                prevD=curD;
                f=0;
              }// end of if
        %>     
        </br>
        <div class="row">
            <div class="col-sm-7">
                <p class="card-text">
                    Exam: <b><%=rs1.getString("examName")%> </b>
                    <br>
                    Total Questions:  <%=rs1.getString("totalQues")%>
                    <br>
                    Correct:  <%=rs1.getString("result")%>
                </p>
            </div> 
            <div class="col-sm-4">    
               <form action="ViewDetails.jsp">
			<div class="col-sm-offset-1 col-sm-4">
				  <input type="hidden" name="erid" value="<%=rs1.getString(1)%>"/>
                                    <button type="submit" class="btn btn-success"> View Details </button>
			</div>
		</form>
             </div>
            </div>
            </div>
	  </div>
     </div>
              
                <%
                    }
                %>
      
        </div>
      </header>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	
 <jsp:include page="footer.jsp" />
 </body>

</html>
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("Login.jsp");
    }
%>
