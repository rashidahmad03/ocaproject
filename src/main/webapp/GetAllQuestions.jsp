<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="ExceptionPage.jsp"%>
    
<%
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
 Statement st=db.getSt();
 //   PreparedStatement getAllQuestions = db.getGetAllQuestions();
String examName=request.getParameter("exam");
String category=request.getParameter("category");
session.setAttribute("category",category);
session.setAttribute("examName",examName);

//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code

   //     getAllQuestions.setString(1,exam);
    //    ResultSet rs1=getAllQuestions.executeQuery();
          ResultSet rs1=st.executeQuery("select * from "+exam);
      session.setAttribute("gaqrs",rs1);    
  response.sendRedirect("ViewModifyQuestion.jsp?");
%>