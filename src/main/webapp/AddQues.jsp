<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
    
<%
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
 Statement st=db.getSt();
 PreparedStatement insertQues=db.getInsertQues();
String examName=request.getParameter("exam");
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
q=q.replace("\t","       ");
op1=op1.replace("\t","       ");
op2=op2.replace("\t","       ");
op3=op3.replace("\t","       ");
op4=op4.replace("\t","       ");

//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code
ResultSet rs1=st.executeQuery("select count(*) from "+exam);
if(rs1.next())
{
    if(rs1.getInt(1)>500)
    {
        response.sendRedirect("AdminHome.jsp?msg=Maximum Question Already Added( Max =500)!!");
    }
}
rs1=st.executeQuery("select * from "+exam+" where ques='"+q+"'");
if(rs1.next())
{   String msg="Question Already Added in "+examName+"!!";
    session.setAttribute("msg",msg);
    response.sendRedirect("AdminHome.jsp");
}
else
{
    st.executeUpdate("insert into "+exam+" (ques,op1,op2,op3,op4,ans) values('"+q+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"',"+Integer.parseInt(a)+")");
      String msg="Question  Successfully Added!!";
    session.setAttribute("msg",msg);
    response.sendRedirect("AdminHome.jsp");
}
%>