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
    String examName=request.getParameter("exam");
      examName="mixedexam";
//code to remove spaces between Exam Name so that proper table name can be formed
String exam="";
for(int i=0;i<examName.length();i++)
    if(examName.charAt(i)!=' ')
        exam+=examName.charAt(i);
//end of code
    String tableName=exam;
    ResultSet rs=st.executeQuery("select qid from "+tableName);
    rs.next();
    ArrayList<Integer> tq=new ArrayList<Integer>();
    while(rs.next()){
        tq.add(rs.getInt(1));
    }
    int totalQues=tq.size();
    if(false){
        String msg="total questions in database of this exam are less than 40!! The exam cannot get started !! contact Admin at Incapp!!";
        session.setAttribute("msg",msg);
        response.sendRedirect("Profile.jsp");
    }
    else{
        
          //  Collections.shuffle(tq);
            session.setAttribute("ExamQuestionSequence","");
            session.setAttribute("totalQues",totalQues);
            session.setAttribute("totalQuesArray", tq);
           // session.setAttribute("examType", examType);
            session.setAttribute("tableName", tableName);
            session.setAttribute("examName", examName);
            session.setAttribute("examScore", 0);
            int nq=20;//int nq=(totalQues-1)/2;
            session.setAttribute("nq", nq);
            session.setAttribute("min", nq-1);
            session.setAttribute("sec","60");
            session.setAttribute("qid",0);
            session.setAttribute("counter","1");
            PreparedStatement deleteResult=db.getDeleteResult();
            deleteResult.executeUpdate(); 
            response.sendRedirect("Exam.jsp");
    }
%> 

  