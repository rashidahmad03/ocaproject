<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@page errorPage="ExceptionPage.jsp"%>

<!DOCTYPE html>
	<html lang="en">

            <head>
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

	</head>
<%
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
%>

	<body class="abc">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-bottom xyz navbar-light fixed-top">
      <div class="container">
	  <div><img src="http://www.incapp.in/img/incapp-logo.png" width="150" alt="incapp logo"></div>
        <a class="navbar-brand" href="#" ><h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		Certification Preparation Portal</h4></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"  aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.jsp">About</a>
            </li>
           <li class="nav-item">
              <a class="nav-link" href="contact.jsp">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
	
      <!-- Jumbotron Header -->
      <header class="jumbotron my-4 xyz">
        <a href="http://www.incapp.in/" class="btn btn-danger btn-md" >Go To Official Website</a>
      <!-- Page Features -->
      <div class="row ">

     <div class="col-lg-9 col-md-6 mb-4">
		<h3 class="display-4 text-center" style=" color: Maroon">Sign Up</h3> 
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
       		<form class="form-horizontal" action="register" method='post' enctype="multipart/form-data">
				<div class="form-group">
						<label for="phone" class="control-label col-sm-2">Name: </label>
						<div class="col-sm-8">
						<input type="text" class="form-control" name="name"/>
					</div></div>
					<div class="form-group">
						<label for="id" class="control-label col-sm-2">Incapp Id: </label>
						<div class="col-sm-8">
						<input type="text" class="form-control" name="incappid"/>
					</div></div>
					<div class="form-group">
						<label for="email" class="control-label col-sm-2">Email Id: </label>
						<div class="col-sm-8">
						<input type="email" class="form-control" name="email"/>
					</div></div>
					<div class="form-group">
						<label for="phone" class="control-label col-sm-2">Phone: </label>
						<div class="col-sm-8">
						<input type="text" class="form-control" maxlength="10" name="phone"/>
					</div></div>
					<div class="form-group">
						<label for="pwd" class="control-label col-sm-2">Photo: </label>
						<div class="col-sm-8">
					        <input type="file" name="photo" class="btn btn-success"/>
                                                </div>
					</div>
					
					<br/>
					<div class="col-sm-offset-2 col-sm-2">
					<button type="submit" class="btn btn-success"> Register </button>
					</div>
			</form>
			<br/>
		<form action="login.jsp">
			<div class="col-sm-offset-1 col-sm-4">
				<button type="submit" class="btn btn-primary">  Back </button>
			</div>
		</form>
			<br/><br/><br/>
      </div>

		
        <div class="col-lg-3 col-md-6 mb-4">
         
        </div>
	</div>
	   </header>
      <!-- /.row -->

    </div>
    <!-- /.container -->
	
    <!-- Footer -->
    <footer class="py-5 abc">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; incapp infotech pvt ltd.</p>
        <p class="m-0 text-center text-white">Designed and Developed by: Harshit Chaturvedi</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

 </body>

</html>
