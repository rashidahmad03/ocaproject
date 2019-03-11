<%@page import="db.DbConnect"%>
<%@page errorPage="ExceptionPage.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>

<%
    String examName=request.getParameter("exam");
    String category=request.getParameter("category");
    DbConnect db=(DbConnect)application.getAttribute("db");
    if(db==null){
    db=new DbConnect();
    application.setAttribute("db",db);
    }
    PreparedStatement checkExamName=db.getCheckExamName();
     checkExamName.setString(1,examName);
    ResultSet rs=checkExamName.executeQuery();
    if(rs.next()){
        session.setAttribute("msg","Exam Already Exists!!");
        response.sendRedirect("AdminHome.jsp");
        }
    else{
    Statement st=db.getSt();
    
//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);

System.out.println(exam);
//end of code
    st.executeUpdate("CREATE TABLE `oca`.`"+exam+"` (`qid` INT NOT NULL AUTO_INCREMENT,`Ques` VARCHAR(2000) NULL, `op1` VARCHAR(2000) NULL,`op2` VARCHAR(2000) NULL,`op3` VARCHAR(2000) NULL,`op4` VARCHAR(2000) NULL,`ans` INT NULL, PRIMARY KEY (`qid`))");
    st.executeUpdate("insert into exams values('"+examName+"','"+category+"')");
    
    session.setAttribute("msg","Exam Inserted!");
    response.sendRedirect("AdminHome.jsp");
    }
%> 
