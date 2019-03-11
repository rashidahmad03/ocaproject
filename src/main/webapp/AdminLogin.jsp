
<%@page errorPage="ExceptionPage.jsp"%>
<!DOCTYPE html>
	<html lang="en">
	<head>
    
   <meta charset="utf-8">
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




<title>Preparation For Certification</title>
	<link rel="icon" type="image/png" href="img/incapp-icon.png"/>
<style>
@font-face 
{
    font-family:ChaletParis;
    src: url(fonts/ChaletParis.ttf);
}
</style>

<script>
    function validate() {
    var user = document.lForm.uid.value,
        pass=document.lForm.pass.value;
    if( user == "" && pass=="")
    {
      document.getElementById("errorLogin").innerHTML = "User Id and Password are empty!"; 
      return false;
    }
    else if(user == "" || pass=="")
    {
        if(user=="")
            document.getElementById("errorLogin").innerHTML = "User Id is empty!";
        else
            document.getElementById("errorLogin").innerHTML = "Password is empty!";
      return false;  
    }
    return true;
}
</script>

	</head>

	<body class="abc">

    <!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-bottom xyz navbar-light fixed-top"">
 <div class="container">
	  <div class="navbar-brand "><img src="images/incapp-logo.png" width="150" alt="incapp logo"></div>
        <a class="navbar-brand " href="#" >
        <div class="col align-self-center " style="text-align:center;">
        <h4>
		Preparation For Certification</h4></a>
             </div>
</nav>


    <!-- Page Content -->
    <div class="container">
	
      <!-- Jumbotron Header -->
      <header class="jumbotron my-4 xyz">
        <div class="panel panel-default officalbutton">
    <div class="panel-body"><a href="http://www.incapp.in/" class="btn btn-primary btn-block" >Go To Official Website</a></div>
  </div>
       
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
     <!-- Page Features -->
      <div class="row ">

     <div class="col-lg-6 col-md-6 mb-4">
     
     
     
     <div class="card text-center">
  <div class="card-header">
    Admin Login Form
  </div>
 <div  class="card-body">
    
  <form class="form-horizontal" action="AdminLoginProcess.jsp" name="lForm" onsubmit="return(validate());">
						<div class="form-group">
						<label for="id" class="control-label">Admin Id: </label>
						<div class="col">
						<input type="text" class="lform form-control" name="aid" />
					</div>
				</div>
			              <div class="form-group">
						<label for="pwd" class="control-label">Password: </label>
						<div class="col">
						    <input type="password" class="lform form-control" name="pass" />
					        </div>
              
    
    
  
  </div>
  </div>
  
  
  <div class="card-footer text-muted" ng-hide="islogin">
        <div class="row">
							<div class="col-sm-6">
								  <button type="submit" class="btn btn-outline-primary btn-block">  Login </button>
							</div>
							<div class="col-sm-6">
								<a href="Home.jsp" class="btn btn-primary btn-block" >Go To Student Login</a>

					
							</div>
						</div>
  </form>
  </div>
</div>
                                        <span id="errorLogin"  class="badge badge-warning"></span>
                                       
    
  </div>

	
	
     
     
     
     
     
          
                    
                                             
         

        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/oca.png" alt="OCP Pic">
            <div class="card-body">
              <h4 class="card-title">OCA</h4>
              <p class="card-text">Mock Oracle Certified Associate Exams(Topic wise and Shuffled). </p>
            </div>
          </div>
        </div>
          <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/ocp.png" alt="OCP Pic">
            <div class="card-body">
              <h4 class="card-title">OCP</h4>
              <p class="card-text">Mock Oracle Certified Professional Exams(Topic wise and Shuffled).</p>
            </div>		
          </div>
        </div>
      </div>
	   </header>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	<jsp:include page="footer.jsp" />  
  
 </body>
 
</html>
