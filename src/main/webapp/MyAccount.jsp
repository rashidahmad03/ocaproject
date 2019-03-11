<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page import="db.DbConnect"%>
<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="java.util.HashMap"%>

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

  
<style>
@font-face 
{
    font-family:ChaletParis;
    src: url(fonts/ChaletParis.ttf);
}
</style>

<%
    String name=(String)ud.get("name");
    String incappid=(String)ud.get("incappId");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement getDataIncappId=db.getGetDataIncappId();
    getDataIncappId.setString(1, incappid);
    ResultSet rs=getDataIncappId.executeQuery();
    rs.next();
%>

 </head>

<body class="abc">

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
      <div class="jumbotron my-4 xyz">
       <h3 class="display-4 text-center" style=" color: Maroon">My Account</h3>
       		     <div class="row">   
                <div class="col-sm-3">
                    Welcome :- <b><%=name%></b> 
                </div>
                <div class="col-sm-7">
                  </div>
            </div>
                		
                                       <%
                                       String msg=(String)session.getAttribute("msg");
                                       if(msg!=null)
                                       {
 %>
                                           <b class="msg"><%=msg%></b>
                                     <%
                                        session.setAttribute("msg",null);
                                       }
%>	
    
                </br>
             <form class="form-horizontal" action="UpdateStudent" method='post' enctype="multipart/form-data">
              
                           <div class="row">
                	<div class="col-md-6">
                	
                	
                	<div class="card">
    <img class="card-img-top" src="GetPhoto?incappid=<%=incappid%>" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title"><%=name%></h4>
      <p class="card-text"><%=rs.getString("email")%></p>
       <div class="form-group">
                            <input type="file" name="photo" class="btn btn-success"/>
                            </div>
    </div>
  </div>
                           
                            </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-group">
                                                      <div class="row"> 
                                                                 <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Incapp Id: </label>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                        <%=incappid%>
                                                                 </div>
                                                      </div>
                                               </div>
                                               <div class="form-group">
                                                      <div class="row"> 
                                                                 <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Email : </label>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                        <%=rs.getString("email")%>
                                                                 </div>
                                                      </div>
                                               </div>
                                               <div class="form-group">
                                                      <div class="row"> 
                                                                 <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Name : </label>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <input type="text" class="lform form-control" name="name" value="<%=rs.getString("name")%>"/>
                                                                 </div>
                                                      </div>
                                               </div>
                                               <div class="form-group">
                                                      <div class="row"> 
                                                                 <div class="col-sm-3">
                                                                      <label for="id" class="control-label">Phone: </label>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <input type="text" class="lform form-control" name="phone" value="<%=rs.getString("phone")%>"/>
                                                                 </div>
                                                      </div>
                                               </div>
                                            
                                        <div class="col-sm-offset-2 col-sm-2">
                                            <button type="submit" class="btn btn-success">  Update </button>
					</div>
                                 
                                       
                                </div>
                            </div>       
                    </div>
                           <label id="errorLogin" style=" color: #af2d2d"></label>
 <%
                                       String s=(String)request.getParameter("msg");
                                       if(s!=null)
                                       {
 %>
                                          <b class="msg"><%=s%></b>
                                     <%
                                       }
%>
                        <!-- row-->              
                </div>
 </form>
                        <!--?end of form tag-->
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
            response.sendRedirect("Home.jsp");
    }
%>