<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DbConnect"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
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
    Statement st=db.getSt();
    PreparedStatement getDataIncappId=db.getGetDataIncappId();
    getDataIncappId.setString(1,(String)ud.get("incappId"));
    ResultSet rs=getDataIncappId.executeQuery();
    rs.next();
    String name=(String)ud.get("name");
    String incappid=(String)ud.get("incappId");
    String stringErid=(String)request.getParameter("erid");
    int erid=Integer.parseInt(stringErid);
    PreparedStatement getExamQuestion=db.getGetExamQuestion();
    getExamQuestion.setInt(1,erid);
    ResultSet rs1=getExamQuestion.executeQuery();
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
      
<%  rs1.next();
    String q=rs1.getString(7);
    String examName=rs1.getString(3);
        
//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code

    System.out.println(q);
    String a[]=new String[100];
      StringTokenizer stw = new StringTokenizer(q,"#");  
      int p=0;
     while (stw.hasMoreTokens()) {  
         a[p++]=stw.nextToken();
     }  
      %>         
        
          
            
				
        
      <div class="card">
  <table class="table">
    <thead class="card-title">
      <tr>
        <th>QuestionNo</th>
        <th>Question</th>
        <th>Your Answer</th>
        <th>Correct Answer</th>
      </tr>
    </thead> 
    <%
    for(int i=0;i<p;i++){
  %>  
   <tbody>
    
    <%
        String qid="1",ans="1",rans="1";
        int temp=0;
        StringTokenizer stt = new StringTokenizer(a[i],":");  
      int j=0;
      
     if(stt.hasMoreTokens()) {
         qid=stt.nextToken();
     }
     if(stt.hasMoreTokens()) {
         ans=stt.nextToken();
     }
     if(stt.hasMoreTokens()) {
         rans=stt.nextToken();
     }    
     
     %>
        <tr>
        <td><%=(i+1)%></td>
        <td><%
               ResultSet rst1= st.executeQuery("select * from "+exam+" where qid="+qid);
               rst1.next();
        %>
               <%=rst1.getString(2)%></td>
        <td><%
            if(ans.equals("1"))
                temp=3;
            else if(ans.equals("2"))
                temp=4;
            else if(ans.equals("3"))
                temp=5;
            else if(ans.equals("4"))
                temp=6;
             %>   
            <%=rst1.getString(temp)%>
        </td>
        <%
            if(ans.equals(rans)){
            %>
        <td class="ryt"><%
            if(rans.equals("1"))
                temp=3;
            else if(rans.equals("2"))
                temp=4;
            else if(rans.equals("3"))
                temp=5;
            else if(rans.equals("4"))
                temp=6;
             %>
            <%=rst1.getString(temp)%>
        </td><%
        }
            else{
            %>
        <td class="wrong"><%
            if(rans.equals("1"))
                temp=3;
            else if(rans.equals("2"))
                temp=4;
            else if(rans.equals("3"))
                temp=5;
            else if(rans.equals("4"))
                temp=6;
             %>
            <%=rst1.getString(temp)%>
        </td><%
        }
        %>
        </tr> 
<%
        }
%>

  </tbody>
  </table>
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
            response.sendRedirect("Home.jsp");
    }
%>
