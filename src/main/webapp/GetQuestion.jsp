<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="ExceptionPage.jsp"%>
    
<%
try{
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
 Statement st=db.getSt();
 //   PreparedStatement getAllQuestions = db.getGetAllQuestions();
//String examName=request.getParameter("exam");
String examName=(String)session.getAttribute("examName");
String category=(String)session.getAttribute("category");
String qid=request.getParameter("qid");

//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code
   
        ResultSet rs1=st.executeQuery("select * from "+exam+" where qid="+qid); 
      session.setAttribute("rs",rs1);    
  response.sendRedirect("EditQuestion.jsp");
}
catch(Exception ex){
    ex.printStackTrace();
    System.out.println("Exception="+ex);
}
%>