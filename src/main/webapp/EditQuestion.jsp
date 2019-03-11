<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page errorPage="ExceptionPage.jsp"%>

<%
    HashMap ad=(HashMap)session.getAttribute("admindata");
    if(ad!=null){
%>
<!DOCTYPE html>
	<html lang="en">

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
    String name=(String)ad.get("name");
    String incappid=(String)ad.get("incappid");
    ResultSet rs=(ResultSet)session.getAttribute("rs");
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
              <a class="nav-link" href="AdminHome.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="logout.jsp">Logout
              </a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="AdminChangePassword.jsp">Change Password</a>
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
                <div class="col-sm-9">
                                       <%
                                       String s=(String)session.getAttribute("msg");
                                       if(s!=null)
                                       {
 %>
                                  <b class="msg"><%=s%></b>
                                     <%
                                        session.setAttribute("msg",null);
                                       }
%>
                                       <%
                                       String s1=(String)session.getAttribute("pass");
                                       if(s1!=null)
                                       {
 %>
                                  <h1><b  class="msg"> Pass: <%=s1%></b></h1>
                                     <%
                                        session.setAttribute("pass",null); 
                                       }
%>
                </div>
            </div>
                <br/>
      <!-- Page Features -->
                	<div class="row alert alert-warning">
                            <div class="col-sm-offset-2 col-sm-2">
                            <form action="GetAllQuestions.jsp" method="post">
                <input type="hidden" name="exam" value="<%=session.getAttribute("examName")%>"/>
                <input type="hidden" name="category" value="<%=session.getAttribute("category")%>"/>
                <button type="submit" class="btn btn-danger"  >Back</button>
            </form>  </div>   
                            <div class="col-sm-offset-2 col-sm-1">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
                             </div>   
                            <div class="col-sm-offset-2 col-sm-1">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
                           </div> 
                            <div class="col-sm-offset-2 col-sm-2">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
                            </div>
                        </div>
      <h3 class="display-4 text-center" style=" color: Maroon">Edit Question </h3>
      </br>
      <%
                                       String examName=(String)session.getAttribute("examName");
                                       if(examName!=null && rs!=null)
                                       {
                   %>
                                  <h3>Exam : <b class="msg"><%=examName%></b></h3>
                                     <%
                                   }
                   %>
</br>
       <div class="row">
          
                	 <div class="col-md-10">
                            <div class="card">
                                <div class="card-body">
                                 <form class="form-horizontal" action="UpdateQues.jsp" method="post">
                                         <% if(rs!=null)
                                             if(rs.next()){
                                         %>             
                                         	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Question : </label>
                                                    <div class="col-sm-8">
                                                   	 <textarea class="from-control" name="quest"  rows="4" cols="75" ><%=rs.getString(2)%></textarea>
                                                  </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 1 : </label>
                                                    <div class="col-sm-8">
                                                        <textarea class="from-control" name="op1"  rows="4" cols="75" ><%=rs.getString(3)%></textarea>
                                                     </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 2 : </label>
                                                    <div class="col-sm-8">
                                                        <textarea class="from-control" name="op2"  rows="4" cols="75"><%=rs.getString(4)%></textarea>
                                                </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 3 : </label>
                                                    <div class="col-sm-8">
                                                        <textarea class="from-control" name="op3"  rows="4" cols="75" ><%=rs.getString(5)%></textarea>
                                                     </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 4 : </label>
                                                    <div class="col-sm-8">
                                                        <textarea class="from-control" name="op4"  rows="4" cols="75"><%=rs.getString(6)%></textarea>
                                                    </div>
                                            	</div>
                                               
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Answer : </label>
                                                    <div class="col-sm-8">
                                                          <input type="text" class="lform form-control" name="ans" value="<%=rs.getString(7)%>"/>
                                                     </div>
                                            	</div>
                                            <div class="col-sm-offset-6 col-sm-2">
                <input type="hidden" name="qid" value="<%=rs.getString(1)%>"/>
                                            <button type="submit" class="btn btn-success"> Update</button>
					</div>
                      <%
                                                     }
                            %>
                                </form>
                                </div>
                            </div>       
                    </div>
                                                       <label id="errorLogin" style=" color: #af2d2d"></label>
                        <!-- row-->              
                </div>
      </header>
      <!-- /jumbotron -->
    </div>
    <!-- /.container -->

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