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

  <style>
   table {border-collapse:collapse; table-layout:fixed; width:310px;}
   table td {border:solid 1px #fab; width:100px; word-wrap:break-word;}
   </style>

</head>

<body class="abc">
<%
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    String name=(String)ad.get("name");
    PreparedStatement getAllQuestions = db.getGetAllQuestions();
    ResultSet gaqrs=(ResultSet)session.getAttribute("gaqrs");
    session.setAttribute("gaqrs",null);
%>
   <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-bottom xyz navbar-light fixed-top">
      <div class="container">
	  <div><img src="images/incapp-logo.png" width="150" alt="incapp logo"></div>
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
                </div>
            </div>
                <br/>
      <!-- Page Features -->
                	<div class="row alert alert-warning">
                            <div class="col-sm-offset-2 col-sm-2">
                                    <a href="AdminHome.jsp" class="btn btn-danger btn-md" >Add question</a>
                              </div>   
                            <div class="col-sm-offset-2 col-sm-2">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
				<a href="ViewModifyQuestion.jsp" class="btn btn-danger btn-md" >View/Modify question  </a>
                            </div>   
                            <div class="col-sm-offset-2 col-sm-2">
                            </div> 
                            <div class="col-sm-offset-2 col-sm-2">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
                              <a href="DeleteExam.jsp" class="btn btn-danger btn-md"  data-toggle="modal" data-target="#DeleteExam" >Delete Exam</a>
                            </div>
                        </div> 
      </br></br>
     <h3 class="display-4 text-center" style=" color: Maroon">View/Modify question </h3>
       </br></br>
       <div class="row">
          </br></br>
             	 <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                 <form class="form-horizontal" action="GetAllQuestions.jsp" name="lForm" onsubmit="return(validate());">
                                               <div class="form-group">
                                                      <div class="row"> 
                                                               <div class="col-sm-2">
                                                                      <label for="id" class="control-label">Exam Category: </label>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <select name="category" class="form-control">
                                                                      <% PreparedStatement getCategory=db.getGetCategory();
                                                                       ResultSet rs=getCategory.executeQuery();
                                                                       while(rs.next()){
                                                                        %>
                                                                      <option><%=rs.getString(1)%></option>
                                                                        <% }
                                                                        %>
                                                                    </select>
                                                                  </div> 
                                                               <div class="col-sm-2">
                                                                      <label for="id" class="control-label">Exam Name: </label>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <select name="exam" class="form-control">
                                                                      <% PreparedStatement getExamName=db.getGetExamName();
                                                                       ResultSet rs1=getExamName.executeQuery();
                                                                       while(rs1.next()){
                                                                        %>
                                                                      <option><%=rs1.getString(1)%></option>
                                                                        <% }
                                                                        %>
                                                                    </select>
                                                                </div> 
                                                                 <div class="col-sm-2">
                                                                    <button type="submit" class="btn btn-success">Go</button>
                                                                 </div>
                                                      </div>
                                               </div>
                                       </form>
                                </div>
                            </div>       
                         </div>
                              <label id="errorLogin" style=" color: #af2d2d"></label>
                        <!-- row-->              
                </div>
       </br>        <%
                                       String examName=(String)session.getAttribute("examName");
                                       if(examName!=null && gaqrs!=null)
                                       {
                   %>
                                  <h3>Exam : <b class="msg"><%=examName%></b></h3>
                                     <%
                                   }
                   %>
</br>
<%
    if(gaqrs!=null)    
     {
  %> 
  
  
  
  <div class="container">
    <div class="card-columns">
     <%
             while(gaqrs.next())
            {
    %>
        <div class="card">
       <div class="card-title">Id=: <%=gaqrs.getString(1)%></div>
       <p class="card-text"> <%=gaqrs.getString(2)%></p>
    <table class="table table-striped" style="
    font-size: xx-small;
">
    <thead>
      <tr>
        <th>Option 1</th>
        <th>Option 2</th>
        <th>Option 3</th>
        <th>Option 4</th>
        <th>Ans</th>
      </tr>
    </thead>
     <tbody>
   
        <tr>
      
       
        <td><%=gaqrs.getString(3)%></td>
        <td><%=gaqrs.getString(4)%></td>
        <td><%=gaqrs.getString(5)%></td>
        <td><%=gaqrs.getString(6)%></td>
        <td><%=gaqrs.getString(7)%></td>
        </tr>
   
   </tbody>
   </table>
   <div class="row">
							<div class="col-sm-6">
							<form action="DeleteQuestion.jsp" method="post">
                         <input type="hidden" name="qid" value="<%=gaqrs.getInt(1)%>"/>
                         <button type="submit" class="btn btn-outline-primary btn-block"  >Delete</button>
                     </form>	</div>
							<div class="col-sm-6">
							
                      <form action="GetQuestion.jsp" method="post">
                         <input type="hidden" name="qid" value="<%=gaqrs.getInt(1)%>"/>
                         <button type="submit" class="btn btn-outline-primary btn-block"  >Edit</button>
                     </form>
							</div>
						</div>
    
                     
        </div>
        
        <%
        }

    }
%>

 
     </div>
        </div>
        
  
  
  
  
  
  
  
  
  
  
  
    


  
    </header>
      <!-- /jumbotron -->
    </div>
    <!-- /.container -->
	<!-- Modal-->
	<div id="NewExamCategory" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
				</div>
                            <div class="modal-body">
                                <form class="form-horizontal" action="AddCategory.jsp" name="lForm" >
                                    <div class="row form-group">
                                                    <label for="id" class="control-label col-sm-2">Exam Category: </label>
                                                    <div class="col-sm-6">
                                                          <input type="text" class="lform form-control" name="category" />
                                                     </div>
                                                    <div class="col-sm-offset-3 col-sm-2">
                        				<button type="submit" class="btn btn-danger">  Submit </button>
                               			</div>
                                        </div>
                                 </form>   
                            </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
        <div id="NewExamName" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
				</div>
                            <div class="modal-body">
                                <form class="form-horizontal" action="AddExamName.jsp" name="lForm" >
                                 
                                                    <div class="row"> 
                                                               <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Exam Category: </label>
                                                                </div>
                                                                <div class="col-sm-5">
                                                                    <select name="category" class="form-control">
                                                                      <% rs=getCategory.executeQuery();
                                                                       while(rs.next()){
                                                                        %>
                                                                      <option><%=rs.getString(1)%></option>
                                                                        <% }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                      </div>
                                        <div class="row form-group">
                                                      <label for="id" class="control-label col-sm-2">Exam Name: </label>
                                                    <div class="col-sm-6">
                                                          <input type="text" class="lform form-control" name="exam" />
                                                     </div>
                                                    <div class="col-sm-offset-3 col-sm-2">
                        				<button type="submit" class="btn btn-danger">  Submit </button>
                               			</div>
                                        </div>
                                 </form>   
                            </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
     <!-- Modal to edit an exam-->
     <div id="EditExam" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
				<div class="modal-title"><h4>Delete Exam</h4></div></div>
                                <div class="modal-body">
                                    <form class="form-horizontal" action="EditExamProcess.jsp" name="lForm" >
                                                       <div class="row"> 
                                                               <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Exam : </label>
                                                                </div>
                                                                <div class="col-sm-5">
                                                                    <select name="exam" class="form-control">
                                                                      <% rs=getExamName.executeQuery();
                                                                       while(rs.next()){
                                                                        %>
                                                                      <option><%=rs.getString(1)%></option>
                                                                        <% }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                    <div class="col-sm-offset-3 col-sm-2">
                        				<button type="submit" class="btn btn-danger" >  Submit </button>
                               			</div>
                                                      </div>
                                    </form>
                                </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
     <!-- End of the modal-->
<!-- Delete Exam Modal-->
<div id="DeleteExam" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
				<div class="modal-title"><h4>Delete Exam</h4></div></div>
                                <div class="modal-body">
                                    <form class="form-horizontal" action="DeleteExamProcess.jsp" name="lForm" >
                                                       <div class="row"> 
                                                               <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Exam : </label>
                                                                </div>
                                                                <div class="col-sm-5">
                                                                    <select name="exam" class="form-control">
                                                                      <% rs=getExamName.executeQuery();
                                                                       while(rs.next()){
                                                                        %>
                                                                      <option><%=rs.getString(1)%></option>
                                                                        <% }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                    <div class="col-sm-offset-3 col-sm-2">
                        				<button type="submit" class="btn btn-danger" >  Submit </button>
                               			</div>
                                                      </div>
                                    </form>
                                </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	  </div>
        <!-- End Of Delete Modal-->
     <!--/. Modal -->
    <!-- Footer -->
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