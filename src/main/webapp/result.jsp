<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page errorPage="ExceptionPage.jsp"%>

<%
    HashMap ud=(HashMap)session.getAttribute("userdata");
    if(ud!=null){
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
    

<script language="javascript" type="text/javascript">
z=0;
if(z==0)
{ 
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";
//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";
 }
}
else ;
</script>


<%
    String name=(String)ud.get("name");
    String incappid=(String)ud.get("incappId");
    String exam=(String)session.getAttribute("examName");

    int examScore = ((Integer)session.getAttribute("examScore")).intValue();
    Integer t=(Integer)session.getAttribute("totalQues");
    int maxMarks=t.intValue()/2;
      LocalDateTime InTime = LocalDateTime.now();
%>

    </head>

<body class="abc">

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
	
            <br/>
      <!-- Jumbotron Header -->
      <div class="jumbotron my-4 xyz">
<table>
    <tr>
          <br/>
            <div class="row">   
                <div class="col-sm-3">
                    Welcome :- <b><%=name%></b> 
                </div>
                <div class="col-sm-7">   
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
   </tr>
   <tr>
            <br/>
            <div class="center">
                <div class="icenter">
                    <div class="result1">
                        Your Result: <b> <%=examScore%>/<%=maxMarks%> </b>
                    </div>
                    <div class="result2">
                        <b>Review of Exam:</b> Green blocks are right answers and Red blocks are wrong. <br/>
<%        
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    String quesList=(String)session.getAttribute("ExamQuestionSequence");
       
        PreparedStatement insertExamReport=db.getInsertExamReport();
        insertExamReport.setString(1,incappid);
        insertExamReport.setString(2,exam);
        insertExamReport.setInt(3,maxMarks);
        insertExamReport.setInt(4,examScore);
        insertExamReport.setString(5,quesList);
        insertExamReport.executeUpdate();
        PreparedStatement getResult=db.getGetResult();
        ResultSet rs=getResult.executeQuery();
        int i=1;
        while(rs.next())
        {
            if(rs.getString(1).equals(rs.getString(2)))
            {
%>
                <p class="btn btn-success btn-lg"><%=i%></p>
<%
            }
            else
            {
%>
                <p class="btn btn-danger btn-lg"><%=i%></p>
<%               
            }
            i++;
        }
       
      //  st.executeUpdate("delete from result_review");
%>
            </div>
                    
                </div>
            </div>
            
        </tr> 
       <div class="removefloat"></div>
       
        </table>     

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
            response.sendRedirect("Home.jsp");
    }
%>


