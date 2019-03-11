<%@page import="db.DbConnect"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="ExceptionPage.jsp"%>

<%
    String examName=request.getParameter("exam");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement checkExamName=db.getCheckExamName();
     checkExamName.setString(1,examName);
    ResultSet rs=checkExamName.executeQuery();
    if(rs.next()){
    Statement st=db.getSt();
    st.executeUpdate("DELETE FROM `oca`.`exams` WHERE `examName`='"+examName+"'");
    
//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code
    st.executeUpdate("Drop TABLE `oca`.`"+exam+"`");
    session.setAttribute("msg","Exam Deleted!!");
    response.sendRedirect("AdminHome.jsp");
        }
    else{
    session.setAttribute("msg","Exam Doesn't exists!!");
        response.sendRedirect("AdminHome.jsp?msg=Exam Doesn't Exists!!");
    }
%> 
