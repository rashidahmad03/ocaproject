<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app>
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



<meta charset="ISO-8859-1">
<title>Preparation For Certification</title>
	<link rel="icon" type="image/png" href="img/incapp-icon.png"/>
	
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
<nav class="navbar navbar-expand-lg navbar-bottom xyz navbar-light fixed-top"">
 <div class="container">
	  <div class="navbar-brand "><img src="images/incapp-logo.png" width="150" alt="incapp logo"></div>
        <a class="navbar-brand " href="#" >
        <div class="col align-self-center " style="text-align:center;">
        <h4>
		Preparation For Certification</h4></a>
             </div>
</nav>

   <div class="container">
	
      <!-- Jumbotron Header -->
     <div class="jumbotron my-4 xyz"> 
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
    <div class="row">
							<div class="col-sm-6 d-flex justify-content-center">
								<a href="#" ng-click="islogin=(islogin ? false : true)"  class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-sm-6 d-flex justify-content-center">
								<a href="#" ng-click="islogin=(islogin ? false : true)"  id="register-form-link">Register</a>
							</div>
						</div>
  </div>
 <div  class="card-body" ng-hide="islogin">
    
   <form class="form-horizontal" action="LoginProcess.jsp" name="lForm" onsubmit="return(validate());">
 
    <label for="id">Incapp Id:</label>
    <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="Incapp Id" id="id" name="uid">
      <div class="input-group-append">
        <span class="input-group-text">@incapp.in</span>
      </div>
    </div>
     <label for="pwd">Password:</label>
   <div class="input-group mb-3">
      <input type="password" class="form-control" placeholder="Incapp Id" id="pwd" name="pass">
     
    </div>
              
    
    
  </div>
  
  
  
  <div class="card-footer text-muted" ng-hide="islogin">
        <div class="row">
							<div class="col-sm-6">
								  <button type="submit" class="btn btn-outline-primary btn-block">  Login </button>
							</div>
							<div class="col-sm-6">
								<button type="reset" class="btn btn-outline-primary btn-block">  Reset </button>
					
							</div>
						</div>
  </form>
</div>
                                        <span id="errorLogin"  class="badge badge-warning"></span>
                                       
    
  </div>

	
	
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
             <p class="card-text">Mock Oracle Certified Professional Exams(Topic wise and Shuffled). </p>
           </div>
			
         </div>
       </div>
     </div>
   
     <!-- /.row -->

   </div>
   <!-- /.container -->



<!-- The Modal -->
<div class="modal" id="myModal">
<div class="modal-dialog">
<div class="modal-content">

<!-- Modal Header -->
<div class="modal-header">
<h4 class="modal-title"><div class="row">
							<div class="col-sm-6 d-flex justify-content-center">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-sm-6 d-flex justify-content-center">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div></h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
			<div class="col-lg-12">
								<form id="login-form" action="" method="post" role="form" style="display: block;">
								<div class="form-group">
									<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
								</div>
								<div class="form-group">
									<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
								</div>
								<div class="form-group text-center">
									<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
									<label for="remember"> Remember Me</label>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="" tabindex="5" class="forgot-password">Forgot Password?</a>
											</div>
										</div>
									</div>
								</div>
							</form>
               </div>
							<form id="register-form" action="" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
							</div>
							<jsp:include page="footer.jsp" />

</body>
</html>