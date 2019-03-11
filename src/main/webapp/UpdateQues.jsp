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
String q=request.getParameter("quest");
String op1=request.getParameter("op1");
String op2=request.getParameter("op2");
String op3=request.getParameter("op3");
String op4=request.getParameter("op4");
String a=request.getParameter("ans");

q=q.replace("\n","<br>");
op1=op1.replace("\n","<br>");
op2=op2.replace("\n","<br>");
op3=op3.replace("\n","<br>");
op4=op4.replace("\n","<br>");
//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code

     System.out.println("exam="+exam);
     System.out.println("q="+q);
     System.out.println("op1="+op1);
     System.out.println("op2="+op2);
     System.out.println("op3="+op3);
      int x= st.executeUpdate("update "+exam+" set ques='"+q+"',op1='"+op1+"',op2='"+op2+"',op3='"+op3+"',op4='"+op4+"',ans='"+a+"' where qid="+qid);
     System.out.println("x="+x);
     System.out.println("qid="+qid);
     String msg="Question Updated!!";
    session.setAttribute("msg",msg);
    response.sendRedirect("ViewModifyQuestion.jsp");
%>