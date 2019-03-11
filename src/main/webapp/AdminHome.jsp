<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DbConnect"%>
<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
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
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

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
    String name=(String)ad.get("name");
    String incappid=(String)ad.get("incappid");
%>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-bottom xyz navbar-light fixed-top">
      <div class="container">
	  <div>
	  <img src="images/incapp-logo.png" width="150" alt="incapp logo">
	  </div>
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
                                  <h1><b class="msg">Pass: <%=s1%></b></h1>
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
                                    <a href="AdminHome.jsp" class="btn btn-danger btn-md" >Add question</a>
                              </div>   
                            <div class="col-sm-offset-2 col-sm-1">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
					<a href="ViewModifyQuestion.jsp" class="btn btn-danger btn-md" >View/Modify question  </a>
                            </div>   
                            <div class="col-sm-offset-2 col-sm-1">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
                          		<a href="GetPasswordProcess.jsp" class="btn btn-danger btn-md" data-toggle="modal" data-target="#GetPassword" >Get Student Password </a>
                            </div> 
                            <div class="col-sm-offset-2 col-sm-2">
                            </div>
                            <div class="col-sm-offset-2 col-sm-2">
                                       <a href="DeleteExam.jsp" class="btn btn-danger btn-md"  data-toggle="modal" data-target="#DeleteExam" >Delete Exam</a>
                            </div>
                        </div>
      <h3 class="display-4 text-center" style=" color: Maroon">Add Question </h3>
       <div class="row">
          
                	 <div class="col">
                            <div class="card">
                                <div class="card-body">
                                 <form class="form-horizontal" action="AddQues.jsp" name="lForm" onsubmit="return(validate());">
                                               <div class="form-group">
                                                      <div class="row"> 
                                                               <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Exam Category: </label>
                                                                </div>
                                                                <div class="col-sm-4">
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
                                                                 <div class="col-sm-3">
                                                                     <button type="button" class="btn btn-success" data-toggle="modal" data-target="#NewExamCategory">New Exam Category</button>
                                                                 </div>
                                                                <div class="col-sm-offset-2 col-sm-2">
                                                                           <a href="#" class="btn btn-danger btn-md"  data-toggle="modal" data-target="#DeleteCategory" >Delete Category</a>
                                                                </div>
                                                      </div>
                                                    </br>
                                                    </br>
                                                      <div class="row"> 
                                                               <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Exam Name: </label>
                                                                </div>
                                                                <div class="col-sm-5">
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
                                                                 <div class="col-sm-3">
                                                                     <button type="button" class="btn btn-success" data-toggle="modal" data-target="#NewExamName">New Exam</button>
                                                                 </div>
                                                       </div>
                                               </div>
                                         	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Question : </label>
                                                    <div class="col-sm-8">
                                                   	 <textarea class="from-control" name="quest"  rows="4" cols="75" required  placeholder="Enter Question"></textarea>
                                                  </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 1 : </label>
                                                    <div class="col-sm-8">
                                                   	 <textarea class="from-control" name="op1"  rows="4" cols="75" required placeholder="Enter Option 1"></textarea>
                                                     </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 2 : </label>
                                                    <div class="col-sm-8">
                                                         <textarea class="from-control" name="op2"  rows="4" cols="75" required placeholder="Enter Option 2"></textarea>
                                                </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 3 : </label>
                                                    <div class="col-sm-8">
                                                         <textarea class="from-control" name="op3"  rows="4" cols="75" required placeholder="Enter Option 3"></textarea>
                                                     </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Option 4 : </label>
                                                    <div class="col-sm-8">
                                                         <textarea class="from-control" name="op4"  rows="4" cols="75" required placeholder="Enter Option 4"></textarea>
                                                    </div>
                                            	</div>
                                               	<div class="row form-group">
                                                    <label for="id" class="control-label col-sm-3">Answer : </label>
                                                    <div class="col-sm-4">
                                                                    <select name="ans" class="form-control" placeholder="Enter Answer">
                                                                      <option>1</option>
                                                                      <option>2</option>
                                                                      <option>3</option>
                                                                      <option>4</option>
                                                                    </select>
                                                                  </div> 
                                            	</div>
                                       <div class="col-sm-offset-6 col-sm-2">
                                            <button type="submit" class="btn btn-success"> Add </button>
					</div>
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
                                                      <div class="col-sm-4">
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
	</div><!-- Modal-->
	<div id="DeleteCategory" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
				<div class="modal-title"><h4>Delete Category</h4></div></div>
                            <div class="modal-body">
                                <form class="form-horizontal" action="DeleteCategory.jsp" name="lForm" >
                                       <div class="row ">
                                           <div class="col-lg-12 col-md-12 ">
                                            <div class="form-group">
                                                     <label for="phone" class="control-label col-sm-12">
                                                        <b>Note:</b> By Deleting a category you will be deleting all the Exams and Data(Question Paper) regarding the Exam Category!! 
                                                     </label>
                                                 </div>
                                        </div>
                                    <div class="row form-group">
                                          <div class="col-sm-4">
                                              <label for="id" class="control-label col-sm-2">Exam Category: </label>
                                         </div>
                                                         
                                                     <div class="col-sm-7">
                                                                    <select name="category" class="form-control">
                                                                      <% getCategory=db.getGetCategory();
                                                                       rs=getCategory.executeQuery();
                                                                       while(rs.next()){
                                                                        %>
                                                                      <option><%=rs.getString(1)%></option>
                                                                        <% }
                                                                        %>
                                                                    </select>
                                                       </div>  
                                                    <div class="col-sm-offset-3 col-sm-1">
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
            </div>
        
	<div id="GetPassword" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">X</button>
				</div>
                            <div class="modal-body">
                                <form class="form-horizontal" action="GetPasswordProcess.jsp" name="lForm" >
                                    <div class="row form-group">
                                                    <label for="id" class="control-label col-sm-5">Student's Incapp Id: </label>
                                                    <div class="col-sm-4">
                                                          <input type="text" class="lform form-control" name="incappid" />
                                                     </div>
                                                    <div class="col-sm-offset-3 col-sm-3">
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
     <!-- Modal to delete an exam-->
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
                                                                    
                                                                    
     <!-- End of the modal-->
        <!--/. Modal -->
    <!-- Footer -->
   <jsp:include page="footer.jsp" />
 </body>
</html>
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("Home.jsp");
    }
%>