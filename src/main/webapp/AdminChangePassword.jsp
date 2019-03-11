<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap ad=(HashMap)session.getAttribute("admindata");
    if(ad!=null){
%>	<!DOCTYPE html>
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

    String name=(String)ad.get("name");

    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement getAdmin=db.getGetAdmin();
    getAdmin.setString(1,(String)ad.get("aid"));
    ResultSet rs=getAdmin.executeQuery();
    rs.next();
%>

 </head>

<body class="abc">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg xyz navbar-light fixed-top">
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
              <a class="nav-link" href="AdminMyAccount.jsp">MyAccount</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
	
            <br/>
      <!-- Jumbotron Header -->
      <div class="jumbotron my-4 xyz">
       <h3 class="display-4 text-center" style=" color: Maroon">My Account</h3>
       		     <div class="row">   
                <div class="col-sm-3">
                    Welcome :- <b><%=name%></b> 
                </div>
                <div class="col-sm-7">
                  </div>
            </div>
                </br>
                <div class="row">
                	<div class="col-md-6">
                            <img src="img/9.jpg" alt="MY pic" width="300"/>&nbsp
                 	</div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                 <form class="form-horizontal" action="UpdateAdminPassword.jsp" name="lForm" onsubmit="return(validate());">
                                               <div class="form-group">
                                                      <div class="row"> 
                                                                 <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Current Password: </label>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <input type="password" class="lform form-control" name="cpass" />
                                                                 </div>
                                                      </div>
                                               </div>
                                               <div class="form-group">
                                                      <div class="row"> 
                                                                 <div class="col-sm-3">
                                                                      <label for="id" class="control-label"> New Password : </label>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                        <input type="password" class="lform form-control" name="npass" />
                                                                 </div>
                                                      </div>
                                               </div>
                                               <div class="form-group">
                                                      <div class="row"> 
                                                                 <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Confirm Password: </label>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                        <input type="password" class="lform form-control" name="conpass"/>
                                                                 </div>
                                                      </div>
                                               </div>
                                        <div class="col-sm-offset-2 col-sm-2">
                                          <button type="submit" class="btn btn-success">  Update Password</button>   
					</div>
                                 </form>
                                </div>
                            </div>       
                    </div>
                                     <label id="errorLogin" style=" color: #af2d2d"></label>
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
                        <!-- row-->              
                </div>
                
<!-- /.jumbotron -->
    </div>
    <!-- /.container -->
	</div>
    <!-- Footer -->


   <jsp:include page="footer.jsp" />
    </body>
</html>
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("AdminLogin.jsp");
    }
%>


