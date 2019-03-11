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
 PreparedStatement insertQues=db.getInsertQues();
String examName=(String)session.getAttribute("examName");
String qid=request.getParameter("qid");

//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code

      int x= st.executeUpdate("delete from "+exam+" where qid="+qid);
     String msg="Question No: "+qid+"Deleted!!";
    session.setAttribute("msg",msg);
    response.sendRedirect("ViewModifyQuestion.jsp");
%>